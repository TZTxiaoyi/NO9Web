package com.web.tzt;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.tzt.Accounts;
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
	* @throws
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public void login(@RequestBody Accounts accounts , HttpServletResponse response,HttpServletRequest request){
		//System.out.println(accounts.getAccounts());
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		HttpSession session = request.getSession();
		System.out.println(accounts.getAccounts());
		session.setAttribute("accounts", accounts.getAccounts()); 
		System.out.println(JSON.toJSONString(loginServicetzt.login(accounts)));
	
			try {
				response.getWriter().write(loginServicetzt.login(accounts));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
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
	
}
