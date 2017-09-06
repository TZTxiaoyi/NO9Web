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
 * @Description:TODO(���۵Ŀ��Ʋ�)   
 * @author: ���
 * @date:   2017��9��4�� ����4:22:38   
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
	* @Description: TODO(��ѯ���۵ķ���)
	* @param @param resp    �趨�ļ�
	* @return void    ��������
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
	* @Description: TODO(ɾ�����۵ķ���)
	* @param @return    �趨�ļ�
	* @return boolean    ��������
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
