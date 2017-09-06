package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.BankAccountDao;
import com.entity.zb.BankAccount;
import com.service.zb.BankAccountService;
/**
 * 
 * @ClassName:  BankAccountServiceImpl   
 * @Description:TODO(银行账号的业务层)   
 * @author: 朱彬
 * @date:   2017年9月5日 下午9:53:01   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class BankAccountServiceImpl implements BankAccountService {
	@Autowired
	BankAccountDao bad;
	@Override
	public List<Object> queryBankAccount() {
		// TODO Auto-generated method stub
		return bad.queryBankAccount();
	}
	/**
	 * 添加银行卡
	 * @param bankaccount 
	 */
	@Override
	public int addBankAccount(BankAccount bankaccount) {
		// TODO Auto-generated method stub
		return bad.addBankAccount(bankaccount);
	}

}
