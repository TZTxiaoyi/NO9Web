package com.service.sxm;

import java.util.List;
/**
 * 
    * @ClassName: ProDetalService  
    * @Description: TODO(这里用一句话描述这个类的作用)  项目详情
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface ProDetalService {
	/**
	 * 
	    * @Title: selectProdetal  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询项目详情
	    * @param @param pid
	    * @param @return    参数  
	    * @return List<Object>    返回类型  
	    * @throws
	 */
	public List<Object>selectProdetal(Integer pid);
}
