package com.integrosys.cms.app.npaTraqCodeMaster.bus;

import java.util.Date;

public class OBNpaTraqCodeMaster implements INpaTraqCodeMaster,Cloneable{


	
	private long id;
	private long versionTime;

	
	private String npaTraqCode;
	private String securityType;
	private String securitySubType;
	private String propertyTypeCodeDesc;
	
	private String operationName;
	private String status;
	
	private long masterId = 0l;
	private String deprecated;
	private Date creationDate;
	private String createBy;
	private Date lastUpdateDate;
	private String lastUpdateBy;
	private String cpsId;
	
	
	public String getNpaTraqCode() {
		return npaTraqCode;
	}
	public void setNpaTraqCode(String npaTraqCode) {
		this.npaTraqCode = npaTraqCode;
	}
	public String getSecurityType() {
		return securityType;
	}
	public void setSecurityType(String securityType) {
		this.securityType = securityType;
	}
	public String getSecuritySubType() {
		return securitySubType;
	}
	public void setSecuritySubType(String securitySubType) {
		this.securitySubType = securitySubType;
	}
	public String getPropertyTypeCodeDesc() {
		return propertyTypeCodeDesc;
	}
	public void setPropertyTypeCodeDesc(String propertyTypeCodeDesc) {
		this.propertyTypeCodeDesc = propertyTypeCodeDesc;
	}
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getVersionTime() {
		return versionTime;
	}
	public void setVersionTime(long versionTime) {
		this.versionTime = versionTime;
	}
	
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getMasterId() {
		return masterId;
	}
	public void setMasterId(long masterId) {
		this.masterId = masterId;
	}
	public String getDeprecated() {
		return deprecated;
	}
	public void setDeprecated(String deprecated) {
		this.deprecated = deprecated;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public String getLastUpdateBy() {
		return lastUpdateBy;
	}
	public void setLastUpdateBy(String lastUpdateBy) {
		this.lastUpdateBy = lastUpdateBy;
	}
	public String getCpsId() {
		return cpsId;
	}
	public void setCpsId(String cpsId) {
		this.cpsId = cpsId;
	}
	
}
