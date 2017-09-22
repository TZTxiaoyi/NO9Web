package com.web.tzt;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;
import com.entity.tzt.Roletable;
import com.service.tzt.RoleTableServicetzt;
import com.serviceimpl.tzt.AccountsServicetztImpl;

@Controller
@RequestMapping("/back")
public class RoletableController {

		//角色模块业务接口注入
		@Autowired
		RoleTableServicetzt roleTableServicetzt;
		@Autowired
		AccountsServicetztImpl AccountsServicetztImpl;
		
		/**
		 * 方法功能说明：查询所有角色信息  
		 * 创建：2017年9月4日 by TZT  
		 * @参数： @param response      
		 * @return void     
		 * @throws
		 */
		@RequestMapping("/queryRoleTable.do")
		public void queryRoleTable(HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			System.out.println(JSON.toJSONString(roleTableServicetzt.queryRoletable()));
				try {
					response.getWriter().write(roleTableServicetzt.queryRoletable());
					response.getWriter().flush();
					response.getWriter().close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		/**
		 * 
		 * 方法功能说明：  增加角色
		 * 创建：2017年9月4日 by TZT  
		 * @参数： @param roletable
		 * @参数： @param response      
		 * @return void     
		 * @throws
		 */
		@RequestMapping("/addRoleTable.do")
		@ResponseBody
		public void addRoleTable(@RequestBody Roletable roletable, HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			try {
				response.getWriter().write(roleTableServicetzt.addRoletable(roletable));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/**
		 * 
		 * 方法功能说明：  账号查询功能
		 * 创建：2017年9月4日 by TZT  
		 * @参数： @param accounts 账号信息实体类
		 * @参数： @param response
		 * @参数： @return      
		 * @return String     
		 * @throws
		 */
		@RequestMapping("/queryAccountsTable.do")
		@ResponseBody
		public String addRoleTable(@RequestBody Accounts accounts, HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			return JSON.toJSONString(AccountsServicetztImpl.queryAccountsTable(accounts));
		}
	
		/**
		 * 
		 * 方法功能说明：  查询用户详细信息
		 * 创建：2017年9月4日 by TZT  
		 * @参数： @param employee
		 * @参数： @param response
		 * @参数： @return      
		 * @return String     
		 * @throws
		 */
		@RequestMapping("/queryEmployee.do")
		@ResponseBody
		public String queryEmployee(@RequestBody Employee employee,HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			System.out.println(JSON.toJSONString(AccountsServicetztImpl.queryEmployee(employee)));
			return JSON.toJSONString(AccountsServicetztImpl.queryEmployee(employee));
		}
		/**
		 * 
		 * 方法功能说明：   更新账号信息
		 * 创建：2017年9月6日 by TZT  
		 * @参数： @param accounts
		 * @参数： @param response
		 * @参数： @return      
		 * @return String     
		 * @throws
		 */
		@RequestMapping("/updateAccounts.do")
		@ResponseBody
		public String updateAccounts(@RequestBody Accounts accounts,HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			return AccountsServicetztImpl.updateAccounts(accounts);
			
		}
		
		/**
		 * 方法功能说明：  更新角色修改操作
		 * 创建：2017年9月6日 by TZT  
		 * @参数： @param roletable
		 * @参数： @param response
		 * @参数： @return      
		 * @return String     
		 * @throws
		 */
		@RequestMapping("/updateRoletable.do")
		@ResponseBody
		public String updateRoletable(@RequestBody Roletable roletable,HttpServletResponse response){
			response.setCharacterEncoding("UTF-8");
			response.setHeader("contentType", "text/JSON;charset=UTF-8");
			return roleTableServicetzt.updateRoletable(roletable);
			
		}
}
