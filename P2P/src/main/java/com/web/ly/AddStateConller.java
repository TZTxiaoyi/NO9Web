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
	public int inSinProSta(@RequestBody Project projectsid,AuditingRe aRe,HttpServletResponse response,HttpServletRequest request,Employee empid){
		
		int eList=addEmployeeService.selEmployState(projectsid,aRe,request);//查询当前员工是否已经有在审批中的项目				
		return eList;
	}

			
		

	
	
	/**
	 * //修改审核记录表，添加结束时间
	 * @param aRe
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/upRecordTab")
	public int upRecordTable(@RequestBody String aRe,HttpServletResponse response,HttpServletRequest request){
		//int empid=(int)request.getSession().getAttribute("accounts3");
		//System.out.println("empid---ad-----:"+empid);
		JSON json =new JSONArray();
		Map mm=(Map)json.parseObject(aRe);
		System.out.println("---ad------dddd:"+mm.get("projectsid"));
		
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
	/**
	 * 不通过项目
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selUnProject")
	public List selUnprojectRe(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("6666666666:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> falg=addEmployeeService.selUnPassProj(projectsid);
		System.out.println("ooooooooooooooo:"+falg);
		return falg;
	}
	@ResponseBody
	@RequestMapping(value="/selEmproject")
	public int selEmployeePro(@RequestBody Project projectsid,HttpServletRequest request){
		System.out.println("---------77777:"+projectsid.getApprover());
		int eList=addEmployeeService.selApprover(projectsid, request);//查询当前员工是否已经有在审批中的项目
		return eList;
	}
}
