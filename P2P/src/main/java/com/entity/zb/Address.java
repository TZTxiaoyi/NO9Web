package com.entity.zb;
/**
 * 
 * @ClassName:  Address   
 * @Description:TODO(地址的实体类)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午2:57:51   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class Address {

	private int AddressId;//地址id
	private String Name;//收货人姓名
	private String Phone;//联系电话
	private int postCodes;//邮政编码
	private String AddressInfo;//详细地址
	private int empid;//员工id
	
	
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getPostCodes() {
		return postCodes;
	}
	public void setPostCodes(int postCodes) {
		this.postCodes = postCodes;
	}
	
	public int getAddressId() {
		return AddressId;
	}
	public void setAddressId(int addressId) {
		AddressId = addressId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	

	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getAddressInfo() {
		return AddressInfo;
	}
	public void setAddressInfo(String addressInfo) {
		AddressInfo = addressInfo;
	}
	
}
