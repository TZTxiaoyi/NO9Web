package com.entity.zb;

public class Commentarys {
	int commentary_id;
    int projectsid; 
    int empid; 
    String content;
    String time;
	public int getCommentary_id() {
		return commentary_id;
	}
	public void setCommentary_id(int commentary_id) {
		this.commentary_id = commentary_id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
