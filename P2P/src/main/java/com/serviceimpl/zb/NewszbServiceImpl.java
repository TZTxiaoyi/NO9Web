package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.NewszbDao;
import com.service.zb.NewszbService;
/**
 * 
 * @ClassName:  NewszbServiceImpl   
 * @Description:TODO(私信的业务层)   
 * @author: 朱彬
 * @date:   2017年9月7日 上午11:02:10   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class NewszbServiceImpl implements NewszbService {
	@Autowired
	NewszbDao nd;
	/**
	 * 查询方法
	 */	
	@Override
	public List<Object> queryNewszb() {
		// TODO Auto-generated method stub

		return nd.queryNewszb();
	}

}
