package com.entity.ly;

public class Project {
	int projectsid;
	int empid;//项目发起人
	int originatortype;
	int projectsstate;
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
	public int getProjectsstate() {
		return projectsstate;
	}
	public void setProjectsstate(int projectsstate) {
		this.projectsstate = projectsstate;
	}
	
}
