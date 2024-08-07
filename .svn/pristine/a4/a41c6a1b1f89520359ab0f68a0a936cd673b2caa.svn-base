package com.integrosys.cms.host.stp.mapper;

import com.integrosys.cms.host.stp.bus.OBStpField;
import com.integrosys.cms.host.stp.bus.OBStpTrans;
import com.integrosys.cms.host.stp.common.StpCommonException;
import com.integrosys.cms.app.collateral.bus.type.property.OBPropertyCollateral;
import com.integrosys.cms.app.collateral.bus.type.document.OBDocumentCollateral;
import com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeaircraft.OBSpecificChargeAircraft;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.base.techinfra.validation.Validator;
import com.integrosys.base.businfra.authentication.AS400AuthenticationManager;
import com.integrosys.base.businfra.authentication.AuthenticationManager;
import com.integrosys.base.businfra.authentication.CMSAuthenticationManager;
import com.integrosys.base.businfra.login.ICredentials;
import com.integrosys.base.businfra.currency.Amount;
import junit.framework.TestCase;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.Validate;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.HashMap;
import java.math.BigDecimal;

/**
 * Created by IntelliJ IDEA.
 * User: USER
 * Date: Sep 10, 2008
 * Time: 4:21:55 PM
 * To change this template use File | Settings | File Templates.
 */
public class ReflectMethodTest extends TestCase {

    public void testGeneral() throws Exception {
        Class aClass = Class.forName("com.integrosys.cms.host.stp.bus.OBStpField");
        Object obStpField = (Object) aClass.newInstance();
        assertEquals("com.integrosys.cms.host.stp.bus.OBStpField", obStpField.getClass().getName());

        String classField = "com.integrosys.cms.host.stp.bus.OBStpField.setClassName";
        int lastIdx = StringUtils.lastIndexOf(classField, '.');
        String className = StringUtils.substring(classField, 0, lastIdx);
        String classAttr = StringUtils.substring(classField, lastIdx + 1, classField.length());

        assertEquals(className, "com.integrosys.cms.host.stp.bus.OBStpField");
        assertEquals(classAttr, "setClassName");

    }

    public void testReflectMethod() throws Exception {
        OBSpecificChargeAircraft aircraft = new OBSpecificChargeAircraft();
        aircraft.setSCIReferenceNote("ANADGFAHSA GHASAS");

        Class aClass = aircraft.getClass();//Class.forName("com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeaircraft.OBSpecificChargeAircraft");

        Method[] methods = aClass.getMethods();
        Method invokeMethod = null;

        for (int i = 0; i < methods.length; i++) {
            Method method = methods[i];
//            System.out.println("method "+ i + " = " + method.getName());

            if(method.getName().equals("getSCIReferenceNote")){
                System.out.println("SCI REF NOTE="+method.invoke(aircraft, null));
                break;
            }
        }

        System.out.println(Class.forName("com.integrosys.cms.app.collateral.bus.OBCollateral").isAssignableFrom(aircraft.getClass()));

    }

    public void testAssignable() throws Exception{
        System.out.println("authMgr = " + AS400AuthenticationManager.class.isAssignableFrom(AuthenticationManager.class));

        OBPropertyCollateral obPropertyCollateral=new OBPropertyCollateral();
        OBCollateral obCollateral = new OBCollateral();

        assertTrue(obCollateral.getClass().isAssignableFrom(obPropertyCollateral.getClass()));
        Object obj = Class.forName("java.lang.Boolean").newInstance();
//        assertTrue(obPropertyCollateral.getClass().isAssignableFrom(obCollateral.getClass()));
    }

    public void testHashMapOps(){
        Map map = new HashMap();
        OBStpTrans obStpTrans = new OBStpTrans();
        obStpTrans.setTrxType("13");
        obStpTrans.setReferenceId(new Long(12456));
        map.put(obStpTrans.getTrxType(), obStpTrans);

        obStpTrans = new OBStpTrans();
        obStpTrans.setTrxType("455");
        obStpTrans.setReferenceId(new Long(12457));
        map.put(obStpTrans.getTrxType(), obStpTrans);

        map.remove("123");
//        assertEquals(map.size(), 1);
        map.remove("456");
//        assertEquals(map.size(), 1);
    }

    public void testValidator(){
        ICredentials credential = null;
        Validate.notNull(credential, "'credential' to be authenticated must not be null.");

        System.out.println("test string=" +String.valueOf(null));
    }

    public void testAmountCompare(){
        Amount amount = new Amount(0, "MYR");

        System.out.println(amount.compareTo(new Double(0)));
        double a =0;
        System.out.println(new Character(' ') + "XX");

        BigDecimal bigDecimal = new BigDecimal(1276253617.909999999999999999999999999999);
        System.out.println(bigDecimal.toString());
    }
    

}