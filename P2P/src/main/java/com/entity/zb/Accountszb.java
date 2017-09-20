package com.entity.zb;
/**
 * 
 * @ClassName:  Accounts   
 * @Description:TODO(Account 实体类)   
 * @author: 朱彬
 * @date:   2017年9月14日 下午2:35:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class Accountszb {
	private Integer accountsid;
	private String accounts;
	private String passwords;
	private Integer empid;
	private Integer roleid;
	private Integer accountsstate;
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
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
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
