package com.dao.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.AuditingRe;
import com.entity.ly.Project;


public interface ProjectsDaoLy {
	List<Object> selproject();
	int upProEmployee(Project projectsid);//给项目添加一个审批人
	
	int insAuditingRe(AuditingRe aRe);//点击审核时给审核记录一个初始数据，审批人、项目序号、开始审核时间
	
	int upRecordTab(Map aRe);//修改审核记录表，添加结束时间
	
	List<Object> selPassPro(Project projectsid);//查看审核记录表
	
	List<Object> selUnpassPro(Project projectsid);
}
