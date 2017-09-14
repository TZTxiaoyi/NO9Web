package com.web.tzt;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.tzt.Accounts;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonAnyFormatVisitor;
import com.service.tzt.LoginServicetzt;

@Controller
@RequestMapping("/ProWeb")
public class LoginController {
	
	
	/**
	 * 鐧诲綍涓氬姟鎺ュ彛
	 */
	@Autowired
	LoginServicetzt loginServicetzt;
		/**
		 * 
		* @Title: register 娉ㄥ唽鍔熻兘 
		* @param @param accounts  椤甸潰浼犺緭鐨勮处鍙蜂俊鎭�
		* @param @param response    璁惧畾鏂囦欢 
		* @return void    杩斿洖绫诲瀷 
		* @throws
		 */
	@RequestMapping("/register.do")
	@ResponseBody
	public void register(@RequestBody Accounts accounts, HttpServletResponse response){
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		System.out.println(accounts.getAccounts()+"-"+accounts.getPasswords());
		if(loginServicetzt.register(accounts)>0){
			try {
				response.getWriter().write(JSON.toJSONString("ok"));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	}
	
	/**
	 * 
	* @Title: login 鐧诲綍鍔熻兘
	* @param @param accounts
	* @param @param response    璁惧畾鏂囦欢 
	* @return void    杩斿洖绫诲瀷 
	* @throws mark
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public String  login(@RequestBody Accounts accounts , HttpServletResponse response,HttpServletRequest request){
		//System.out.println(accounts.getAccounts());
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		HttpSession session = request.getSession();
		
		session.setAttribute("accounts", accounts.getAccounts());
		System.out.println("------------:::"+session.getAttribute("accounts"));
		 JSONObject resultinfo= JSON.parseObject(loginServicetzt.login(accounts));
		System.out.println(loginServicetzt.login(accounts));
		if (resultinfo.get("resultType").equals("true")){
			session.setAttribute("accountsinfo", resultinfo);
			
		}
			return JSON.toJSONString(resultinfo);
	}
	/**
	 * 方法功能说明：更新账号信息  
	 * 创建：2017年9月9日 by TZT  
	 * @参数： @param str
	 * @参数： @param resp      
	 * @return void     
	 * @throws
	 */
	@RequestMapping("/updateAccounts.do")
	public void updateAccounts(@RequestBody String str,HttpServletResponse resp){
		System.out.println("=========="+str);
				JSON json=new JSONArray();		
				Map map=(Map)json.parse(str);
				System.out.println("-------"+map);
				int flag = loginServicetzt.updateAccounts(map);
				try {
					resp.getWriter().flush();
					resp.getWriter().close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	
	@RequestMapping("/backlogin.do")
	@ResponseBody
	public String  backlogin(@RequestBody Accounts accounts , HttpServletResponse response,HttpServletRequest request){
		//System.out.println(accounts.getAccounts());
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		//System.out.println("--------------aaaa:"+accounts.getAccounts());
		HttpSession session = request.getSession(); 
		JSONObject resultinfo= JSON.parseObject(loginServicetzt.login(accounts));
		System.out.println(loginServicetzt.login(accounts));
		if (resultinfo.get("resultType").equals("true")){
			session.setAttribute("accountsinfo", resultinfo);
		}
			return JSON.toJSONString(resultinfo);
	}
	
}
