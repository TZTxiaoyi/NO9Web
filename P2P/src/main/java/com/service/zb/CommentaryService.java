package com.service.zb;

import java.util.List;

import com.entity.zb.Commentarys;
/**
 * 
 * @ClassName:  CommentaryService   
 * @Description:TODO(���۵�Service�ӿ�)   
 * @author: ���
 * @date:   2017��9��4�� ����4:16:44   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface CommentaryService {
	public List<Object>queryCommentary();
	public int addCommentary(Commentarys commentary);
	public int deleteComment(int id);
}
