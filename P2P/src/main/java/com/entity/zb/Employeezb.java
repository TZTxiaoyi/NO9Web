package com.entity.zb;
/**
 * 
 * @ClassName:  Employeezb   
 * @Description:TODO(员工的实体类)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:02:51   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class Employeezb {
	private int EmpId;//编号
	private String UserName;//用户名
	private String EmpName;//真实名字
	private String IdCard;//身份证号码
	private String Sex;//性别
	private int Age;//年龄
	private String Address;//地址ַ
	private int TelePhone;//电话
	private float Balance;//余额
	private int EmpState;//状态״̬
	
	
	public String getIdCard() {
		return IdCard;
	}
	public void setIdCard(String idCard) {
		IdCard = idCard;
	}
	public int getEmpId() {
		return EmpId;
	}
	public void setEmpId(int empId) {
		EmpId = empId;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getEmpName() {
		return EmpName;
	}
	public void setEmpName(String empName) {
		EmpName = empName;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	
	public int getTelePhone() {
		return TelePhone;
	}
	public void setTelePhone(int telePhone) {
		TelePhone = telePhone;
	}
	public float getBalance() {
		return Balance;
	}
	public void setBalance(float balance) {
		Balance = balance;
	}
	public int getEmpState() {
		return EmpState;
	}
	public void setEmpState(int empState) {
		EmpState = empState;
	}
	
}
