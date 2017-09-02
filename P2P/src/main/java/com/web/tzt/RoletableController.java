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
import com.entity.tzt.Roletable;
import com.service.tzt.RoleTableServicetzt;

@Controller
@RequestMapping("/back")
public class RoletableController {

		//角色模块业务接口注入
		@Autowired
		RoleTableServicetzt roleTableServicetzt;
		
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
}
