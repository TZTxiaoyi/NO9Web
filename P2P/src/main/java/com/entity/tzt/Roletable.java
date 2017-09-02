package com.entity.tzt;

import java.security.Principal;

import javax.management.loading.PrivateClassLoader;

/**
 * 
* @ClassName: Roletable 
* @Description: 角色表实体类
* @date 2017年9月1日 下午4:46:53 
*
 */
public class Roletable {
	private Integer roleid;
	private String rolename;
	private String rolestate;
	
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRolestate() {
		return rolestate;
	}
	public void setRolestate(String rolestate) {
		this.rolestate = rolestate;
	}
	
}
