package com.service.sxm;

import java.util.List;

import com.entity.ljl.ReturnLjl;
import com.entity.sxm.ProBack;
/**
 * 
    * @ClassName: ProReturnService  
    * @Description: TODO(这里用一句话描述这个类的作用)  回报的插入与查询
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface ProReturnService {
	/**
	 * 
	    * @Title: selectProReturn  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询回报
	    * @param @param r
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectProReturn(ReturnLjl  r);
	/**
	 * 
	    * @Title: insertProBack  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  插入回报记录
	    * @param @param pb
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	public int insertProBack(ProBack pb);
}