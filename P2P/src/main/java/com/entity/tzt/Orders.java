package com.entity.tzt;

import com.entity.zb.Address;

public class Orders {
	private Integer ordid;
	private Integer empid;
	private Integer projectsid;
	private float paymoney;
	private Integer fraction;
	private Integer ordstatus;
	private Integer proreturnid;
	private String ordertime;
	public Integer getOrdid() {
		return ordid;
	}
	public void setOrdid(Integer ordid) {
		this.ordid = ordid;
	}
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
	}
	public Integer getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(Integer projectsid) {
		this.projectsid = projectsid;
	}
	public float getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(float paymoney) {
		this.paymoney = paymoney;
	}
	public Integer getFraction() {
		return fraction;
	}
	public void setFraction(Integer fraction) {
		this.fraction = fraction;
	}
	public Integer getOrdstatus() {
		return ordstatus;
	}
	public void setOrdstatus(Integer ordstatus) {
		this.ordstatus = ordstatus;
	}
	public Integer getProreturnid() {
		return proreturnid;
	}
	public void setProreturnid(Integer proreturnid) {
		this.proreturnid = proreturnid;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	
}
