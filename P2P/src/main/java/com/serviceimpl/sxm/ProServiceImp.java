package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProDao;
import com.entity.ljl.ProjectsLjl;
import com.entity.sxm.Commentary;
import com.entity.sxm.Pro;
import com.service.sxm.ProService;
/**
 * 
    * @ClassName: ProServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  主页面查询项目
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Service
public class ProServiceImp implements ProService{
	@Autowired
	ProDao pDao;
	/**
	 * 主页面查询项目
	 */
	public List<Object>selectProject(ProjectsLjl p){
		return pDao.selectProject(p);
		
	}
	@Override
	public List danProject(ProjectsLjl p) {
		// TODO Auto-generated method stub
		return pDao.danProject(p);
	}
}
