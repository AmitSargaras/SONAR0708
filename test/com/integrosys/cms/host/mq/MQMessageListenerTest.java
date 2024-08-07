package com.integrosys.cms.host.mq;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.listener.DefaultMessageListenerContainer;
import org.springframework.test.AbstractSingleSpringContextTests;

import javax.jms.MessageListener;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Apr 20, 2010
 * Time: 7:15:52 PM
 * To change this template use File | Settings | File Templates.
 */
public class MQMessageListenerTest extends AbstractSingleSpringContextTests {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    protected String[] getConfigLocations() {
        return new String[]{
                "/mq/AppContext_Master.xml",
                "/AppContext_Services.xml"};
    }

    public void onSetUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        super.onSetUp();
    }

    public void testListener() throws Exception{
        MQJmsSender jmsSender = (MQJmsSender) getApplicationContext().getBean("defaultJmsSender");
        jmsSender.sendMesage("hello world", null);
        Thread.sleep(10000);
        logger.debug("listening for 10 seconds before exit");
    }

}
