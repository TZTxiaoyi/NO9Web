package com.entity.ly;

public class ProIndetail {
	int pdid; //项目详情id
	int projectsid;//项目id
	String title;//项目标题
	String goal;//筹款目的
	String projects_place;//项目地点
	int financing;//筹资金额
	int financing_day;//筹资天数
	String cover;//封面
	public int getPdid() {
		return pdid;
	}
	public void setPdid(int pdid) {
		this.pdid = pdid;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getProjects_place() {
		return projects_place;
	}
	public void setProjects_place(String projects_place) {
		this.projects_place = projects_place;
	}
	public int getFinancing() {
		return financing;
	}
	public void setFinancing(int financing) {
		this.financing = financing;
	}
	public int getFinancing_day() {
		return financing_day;
	}
	public void setFinancing_day(int financing_day) {
		this.financing_day = financing_day;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	
}
