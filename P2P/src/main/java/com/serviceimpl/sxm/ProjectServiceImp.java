package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProjectDao;
import com.entity.ljl.ProjectsLjl;
import com.service.sxm.ProjectService;
/**
 * 
    * @ClassName: ProjectServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Service
public class ProjectServiceImp implements ProjectService {
	@Autowired
	ProjectDao pdao;
	@Override
	/**
	 * 根据项目id查询发起人类型
	 */
	public List selectProject(ProjectsLjl p) {
		// TODO Auto-generated method stub
		return pdao.selectProject(p);
	}

}
