package com.integrosys.cms.host.eai.support;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.util.SimpleBean;

public class ReflectionUtilsTest extends TestCase {

	public void testCopyValueFromPropertyToProperty() {
		SimpleBean simpleBean = new SimpleBean();
		simpleBean.setDate(new Date());
		simpleBean.setName("HELLO WORLD");
		simpleBean.setId(12345);

		ReflectionUtils.copyValuesWithinObject(simpleBean, "id", "referenceId");
		assertEquals(simpleBean.getId(), simpleBean.getReferenceId());

		List beans = new ArrayList();
		simpleBean.setReferenceId(0);
		beans.add(simpleBean);

		simpleBean = new SimpleBean();
		simpleBean.setDate(new Date());
		simpleBean.setName("HELLO WORLD 2");
		simpleBean.setId(1234566);
		beans.add(simpleBean);

		ReflectionUtils.copyValuesWithinObjects(beans, "id", "referenceId");
		assertEquals(2, beans.size());
		for (Iterator itr = beans.iterator(); itr.hasNext();) {
			SimpleBean bean = (SimpleBean) itr.next();
			assertEquals(bean.getId(), bean.getReferenceId());
		}
	}

	public void testCopyValuesByProperties() {
		Date todayDate = new Date();

		SimpleBean source = new SimpleBean();
		source.setDate(todayDate);
		source.setName("HELLO WORLD");
		source.setId(12345);
		source.setReferenceId(12345);

		SimpleBean target = new SimpleBean();
		target.setDate(todayDate);
		target.setName("HELLO WORLD 2");
		target.setId(1234566);
		target.setReferenceId(1234566);

		ReflectionUtils.copyValuesByProperties(source, target, Arrays.asList(new String[] { "id", "referenceId" }));

		assertEquals("HELLO WORLD 2", target.getName());
		assertEquals(todayDate, target.getDate());
		assertEquals(12345, target.getId());
		assertEquals(12345, target.getReferenceId());

		source.setId(777);
		source.setReferenceId(777);

		ReflectionUtils.copyValuesByProperties(source, target, Arrays.asList(new String[] { "name" }));

		assertEquals("HELLO WORLD", target.getName());
		assertEquals(todayDate, target.getDate());
		assertEquals(12345, target.getId());
		assertEquals(12345, target.getReferenceId());

	}
}
