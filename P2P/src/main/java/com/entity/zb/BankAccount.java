package com.entity.zb;
/**
 * 
 * @ClassName:  BankAccount   
 * @Description:TODO(银行账号的实体类)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午2:35:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class BankAccount {
	private int bankAccountId;
	private int empId;
	private String bankAccounts;
	private String bankName;
	public int getBankAccountId() {
		return bankAccountId;
	}
	public void setBankAccountId(int bankAccountId) {
		this.bankAccountId = bankAccountId;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getBankAccounts() {
		return bankAccounts;
	}
	public void setBankAccounts(String bankAccounts) {
		this.bankAccounts = bankAccounts;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
}
