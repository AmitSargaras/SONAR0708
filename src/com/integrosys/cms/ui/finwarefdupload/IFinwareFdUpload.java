package com.integrosys.cms.ui.finwarefdupload;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts.upload.FormFile;

import com.integrosys.base.techinfra.ejbsupport.IValueObject;

/**
 * @author  Abhijit J. 
 */
public interface IFinwareFdUpload extends Serializable, IValueObject {


    public FormFile getFileUpload();
    public void setFileUpload(FormFile fileUpload);

}
