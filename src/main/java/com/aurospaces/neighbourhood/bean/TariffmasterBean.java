package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class TariffmasterBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String assetcode ;
protected String assetdescription ;
protected String rate ;
protected String alloweddiscount ;
protected String remarks ;
protected String status ;
protected String tariffStatus ;

public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getCreatedTime()
{
  return createdTime;
}
public void setCreatedTime(final Date createdTime)
{
  this.createdTime = createdTime;
}
public String getTariffStatus() {
	return tariffStatus;
}
public void setTariffStatus(String tariffStatus) {
	this.tariffStatus = tariffStatus;
}
public Date getUpdatedTime()
{
  return updatedTime;
}
public void setUpdatedTime(final Date updatedTime)
{
  this.updatedTime = updatedTime;
}
public String getAssetcode()
{
  return assetcode;
}
public void setAssetcode(final String assetcode)
{
  this.assetcode = assetcode;
}
public String getAssetdescription()
{
  return assetdescription;
}
public void setAssetdescription(final String assetdescription)
{
  this.assetdescription = assetdescription;
}
public String getRate()
{
  return rate;
}
public void setRate(final String rate)
{
  this.rate = rate;
}
public String getAlloweddiscount()
{
  return alloweddiscount;
}
public void setAlloweddiscount(final String alloweddiscount)
{
  this.alloweddiscount = alloweddiscount;
}
public String getRemarks()
{
  return remarks;
}
public void setRemarks(final String remarks)
{
  this.remarks = remarks;
}
public String getStatus()
{
  return status;
}
public void setStatus(final String status)
{
  this.status = status;
}

}