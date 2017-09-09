package com.web.ly;

import java.util.HashMap;
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
import com.alibaba.fastjson.JSONObject;
import com.entity.ly.DetailAuditing;
import com.entity.ly.OrganizationsLy;
import com.entity.ly.Project;
import com.entity.ly.RepayAuditing;
import com.entity.ly.SinAuditing;
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
	 * selSinauditings:个人信息审核
	 * @param projectsid
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/singleAu")
	public List selSinauditings(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> sList = SinAuditingService.selSinAuditing(projectsid);
		return sList;		
	}
	/**
	 * selDetailAu:个人项目信息审核
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/proDetail")
	public List selDetailAu(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> dList=SinAuditingService.selDeAudi(projectsid);
		//System.out.println("----------00:"+dList);
		return dList;
	}
	/** selecOrgasAudi
	 * seleOrgaAuditing:机构信息审核
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value="/OraAuditing")
	public List seleOrgaAuditing(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> oList= OrganizationsServiceLy.selOraAuditing(projectsid);
		//System.out.println("```````````333:"+oList);
		return oList;
	}
	/**
	 * 机构信息审核记录
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/orAuditingRecord")
	public List selOrAudiRecord(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> rList = OrganizationsServiceLy.selecOrgasAudi(projectsid);
		//System.out.println("zzzzzzzzzzzzz:"+rList);
		return rList;
	}
	/**
	 * 回报审核合记录
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/repayAuditingRecord")
	public List selReAuRecord(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		List<Object> reList = RepayService.selReturnRec(projectsid);
		return reList;
	}
	/**
	 * 点击审核后，修改项目状态
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/upSinProState")
	public int upSinProSta(@RequestBody Project projectsid,HttpServletResponse response){
		//System.out.println("------------6666:"+projectsid.getProjectsid());
		response.setHeader("content-type","text/html;charset=UTF-8");
		int dList = SinAuditingService.upSinProSt(projectsid);
		//System.out.println("rrrrrrrrr:"+dList);
		return dList;
	}
	/**
	 * 先删除个人信息审核记录表中的数据
	 * 再将新记录插数据库
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/inseSinAudi")
	public int insSinProAuRecord(@RequestBody SinAuditing projectsid,HttpServletResponse response){
		//System.out.println("1:"+projectsid.getProjectsid()+"2:"+projectsid.getIdcard()+"3:"+projectsid.getOriginatorname()+"4："+projectsid.getAddress()+"5:"+projectsid.getTelephone()+"6:"+projectsid.getCardimage1());
		response.setHeader("content-type","text/html;charset=UTF-8");
		int delrecord =SinAuditingService.deProRecord(projectsid);
		int insrecord =SinAuditingService.inProRecord(projectsid);
		return insrecord;
	}
	/**
	 * 删除原有项目信息审核记录之后，再次审核之后，把新审核记录插入项目信息审核记录表
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/inProAuRecord")
	public int inProAuditingRe(@RequestBody DetailAuditing projectsid,HttpServletResponse response){
		response.setHeader("content-type","text/html;charset=UTF-8");
		int delrecord=SinAuditingService.deProjectRe(projectsid);
		int insrecord=SinAuditingService.inProAuRe(projectsid);
		return insrecord;
	}
	/**
	 * 删除原有项目回报审核记录，再次审核之后，把新审核记录插入项目回报审核记录表
	 * @param projectsid
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/inProReturn")
	public int intProReturnRecord(@RequestBody RepayAuditing auditing,HttpServletResponse response){
		
		response.setHeader("content-type","text/html;charset=UTF-8");
	//	int delrecord=SinAuditingService.deProReRecord(projectsid);
		//System.out.println(projectsid.getProjectsid()+"--"+projectsid.getReturn_type()+"--"+projectsid.getOffer_money()+"--"+projectsid.getReturn_title()+"--"+projectsid.getReturn_content()+"--"+projectsid.getLimit_people()+"--"+projectsid.getReturn_time()+"--"+projectsid.getImage());
		JSON json =new JSONArray();
		
		Map mm=(Map)json.toJSON(auditing);
		System.out.println("MM:"+mm);
		int insrecord=SinAuditingService.inProReturnRer(mm);
		
		return 0;
	}
	
}
