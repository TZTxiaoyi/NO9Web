package com.entity.zb;
/**
 * 
 * @ClassName:  Address   
 * @Description:TODO(�ջ���ַ��ʵ����)   
 * @author: ���
 * @date:   2017��8��31�� ����7:43:21   
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
