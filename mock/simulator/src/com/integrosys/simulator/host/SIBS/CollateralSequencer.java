package com.integrosys.simulator.host.SIBS;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

/**
 * <p>
 * Sequencer to obtain the next sequence for the dependent object of the
 * collateral master, such as insurance policy.
 * <p>
 * Every single call to retrieve next sequence for the dependent object will
 * result in flusing the collateral id sequence map into the file system. So
 * that even the program is closed, the sequence map can be loaded next time
 * when program is started and this sequencer is loaded.
 * @author Chong Jun Yong
 * 
 */
public class CollateralSequencer {

	/** key is the collateral id, value is the current insurance policy sequence */
	private static final Map<Long, Integer> collateralIdCurrentInsurancePolicySeqeuenceMap = new ConcurrentHashMap<Long, Integer>();

	private static final String[] availableSequence = new String[] { "insr" };

	/** mutex object for anything doing on the sequence name */
	private static final Map<String, Object> sequenceNameMutexMap = new ConcurrentHashMap<String, Object>();

	/**
	 * to indicate whether the collateral id - sequence map get loaded on
	 * startup, to prevent double called in {@link #load()}
	 */
	private static boolean loadedOnStartUp = false;

	static {
		// load the collateral id - sequence value from file system
		load();
	}

	/**
	 * Get insurance policy sequence based on the collateral id supplied.
	 * @param collateralId collateral id (sibs)
	 * @return next available sequence for the insurance policy
	 */
	public static Integer getInsurancePolicyNextSequenceByCollateralId(Long collateralId) {
		Integer currentSequence = collateralIdCurrentInsurancePolicySeqeuenceMap.get(collateralId);
		if (currentSequence == null) {
			currentSequence = new Integer(1);
		}
		else {
			int seq = currentSequence.intValue();
			seq++;
			currentSequence = new Integer(seq);
		}

		collateralIdCurrentInsurancePolicySeqeuenceMap.put(collateralId, currentSequence);

		synchronized (getMutexBySequenceName("insr")) {
			flush(collateralIdCurrentInsurancePolicySeqeuenceMap, "insr");
		}

		return currentSequence;
	}

	/**
	 * Flush the collateral id - sequence map to the file system, based on the
	 * 'filename' supplied.
	 * @param collateralIdSequenceMap collateral id - sequence map
	 * @param name name of the sequence, eventually will be the file name to
	 *        store the collateral id - sequence map
	 */
	private static void flush(Map<Long, Integer> collateralIdSequenceMap, String name) {
		File sequenceFile = new File(name);
		try {
			FileOutputStream fos = new FileOutputStream(sequenceFile);
			PrintStream ps = new PrintStream(fos);

			for (Iterator<Map.Entry<Long, Integer>> itr = collateralIdSequenceMap.entrySet().iterator(); itr.hasNext();) {
				Entry<Long, Integer> entry = itr.next();
				ps.println(entry.getKey() + "=" + entry.getValue());
			}

			fos.close();
		}
		catch (FileNotFoundException e) {
			throw new IllegalStateException("cannot find the file [" + sequenceFile + "] in the file system.");
		}
		catch (IOException e) {
			IllegalStateException ise = new IllegalStateException("failed to close the stream");
			ise.initCause(e);
			throw ise;
		}
	}

	private synchronized static void load() {
		if (loadedOnStartUp) {
			return;
		}

		for (int i = 0; i < availableSequence.length; i++) {
			File sequenceFile = new File(availableSequence[i]);
			try {
				FileInputStream stream = new FileInputStream(sequenceFile);
				BufferedReader br = new BufferedReader(new InputStreamReader(stream));
				String line = br.readLine();
				if (line != null) {
					doLoad(availableSequence[i], line);
					line = br.readLine();
				}
			}
			catch (FileNotFoundException ex) {
				// continue with next sequence
				continue;
			}
			catch (IOException ex) {
				System.err.println("[error] CollateralSequencer - Error when accessing IO, " + ex);
				continue;
			}
		}

		loadedOnStartUp = true;
	}

	private static void doLoad(String sequenceName, String line) {
		if (sequenceName.equals("insr")) {
			String[] keyValue = line.split("=");
			Long key = new Long(keyValue[0]);
			Integer sequence = new Integer(keyValue[1]);
			collateralIdCurrentInsurancePolicySeqeuenceMap.put(key, sequence);
		}
	}

	private static Object getMutexBySequenceName(String seq) {
		Object mutex = sequenceNameMutexMap.get(seq);
		if (mutex == null) {
			mutex = new Object();
			sequenceNameMutexMap.put(seq, mutex);
		}

		return mutex;
	}
}
