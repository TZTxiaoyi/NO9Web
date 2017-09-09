package com.dao.ly;

import java.util.List;
import java.util.Map;

import com.entity.ly.DetailAuditing;
import com.entity.ly.Project;
import com.entity.ly.RepayAuditing;
import com.entity.ly.SinAuditing;

public interface SinAuditingDao {
	List<Object> selSinAu(Project projectsid);
	List<Object> selDeAuditing(Project projectsid);
	int upSinProSt(Project projectsid);//点击审核项目时，修改项目状态 
	int deSinProAuRe(SinAuditing projectsid);//插入个人信息记录之前先将个人信息记录审核表中的删除
	int inSinProAuRe(SinAuditing projectsid);//插入个人信息审核记录
	int deProAuRe(DetailAuditing projectsid);//审核项目信息，点击保存先删除表中该项目之前有的数据
	int inProAuRecord(DetailAuditing projectsid);//插入审核项目信息记录
	int deProAuReturn(RepayAuditing projectsid);//插入回报审核之前，先将原有审核记录删除
	int inProReturnRe(Map auditing);//插入回报审核记录
}
