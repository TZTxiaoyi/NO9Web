package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.ZbProjectsDao;
import com.entity.zb.ZbProjects;
import com.service.zb.ZbProjectsService;
/**
 * 
 * @ClassName:  ZbProjectsServiceImpl   
 * @Description:TODO(shi wu)   
 * @author: 朱彬
 * @date:   2017年9月15日 上午10:18:50   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class ZbProjectsServiceImpl implements ZbProjectsService{
	@Autowired
	ZbProjectsDao zbdao;
	@Override
	public List<ZbProjects> queryZbProjects() {
		// TODO Auto-generated method stub
		return zbdao.queryZbProjects();
	}

}
