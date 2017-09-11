package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.zb.NewszbService;

/**
 * 
 * @ClassName:  NewszbController   
 * @Description:TODO(私信的控制层)   
 * @author: 朱彬
 * @date:   2017年9月7日 上午11:04:56   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class NewszbController {
	@Autowired
	NewszbService ns;
	/**
	 * 
	* @Title: queryNewszb
	* @Description: TODO(查询方法)
	* @param     设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryNewszb.do")
	public void queryNewszb(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		List<Object> lnew = ns.queryNewszb();
		JSON json = new JSONArray(lnew);
		System.out.println("------>"+json.toString());
		try {
			resp.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
