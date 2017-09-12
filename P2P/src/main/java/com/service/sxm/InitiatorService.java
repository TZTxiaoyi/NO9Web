package com.service.sxm;

import java.util.List;

import com.entity.sxm.Organizations;
import com.entity.sxm.Originator;

/**
 * 
    * @ClassName: InitiatorService  
    * @Description: TODO(这里用一句话描述这个类的作用)  发起人（个人/机构）  
    * @author ASUS  
    * @date 2017年9月11日  
    *
 */
public interface InitiatorService {
	/**
	 * 
	    * @Title: selectOriginator  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询个人发起人信息 
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectOriginator(Originator og);
	/**
	 * 
	    * @Title: selectOrganizations  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  查询机构发起人信息 
	    * @param @return    参数  
	    * @return List    返回类型  
	    * @throws
	 */
	public List selectOrganizations(Organizations oj);
}
