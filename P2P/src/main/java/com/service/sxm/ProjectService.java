package com.service.sxm;

import java.util.List;

import com.entity.ljl.ProjectsLjl;
/**
 * 
    * @ClassName: ProjectService  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
public interface ProjectService {
	/**
	 * 
	    * @Title: selectProject  
	    * @Description: TODO(这里用一句话描述这个方法的作用) 根据项目id查询发起人类型 
	    * @param @param p
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectProject(ProjectsLjl p);
}
