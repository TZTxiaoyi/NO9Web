package com.web.tzt;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.tzt.Accounts;
import com.service.tzt.LoginServicetzt;

@Controller
@RequestMapping("/ProWeb")
public class LoginController {
	
	
	/**
	 * 登录业务接口
	 */
	@Autowired
	LoginServicetzt loginServicetzt;
		/**
		 * 
		* @Title: register 注册功能 
		* @param @param accounts  页面传输的账号信息
		* @param @param response    设定文件 
		* @return void    返回类型 
		* @throws
		 */
	@RequestMapping("/register.do")
	@ResponseBody
	public void register(@RequestBody Accounts accounts, HttpServletResponse response){
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		System.out.println(accounts.getAccounts());
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
	* @Title: login 登录功能
	* @param @param accounts
	* @param @param response    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public void login(@RequestBody Accounts accounts , HttpServletResponse response){
		System.out.println(accounts.getAccounts());
		response.setCharacterEncoding("UTF-8");
		response.setHeader("contentType", "text/JSON;charset=UTF-8");
		 
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
	
}
