package com.dao.zb;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.zb.Commentarys;
/**
 * 
 * @ClassName:  CommentaryDao   
 * @Description:TODO(评论的Dao接口)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:07:18   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */

public interface CommentaryDao {
	public List<Object> queryCommentary();
	public int addCommentary(Commentarys commentary);
	public int deleteCommentary(int COMMENTARY_ID);
}
