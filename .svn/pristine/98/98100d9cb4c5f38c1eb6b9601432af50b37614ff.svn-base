package com.integrosys.simulator.host.base.helper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class TCPUtil {
	public String readfile(String inputDir) throws Exception {
		Properties properties = new Properties();
		properties.load(new FileInputStream("build.properties"));
		String projectRoot = properties.getProperty("project.root");

		File f = new File(projectRoot + File.separator + inputDir);
		InputStream is = null;
		byte[] bytes = null;
		StringBuffer buffer = new StringBuffer();
		String line = null;

		try {
			is = new FileInputStream(f);
			BufferedReader in = new BufferedReader(new InputStreamReader(is));
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}

			//
			// long length = f.length();
			// bytes = new byte[(int)length];
			// is.read(bytes);
		}
		catch (Exception e) {
			throw new Exception("Cannot read the file !!!!! Please put the rigth file into right directory");
		}
		finally {
			try {
				if (is != null) {
					is.close();
					is = null;
				}

			}
			catch (Exception e) {
				throw new Exception("Cannot read the file !!!!! Please put the rigth file into right directory");
			}
		}

		return buffer.toString();

	}
}