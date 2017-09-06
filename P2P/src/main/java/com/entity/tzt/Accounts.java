package com.entity.tzt;

/**
 * 
* @ClassName: Accounts 
* @Description: TODO
* @date 2017年9月1日 下午4:49:21 
*
 */
public class Accounts {
	Integer accountsid;
	String accounts;
	String passwords;
	Integer empid;
	Integer roleid;
	Integer accountsstate;
	
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
	}
	public Integer getAccountsid() {
		return accountsid;
	}
	public void setAccountsid(Integer accountsid) {
		this.accountsid = accountsid;
	}
	public String getAccounts() {
		return accounts;
	}
	public void setAccounts(String accounts) {
		this.accounts = accounts;
	}
	public String getPasswords() {
		return passwords;
	}
	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public Integer getAccountsstate() {
		return accountsstate;
	}
	public void setAccountsstate(Integer accountsstate) {
		this.accountsstate = accountsstate;
	}
	
}
