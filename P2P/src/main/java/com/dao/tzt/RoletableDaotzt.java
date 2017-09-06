package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Roletable;

/**
 * 
 * @类功能说明：角色表增加删除功能接口  
 * @作者：TZT  
 * @创建时间：2017年9月1日 下午7:14:30
 */
public interface RoletableDaotzt {
	public List<Map> queryRoletable();
	public int addRoletable(Roletable roletable);
	public int updateRoletable(Roletable  roletable);
}
