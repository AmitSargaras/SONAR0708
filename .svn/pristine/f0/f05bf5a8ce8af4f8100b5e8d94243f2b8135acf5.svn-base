package com.integrosys.base.techinfra.test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.mockejb.EntityDatabase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EnhancedEntityDatabaseImpl implements EntityDatabase {

	private static Logger logger = LoggerFactory.getLogger(EnhancedEntityDatabaseImpl.class);

	private Map entityTypes = Collections.synchronizedMap(new HashMap());

	public EnhancedEntityDatabaseImpl() {
	}

	public void add(Class homeIfaceClass, Object pk, Object entity) {
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("Adding entity for home [").append(homeIfaceClass.getName()).append("] ");
		strBuf.append("with PK [").append(pk).append("] to entity storage");

		logger.debug(strBuf.toString());

		Map entities = (Map) entityTypes.get(homeIfaceClass.getName());
		if (entities == null) {
			entities = Collections.synchronizedMap(new HashMap());
			entityTypes.put(homeIfaceClass.getName(), entities);
		}
		entities.put(pk, entity);
	}

	public void clear() {
		entityTypes.clear();
	}

	public Object find(Class homeIfaceClass, Object pk) {
		Object entity = null;

		Map entities = (Map) entityTypes.get(homeIfaceClass.getName());
		if (entities != null) {
			entity = entities.get(pk);
		}

		return entity;
	}

	/**
	 * Get all remote or local interface object by supplying ejb home class
	 * 
	 * @param ejbHomeClass ejb home class
	 * @return all remote or local interface objects in array
	 */
	public Object[] getAllObjectsByEjbHomeClass(Class ejbHomeClass) {
		Map entities = (Map) entityTypes.get(ejbHomeClass.getName());

		if (entities != null) {
			return entities.values().toArray();
		}

		return null;
	}

}
