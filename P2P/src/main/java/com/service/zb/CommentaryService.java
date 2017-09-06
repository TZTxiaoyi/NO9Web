package com.service.zb;

import java.util.List;

import com.entity.zb.Commentary;
/**
 * 
 * @ClassName:  CommentaryService   
 * @Description:TODO(评论的Service接口)   
 * @author: 朱彬
 * @date:   2017年9月4日 下午4:16:44   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface CommentaryService {
	public List<Object>queryCommentary();
	public int addCommentary(Commentary commentary);
	public int deleteComment(int id);
}
