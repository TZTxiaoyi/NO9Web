package com.dao.zb;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.zb.Commentarys;
/**
 * 
 * @ClassName:  CommentaryDao   
 * @Description:TODO(���۵�Dao�ӿ�)   
 * @author: ���
 * @date:   2017��9��4�� ����4:12:29   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */

public interface CommentaryDao {
	public List<Object> queryCommentary();
	public int addCommentary(Commentarys commentary);
	public int deleteCommentary(int id);
}
