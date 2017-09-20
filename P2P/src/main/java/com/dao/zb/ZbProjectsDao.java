package com.dao.zb;

import java.util.List;
import com.entity.zb.ZbProjects;
/**
 * 
 * @ClassName:  ZbProjectsDao   
 * @Description:TODO(项目查询的dao层)   
 * @author: 朱彬
 * @date:   2017年9月15日 上午10:16:15   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface ZbProjectsDao {
	public List<ZbProjects> queryZbProjects();
}
