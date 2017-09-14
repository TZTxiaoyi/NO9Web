package com.web.zb;

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
import com.alibaba.fastjson.JSONArray;
import com.entity.tzt.Employee;
import com.entity.zb.Employeezb;
import com.service.zb.EmployeeService;

/**
 * 
 * @ClassName:  EmployeeController   
 * @Description:TODO(员工的控制层)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:17:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class EmployeeController {
	
	@Autowired
	EmployeeService eService;
	/**
	 * 
	* @Title: addEmployee
	* @Description: TODO(添加员工的方法)
	* @param @param str
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/addEmployee.do")
	public void addEmployee(@RequestBody String str,HttpServletResponse resp){
		System.out.println(str);
		Employeezb employee = JSON.parseObject(str,Employeezb.class);
		System.out.println(employee.getUserName());
		int flag = -1;
		flag = eService.addEmployee(employee);
		System.out.println("flag="+flag);
		try{
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/**
	 * 
	* @Title: updateEmployee
	* @Description: TODO(更新员工的方法)
	* @param @param emp
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@ResponseBody
	@RequestMapping("/updateEmployee.do")
	public String updateEmployee(@RequestBody String emp){
		System.out.println("+++++++"+emp);
		JSON json=new JSONArray();		
		Map map=(Map) json.parseObject(emp);
		System.out.println("_____map++++"+map);
		int flag = eService.updateEmployee(map);
		if(flag>0){
			return "true";
		}else{
			return "false";
		}
		
	}
	/**
	 * 
	* @Title: queryEmployee
	* @Description: TODO(查询员工的方法)
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryEmployee.do")
	public void queryEmployee(@RequestBody Employee employee ,HttpServletResponse resp){
		System.out.println("--------------------------"+employee.getEmpid());
		resp.setCharacterEncoding("utf-8");
		List<Object> listemp = eService.queryEmployee(employee.getEmpid());
		JSON json = new JSONArray(listemp);
		System.out.println(json.toString());
		try {
			resp.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
