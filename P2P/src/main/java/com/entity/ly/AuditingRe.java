package com.entity.ly;

import java.util.Date;

import oracle.sql.DATE;

public class AuditingRe {
	int recordtable_id;
	int empid;//审批人
	int projectsid;//项目序号
	int recordtable_status;//审核是否通过
	Date recordtable_begintime;//审核开始时间
	Date recordtable_endtime;//审核结束时间
	private String reason;
	
	public int getRecordtable_id() {
		return recordtable_id;
	}
	public void setRecordtable_id(int recordtable_id) {
		this.recordtable_id = recordtable_id;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getRecordtable_status() {
		return recordtable_status;
	}
	public void setRecordtable_status(int recordtable_status) {
		this.recordtable_status = recordtable_status;
	}
	public Date getRecordtable_begintime() {
		return recordtable_begintime;
	}
	public void setRecordtable_begintime(Date recordtable_begintime) {
		this.recordtable_begintime = recordtable_begintime;
	}
	public Date getRecordtable_endtime() {
		return recordtable_endtime;
	}
	public void setRecordtable_endtime(Date recordtable_endtime) {
		this.recordtable_endtime = recordtable_endtime;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}	
}
