package com.entity.ljl;



public class ProjectsLjl {
	
	int projectsid;
	int empid;
	int originatortype;//1个人2机构0未选
	String addtime;
	int projectsstate;//3草稿箱45
	int approver;
	int protypeid;
	public int getApprover() {
		return approver;
	}
	public void setApprover(int approver) {
		this.approver = approver;
	}
	public int getProtypeid() {
		return protypeid;
	}
	public void setProtypeid(int protypeid) {
		this.protypeid = protypeid;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getOriginatortype() {
		return originatortype;
	}
	public void setOriginatortype(int originatortype) {
		this.originatortype = originatortype;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public int getProjectsstate() {
		return projectsstate;
	}
	public void setProjectsstate(int projectsstate) {
		this.projectsstate = projectsstate;
	}
	
	
}
