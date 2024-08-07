/*
 * Generated by XDoclet - Do not edit!
 */
package com.integrosys.cms.app.propertyindex.bus;

/**
 * Title: CLIMS 
 * Description: Data object for EBPropertyIdxDistrict.
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Andy Wong 
 * Date: Jan 15, 2008
 */

public class OBPropertyIdxDistrict implements IPropertyIdxDistrict
{
   private long propertyIdxDistrictCodeId ;
   private long propertyIdxItemId;
   private java.lang.String districtCode;
   private java.lang.String status;

   public OBPropertyIdxDistrict()
   {
   }

   public long getPrimaryKey() {
     return  getPropertyIdxDistrictCodeId();
   }

   public long getPropertyIdxDistrictCodeId()
   {
      return this.propertyIdxDistrictCodeId;
   }
   public void setPropertyIdxDistrictCodeId( long propertyIdxDistrictCodeId )
   {
      this.propertyIdxDistrictCodeId = propertyIdxDistrictCodeId;
   }

   public long getPropertyIdxItemId()
   {
      return this.propertyIdxItemId;
   }
   public void setPropertyIdxItemId( long propertyIdxItemId )
   {
      this.propertyIdxItemId = propertyIdxItemId;
   }

   public java.lang.String getDistrictCode()
   {
      return this.districtCode;
   }
   public void setDistrictCode( java.lang.String districtCode )
   {
      this.districtCode = districtCode;
   }

   public java.lang.String getStatus()
   {
      return this.status;
   }
   public void setStatus( java.lang.String status )
   {
      this.status = status;
   }

   public String toString()
   {
      StringBuffer str = new StringBuffer("{");

      str.append("propertyIdxDistrictCodeId=" + getPropertyIdxDistrictCodeId() + " " + "districtCode=" + getDistrictCode() + " " + "status=" + getStatus());
      str.append('}');

      return(str.toString());
   }
   
	public boolean equals (Object obj)
    {
        if (obj == null)
            return false;
        else if (!(obj instanceof OBPropertyIdxDistrict))
            return false;
        else {
            if (((OBPropertyIdxDistrict)obj).getDistrictCode().equals( this.getDistrictCode() ) )
                return true;
            else
                return false;
        }
    }
}
