package com.entity.ly;
/**
 * 项目详情审核实体类
 * @author luccy
 *
 */
public class DetailAuditing{
	int id; //项目详情id
	int projectsid;//项目id
	int title;//项目标题
	int goal;//筹款目的
	int projects_place;//项目地点
	int financing;//筹资金额
	int financing_day;//筹资天数
	int cover;//封面
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getTitle() {
		return title;
	}
	public void setTitle(int title) {
		this.title = title;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getProjects_place() {
		return projects_place;
	}
	public void setProjects_place(int projects_place) {
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
	public int getCover() {
		return cover;
	}
	public void setCover(int cover) {
		this.cover = cover;
	}
	
}
