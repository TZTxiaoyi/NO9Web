package com.web.ly;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.aop.AuthenticatedAnnotationHandler;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dao.ly.UsersDao;
import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;
import com.entity.tzt.Roletable;
import com.service.ly.queryAccountService;

@Controller
@RequestMapping(value="/login")
public class LoginControllerLy {
	@Autowired
	UsersDao usersDao;
	@Autowired
	queryAccountService queryaccountservice;
	@RequestMapping(value="/logCon")
	public String login_back(Accounts accounts,HttpServletResponse response,HttpServletRequest request){
		//获得当前用户对象
		response.setContentType("text/html;charset=UTF-8");//设置返回编码格式
			System.out.println("accounts and password----:"+accounts.getAccounts()+"---"+accounts.getPasswords());
		
			
		Subject subject=SecurityUtils.getSubject();
		AuthenticationToken token=new UsernamePasswordToken(accounts.getAccounts(),accounts.getPasswords());
			System.out.println("11111");
		try {
			subject.login(token);
		} catch (UnknownAccountException e) {
			// TODO: handle exception
			System.out.println("6666666666*****");
			System.out.println("aaasss"+e.getMessage());
			/*try {
				
				response.getWriter().write(JSON.toJSONString("没有该用户!"));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				
			}*/
			return "redirect:P2P/jsp/background/log.jsp";
		}catch(Exception e2){
			
			System.out.println(e2.getMessage());//用户密码错误
			
			/*try {				
				response.getWriter().write(JSON.toJSONString("用户密码错误!"));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				System.out.println("aaa"+e1.getMessage());				
			}*/
			System.out.println("ssss55");
			return "redirect:P2P/jsp/background/log.jsp";
		}
		try {
			Accounts user =(Accounts) subject.getPrincipal();//获得授权时放入的用户
			Accounts accounts3=usersDao.queryAccounts(accounts);
			System.out.println("accounts3----------:"+accounts3.getEmpid()+";acc:"+accounts3.getAccounts());
			request.getSession().setAttribute("accounts3", accounts3.getAccounts());
			request.getSession().setAttribute("empid", accounts3.getEmpid());//将员工编号放到session中
			
			System.out.println("ssss22"); 
			return "redirect:http://localhost:9088/P2P/jsp/background/index.jsp";
			/*response.getWriter().write(JSON.toJSONString("登录成功!"));
			response.getWriter().flush();
			response.getWriter().close();*/
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println("ssss"+e1.getMessage());
			return "redirect:P2P/jsp/background/log.jsp";
		}
		
		
		
	}

	private Object getText(String string) {
		// TODO Auto-generated method stub
		return null;
	}
	@ResponseBody
	@RequestMapping(value="/powers")
	public List<Object> queryAllPower(@RequestBody Roletable roletable,HttpServletResponse response,HttpServletRequest request){
		System.out.println(000000000000000000);
		
		System.out.println("rolename-----:"+roletable.getRoleid());
		Roletable roleid=queryaccountservice.queryRolename(roletable);
		
		List<Object> qList=queryaccountservice.queryPowers(roleid);
		System.out.println("qwers-----------:"+qList);
		
		return qList;
	}
	
	@ResponseBody
	@RequestMapping(value="insertpowers")
	public int insertPowers(@RequestBody String string){
		
		return queryaccountservice.insPowers(string);
	}
}
