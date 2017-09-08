package com.service.tzt;

import java.util.List;
import java.util.Map;
import com.entity.tzt.Roletable;
/**
 * 
 * @类功能说明： 角色模块的功能接口  
 * @作者：TZT  
 * @创建时间：2017年9月1日 下午8:20:15
 */
public interface RoleTableServicetzt {
	public String queryRoletable();
	public String addRoletable(Roletable roletable);
	public String updateRoletable(Roletable roletable);
}
