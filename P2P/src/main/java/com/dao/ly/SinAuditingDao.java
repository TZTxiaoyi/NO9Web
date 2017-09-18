package com.dao.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.DetailAuditing;
import com.entity.ly.OrgAuditing;
import com.entity.ly.Project;
import com.entity.ly.SinAuditing;

public interface SinAuditingDao {
	List<Object> selSinAu(Project projectsid);
	List<Object> selDeAuditing(Project projectsid);
	int upSinProSt(Project projectsid);//点击审核项目时，修改项目状态 （个人）
	
	
	int inSinProAuRe(SinAuditing projectsid);//修改个人信息审核记录
	int inOraProAuRe(OrgAuditing projectsid);//修改机构信息审核记录
	int inProAuRecord(DetailAuditing projectsid);//修改审核项目信息记录
	
	int inProReturnRe(Map auditing);//修改回报审核记录
	
	List<Object> selProType(Project projectsid);//根据项目序号，查询该项目属于个人还是机构
	
	int deSinProState(Project projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（1）
	int deOrProState(Project projectsid);////在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（1）
	int deProIndetailState(Project projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（2）
	int deProDescribeState(Project projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（3）
	int deProReturnState(Project projectsid);//在所有项目里点击审核,如果该项目是之前审核没通过的删除原来的审核记录（4）
	
	int inSinProState(Project projectsid);//在所有项目里点击审核，给个人信息审核表一个默认 未审核 的初始值（1）
	int inOrProState(Project projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（1）
	int inProIndetailState(Project projectsid);//在所有项目里点击审核，给 项目信息 审核表一个默认 未审核 的初始值（2）
	int inProDescribeState(Project projectsid);//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
	int inProReturnState(Project projectsid);//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
	
	List<Object> selProCont(Project projectsid);//查询项目描述中的文本
}
