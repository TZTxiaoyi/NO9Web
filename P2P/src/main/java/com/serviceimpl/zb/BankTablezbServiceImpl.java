package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.BankTablezbDao;
import com.service.zb.BankTablezbService;
/**
 * 
 * @ClassName:  BankTablezbServiceImpl   
 * @Description:TODO(银行表的事务层)   
 * @author: 朱彬
 * @date:   2017年9月9日 下午2:50:48   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class BankTablezbServiceImpl implements  BankTablezbService{
	@Autowired
	BankTablezbDao btzd;
	@Override
	public List<Object> queryBankTablezb() {
		// TODO Auto-generated method stub
		return btzd.queryBankTablezb();
	}

}
