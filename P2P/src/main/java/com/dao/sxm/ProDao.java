package com.dao.sxm;

import java.util.List;

import com.entity.ljl.ProjectsLjl;
/**
 * 
    * @ClassName: ProDao  
    * @Description: TODO(这里用一句话描述这个类的作用) 查询项目 
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface ProDao {
	/**
	 * 
	    * @Title: selectProject  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  主页面查询项目
	    * @param @param p
	    * @param @return    参数  
	    * @return List<Object>    返回类型  
	    * @throws
	 */
	public List<Object>selectProject(ProjectsLjl p);
	public List danProject(ProjectsLjl p);
	
}
