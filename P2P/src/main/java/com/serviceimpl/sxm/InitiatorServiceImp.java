package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.InitiatorDao;
import com.entity.sxm.Organizations;
import com.entity.sxm.Originator;
import com.service.sxm.InitiatorService;
/**
 * 
    * @ClassName: InitiatorServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  发起人（个人/机构） 接口实现类
    * @author ASUS  
    * @date 2017年9月11日  
    *
 */
@Service
public class InitiatorServiceImp implements InitiatorService {
	@Autowired
	InitiatorDao iDao;
	/**
	 * 查询个人发起人信息 
	 */
	@Override
	public List selectOriginator(Originator og) {
		// TODO Auto-generated method stub
		return iDao.selectOriginator(og);
	}
	/**
	 * 查询机构发起人信息 
	 */
	@Override
	public List selectOrganizations(Organizations oj) {
		// TODO Auto-generated method stub
		return iDao.selectOrganizations(oj);
	}

}
