package com.web.zb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.zb.CommentaryService;

/**
 * 
 * @ClassName:  CommentaryController   
 * @Description:TODO(评论的控制层)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:15:28   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class CommentaryController {
	@Autowired
	CommentaryService cs;
	/**
	 * 
	* @Title: queryCommentary
	* @Description: TODO(查询评论)
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryCommentary.do")
	public void queryCommentary(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		List<Object> list = cs.queryCommentary();
		JSON json = new JSONArray(list);
		System.out.println(json.toString());
		try {
			resp.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: deleteCommentary
	* @Description: TODO(删除评论)
	* @param @param COMMENTARY_ID
	* @param @return    设定文件
	* @return boolean    返回类型
	* @throws
	 */
	@ResponseBody
	@RequestMapping("/deleteCommentary.do")
	public boolean deleteCommentary(@RequestParam(value="COMMENTARY_ID") Integer COMMENTARY_ID){
		System.out.println("---------------------"+COMMENTARY_ID);
		cs.deleteComment(COMMENTARY_ID);
		return true;
	}
	
}
