package com.dao.zb;

import java.util.List;

import com.entity.zb.BankAccount;
/**
 * 
 * @ClassName:  BankAccountDao   
 * @Description:TODO(银行账号的Dao接口)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:06:47   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface BankAccountDao {
	public List<Object> queryBankAccount();
	public int addBankAccount(BankAccount bankaccount);
}
