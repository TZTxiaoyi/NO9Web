package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.ljl.ProjectsLjl;
import com.entity.tzt.Promoney;
/**
 * @类功能说明：   项目资金表
 * @作者：TZT  
 * @创建时间：2017年9月14日 下午4:22:35
 */
public interface PromoneyDaotzt {
	public List<Map> queryPromoney(Promoney promoney);
	public int addPromoney(Promoney	 promoney);
	public int  updatePromoney(Promoney promoney);
	/**
	 * 方法功能说明：   以项目为单位查询项目的筹资进度信息
	 * 创建：2017年9月14日 by TZT  
	 * @参数： @param project
	 * @参数： @return      
	 * @return List<Map>     
	 * @throws
	 */
	public List<Map> queyrProjectMoney(ProjectsLjl project);
}
