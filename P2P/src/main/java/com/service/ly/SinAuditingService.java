package com.service.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.DetailAuditing;
import com.entity.ly.Project;
import com.entity.ly.RepayAuditing;
import com.entity.ly.SinAuditing;
/**
 * 
 * @author luccy
 *
 */
public interface SinAuditingService {
	public List<Object> selSinAuditing(Project projectsid);//项目个人信息审核
	
	public List<Object> selDeAudi(Project projectsid);//项目信息审核
	public int upSinProSt(Project projectid);//点击审核项目时，修改项目状态 
	public int deProRecord(SinAuditing projectsid);//插入个人信息记录之前先将个人信息记录审核表中的删除
	public int inProRecord(SinAuditing projectsid);//插入个人信息审核记录
	public int deProjectRe(DetailAuditing projectsid);//审核项目信息，点击保存先删除表中该项目之前有的数据
	public int inProAuRe(DetailAuditing projectsid);//插入审核项目信息记录
	public int deProReRecord(RepayAuditing projectsid);//插入回报审核之前，先将原有审核记录删除
	public int inProReturnRer(Map auditing);//插入回报审核记录
}
