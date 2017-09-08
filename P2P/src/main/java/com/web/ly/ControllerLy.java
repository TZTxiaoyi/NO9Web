package com.web.ly;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.scripting.xmltags.VarDeclSqlNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;
import com.service.ly.OrganizationsServiceLy;
import com.service.ly.ProIndetailService;
import com.service.ly.RepayService;
import com.service.ly.SinAuditingService;
import com.service.ly.SingleProjectServiceLy;
@Controller
@RequestMapping(value="/project")
public class ControllerLy {
	@Autowired
	SingleProjectServiceLy auditingServiceLy;
	@Autowired
	OrganizationsServiceLy OrganizationsServiceLy;
	@Autowired
	ProIndetailService ProIndetailService;
	@Autowired
	RepayService RepayService;
	@Autowired 
	SinAuditingService SinAuditingService;
	
	
	/**
	 * selaudit:查询所有个人项目（未审核）
	 * @param response
	 */
	@RequestMapping(value="/pro")
	public void selaudit(HttpServletResponse response){
		//System.out.println("public________");
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> aList = auditingServiceLy.selectpro();
		JSON json =new JSONArray(aList);
		
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * seleOrgas:查询所有机构项目（未审核）
	 * @param response
	 */
	@RequestMapping(value="/orga")
	public void seleOrgas(HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> oList= OrganizationsServiceLy.selecOrgas();
		JSON json = new JSONArray(oList);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selcproject:查询所有项目
	 * @param response
	 */
	@RequestMapping(value="/jects")
	public void selcproject(HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> pList=auditingServiceLy.selprojects();
		JSON json=new JSONArray(pList);
		//System.out.println("json----------:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selpro：项目具体信息
	 * @param projectsid:项目序号
	 * @param response
	 */
	@RequestMapping(value="/indetail")
	public void selpro(@RequestBody String projectsid,HttpServletResponse response){
		//System.out.println("-------------"+projectsid);
		JSON jsons=new JSONArray();
		Map mm=(Map)jsons.parseObject(projectsid);
		//System.out.println("---------"+mm);
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> iList=ProIndetailService.selProI(mm);
		JSON json=new JSONArray(iList);
		//System.out.println("json----------:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selDes：项目描述控制层
	 * @param projectsid:项目序号
	 * @param response
	 */
	@RequestMapping(value="/describe")
	public void selDes(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("projectsid-----:"+projectsid.getProjectsid());
		
		//JSON jsons = new JSONArray();
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> dList=ProIndetailService.selInde(projectsid);
		//System.out.println("________:"+dList);
		JSON json=new JSONArray(dList);
		//System.out.println("json----------:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selAuditng：发起人信息审核
	 * @param projectsid：项目序号
	 * @param response
	 */
	@RequestMapping(value="/sinAuditing")
	public void selAuditng(@RequestBody Project projectsid,HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		//System.out.println("projectsid-----:"+projectsid.getProjectsid());
		List<Object> sList=auditingServiceLy.selsingle(projectsid);
		JSON json=new JSONArray(sList);
		//System.out.println("json----------:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selRepay:项目回报控制层
	 * @param projectsid:项目序号
	 * @param response
	 */
	@RequestMapping(value="/repay")
	public void selRepay(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("ttttttttttt:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> rList=RepayService.selReturn(projectsid);
		JSON json=new JSONArray(rList);
		System.out.println("8888888888:"+json);
		try {
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * selSinauditings:个人项目审核
	 * @param projectsid
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/singleAu")
	public List selSinauditings(@RequestBody Project projectsid,HttpServletResponse response){
		System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> sList = SinAuditingService.selSinAuditing(projectsid);
		return sList;		
	}
	/*@ResponseBody
	@RequestMapping(value="/")
	public List*/
}
