package com.dao.sxm;

import java.util.List;
/**
 * 
    * @ClassName: ProDetalDao  
    * @Description: TODO(这里用一句话描述这个类的作用)pro_details页面 查询项目详情  
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface ProDetalDao {
	/**
	 * 
	    * @Title: selectProdetal  
	    * @Description: TODO(这里用一句话描述这个方法的作用)查询项目详情  
	    * @param @param pid
	    * @param @return    参数  
	    * @return List<Object>    返回类型  
	    * @throws
	 */
	public List<Object>selectProdetal(Integer pid);
}
