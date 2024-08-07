package com.integrosys.cms.host;
import com.ibm.as400.access.AS400;
import com.ibm.as400.access.AS400SecurityException;

import java.io.IOException;

public class AS400AuthTest {
    public static void main(String args[]) {
        String login = "sa_maker1";
        AS400 iSeries = new AS400("172.28.252.1", login);
        int pwdExp = 0;

        try {
            iSeries.changePassword("abc123", "sa_maker10");
//            if (iSeries.authenticate(login, login) == true) {
//                System.out.println("AS400 user verified.");
//            }
        } catch (AS400SecurityException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            if (e.getReturnCode() == 7) {
                pwdExp = 1;
            }
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

//        try {
//            if (pwdExp == 1) {
//                iSeries.changePassword("abc123", "sa_maker1");
//                System.out.println("AS400 user password refresh.");
//            }
//        } catch (AS400SecurityException e) {
//            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//        } catch (IOException e) {
//            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//        }
    }
}


