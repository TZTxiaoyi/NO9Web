package com.web.ly;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.ly.AuditingRe;
import com.entity.ly.Project;
import com.entity.ly.SinAuditing;
import com.entity.tzt.Employee;
import com.service.ly.AddEmployeeService;
import com.service.ly.SinAuditingService;

import oracle.sql.DATE;

@Controller
@RequestMapping(value="/AddState")
public class AddStateConller{
	@Autowired
	SinAuditingService SinAuditing;
	@Autowired
	AddEmployeeService addEmployeeService;
	/**
	 * 
	 * @param projectsid:项目序号
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/inseProState")
	public void inSinProSta(@RequestBody Project projectsid,AuditingRe aRe,HttpServletResponse response,HttpServletRequest request,Employee empid){
		Map map =(Map) request.getSession().getAttribute("accountsinfo");		
			//System.out.println("ssssss"+map);
		List list=(List)map.get("resultAccounts");
		Map ss=(Map)list.get(0);
		int ee= (int) ss.get("EMPID");//获取员工id
		//empid.setEmpid(ee);
		projectsid.setApprover(ee);//将员工id放入项目对象中
		
		aRe.setEmpid(ee);//将员工id放入审核记录对象中
		aRe.setProjectsid(projectsid.getProjectsid());//将项目序号放入审核记录对象中
		aRe.setRecordtable_begintime(new Date());//将当前时间放入审核记录对象中
		
		addEmployeeService.insAudiRecord(aRe);
			//System.out.println("ssssddd"+empid.getEmpid());
		
			
		
		int emp=addEmployeeService.upProEmplo(projectsid);//给项目添加一个审批人
		
		/*int flag=SinAuditing.selProTy(projectsid);//根据项目序号，查询该项目属于个人还是机构
			//System.out.println("-----------aaa:"+flag);
		if (flag==1) {
			int sin=SinAuditing.inserSinSt(projectsid);//在所有项目里点击审核，给个人信息审核表一个默认 未审核 的初始值	（1）		
		}else{
			int org=SinAuditing.inserOrSt(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（1）
		}
		int pro2=SinAuditing.insertProInSt(projectsid);//在所有项目里点击审核，给机构信息审核表一个默认 未审核 的初始值（2）
		int pro3=SinAuditing.inserProDeSt(projectsid);//在所有项目里点击审核，给 项目描述 审核表一个默认 未审核 的初始值（3）
		int pro4=SinAuditing.inserProReSt(projectsid);//在所有项目里点击审核，给 项目回报  审核表一个默认 未审核 的初始值（4）
*/	}
	
	
	/**
	 * //修改审核记录表，添加结束时间
	 * @param aRe
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/upRecordTab")
	public int upRecordTable(@RequestBody String aRe,HttpServletResponse response){
		JSON json =new JSONArray();
		Map mm=(Map)json.parseObject(aRe);
		System.out.println("---------dddd:"+mm.get("projectsid"));
		mm.put("recordtable_endtime", (new Date()));
		System.out.println("--------ssd:"+mm);
		response.setHeader("content-type","text/html;charset=UTF-8");
		int upre=addEmployeeService.upRecTable(mm);
		return upre;
	}
	/**
	 * //查看审核记录表
	 * @param aRe
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selPassProject")
	public List selPassProject(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println();
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> list=addEmployeeService.selPassProj(projectsid);
		System.out.println("_--------list:"+list);
		return list;
	}
	/**
	 * 根据项目序号 查询项目属于类型
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selProType")
	public int selProjectType(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("6666666666:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		int flag=SinAuditing.selProTy(projectsid);
		return flag;
	}
	@ResponseBody
	@RequestMapping(value="selUnProject")
	public List selUnprojectRe(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("6666666666:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> falg=addEmployeeService.selUnPassProj(projectsid);
		System.out.println("ooooooooooooooo:"+falg);
		return falg;
	}
}
