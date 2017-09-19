package com.entity.tzt;

public class Profit {
	private Integer profitid;
	private Integer projectsid;
	private Integer capitalflow;
	private float capital;
	private String starttime;
	private String endtime;
	private String operator;
	public Integer getProfitid() {
		return profitid;
	}
	public void setProfitid(Integer profitid) {
		this.profitid = profitid;
	}
	public Integer getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(Integer projectsid) {
		this.projectsid = projectsid;
	}
	public Integer getCapitalflow() {
		return capitalflow;
	}
	public void setCapitalflow(Integer capitalflow) {
		this.capitalflow = capitalflow;
	}
	public float getCapital() {
		return capital;
	}
	public void setCapital(float capital) {
		this.capital = capital;
	}
	
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
}
