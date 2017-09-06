package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.zb.Employeezb;
import com.service.zb.EmployeeService;

/**
 * 
 * @ClassName:  EmployeeController   
 * @Description:TODO(�������Ͽ��Ʋ�)   
 * @author: ���
 * @date:   2017��9��1�� ����7:43:34   
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
	* @Description: TODO(�������ϵ���ӷ���)
	* @param @param str
	* @param @param resp    �趨�ļ�
	* @return void    ��������
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
	* @Description: TODO(���������޸ķ���)
	* @param @param emp
	* @param @param resp    �趨�ļ�
	* @return void    ��������
	* @throws
	 */
	@RequestMapping("/updateEmployee.do")
	public void updateEmployee(@RequestBody Employeezb emp,HttpServletResponse resp){
		System.out.println(emp.getEmpName());
		int flag = eService.updateEmployee(emp);
		try {
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: queryEmployee
	* @Description: TODO(��ѯ����)
	* @param @param resp    �趨�ļ�
	* @return void    ��������
	* @throws
	 */
	@RequestMapping("/queryEmployee.do")
	public void queryEmployee(HttpServletResponse resp){
		System.out.println("--------------------------");
		resp.setCharacterEncoding("utf-8");
		List<Object> listemp = eService.queryEmployee();
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
