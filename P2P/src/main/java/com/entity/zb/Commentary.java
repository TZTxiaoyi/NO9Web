package com.entity.zb;
/**
 * 
 * @ClassName:  Commentary   
 * @Description:TODO(���۱��ʵ����)   
 * @author: ���
 * @date:   2017��9��4�� ����4:06:47   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public class Commentary {
	private int commentaryId;
	private int projectsId;
	private int empId;
	private String content;
	private String time;
	public int getCommentaryId() {
		return commentaryId;
	}
	public void setCommentaryId(int commentaryId) {
		this.commentaryId = commentaryId;
	}
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
