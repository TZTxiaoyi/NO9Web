package com.service.sxm;

import java.util.List;

import com.entity.sxm.Commentary;
/**
 * 
    * @ClassName: CommService  
    * @Description: TODO(这里用一句话描述这个类的作用)  评论的插入与查询
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface CommService {
	/**
	 * 
	    * @Title: saveComm  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  插入评论
	    * @param @param c
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	public int saveComm(Commentary c);
	/**
	 * 
	    * @Title: selectComm  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 查询评论 
	    * @param @return    参数  
	    * @return List<Object>    返回类型  
	    * @throws
	 */
	public List<Object> selectComm(Commentary c);
}
