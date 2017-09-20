package com.entity.zb;
/**
 * 
 * @ClassName:  ZbProjects   
 * @Description:TODO(项目查询实体类)   
 * @author: 朱彬
 * @date:   2017年9月15日 上午9:23:28   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class ZbProjects {
	private int projectsId;
	private int empId;
	private int originatorType;
	private String addTime;
	private int projectsState;
	private int approver;
	public int getProjectsId() {
		return projectsId;
	}
	public void setProjectsId(int projectsId) {
		this.projectsId = projectsId;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public int getOriginatorType() {
		return originatorType;
	}
	public void setOriginatorType(int originatorType) {
		this.originatorType = originatorType;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public int getProjectsState() {
		return projectsState;
	}
	public void setProjectsState(int projectsState) {
		this.projectsState = projectsState;
	}
	public int getApprover() {
		return approver;
	}
	public void setApprover(int approver) {
		this.approver = approver;
	}
	
}
