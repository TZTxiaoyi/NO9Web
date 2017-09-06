package com.service.zb;

import java.util.List;

import com.entity.zb.BankAccount;

/**
 * 
 * @ClassName:  BankAccountService   
 * @Description:TODO(银行账号的Service)   
 * @author: 朱彬
 * @date:   2017年9月5日 下午9:51:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface BankAccountService {
	public List<Object> queryBankAccount();
	public int addBankAccount(BankAccount bankaccount);
}
