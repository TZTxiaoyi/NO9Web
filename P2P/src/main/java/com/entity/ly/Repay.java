package com.entity.ly;

//项目回报实体类
public class Repay {
	int pro_returnid;
	int projectsid;//项目id
	int return_type;//回报类型
	int offer_money;//回报金额
	String return_title;//回报标题
	String return_content;//回报内容
	String limit_people;//限制人数
	String return_time;//回报时间
	String image;//回报实物图
	public int getPro_returnid() {
		return pro_returnid;
	}
	public void setPro_returnid(int pro_returnid) {
		this.pro_returnid = pro_returnid;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getReturn_type() {
		return return_type;
	}
	public void setReturn_type(int return_type) {
		this.return_type = return_type;
	}
	public int getOffer_money() {
		return offer_money;
	}
	public void setOffer_money(int offer_money) {
		this.offer_money = offer_money;
	}
	public String getReturn_title() {
		return return_title;
	}
	public void setReturn_title(String return_title) {
		this.return_title = return_title;
	}
	public String getReturn_content() {
		return return_content;
	}
	public void setReturn_content(String return_content) {
		this.return_content = return_content;
	}
	public String getLimit_people() {
		return limit_people;
	}
	public void setLimit_people(String limit_people) {
		this.limit_people = limit_people;
	}
	public String getReturn_time() {
		return return_time;
	}
	public void setReturn_time(String return_time) {
		this.return_time = return_time;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
