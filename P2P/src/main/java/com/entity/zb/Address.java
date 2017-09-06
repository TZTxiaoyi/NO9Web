package com.entity.zb;
/**
 * 
 * @ClassName:  Address   
 * @Description:TODO(收货地址的实体类)   
 * @author: 朱彬
 * @date:   2017年8月31日 下午7:43:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class Address {

	private int AddressId;
	private String Name;
	private int Phone;
	private int postCodes;
	private String AddressInfo;
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
	public int getPhone() {
		return Phone;
	}
	public void setPhone(int phone) {
		Phone = phone;
	}
	
	
	public String getAddressInfo() {
		return AddressInfo;
	}
	public void setAddressInfo(String addressInfo) {
		AddressInfo = addressInfo;
	}
	
}
