package com.web.ly;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ly.Project;
import com.entity.ly.SinAuditing;
import com.service.ly.SinAuditingService;

@Controller
@RequestMapping(value="/AddState")
public class AddStateConller{
	@Autowired
	SinAuditingService SinAuditing;
	
	/**
	 * 
	 * @param projectsid:项目序号
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/inseProState")
	public void inSinProSta(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("-------"+projectsid);
		response.setHeader("content-type","text/html;charset=UTF-8");
		int flag=SinAuditing.selProTy(projectsid);//根据项目序号，查询该项目属于个人还是机构
		System.out.println("-----------aaa:"+flag);
		if (flag==1) {
			int sin=SinAuditing.inserSinSt(projectsid);//在所有项目里点击审核，给个人信息审核表一个默认 未审核 的初始值	（1）		
		}else{
			int org=SinAuditing.inserOrSt(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（1）
		}
		int pro2=SinAuditing.insertProInSt(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（2）
		int pro3=SinAuditing.inserProDeSt(projectsid);//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
		int pro4=SinAuditing.inserProReSt(projectsid);//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
	}
	
}
