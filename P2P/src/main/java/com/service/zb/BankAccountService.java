package com.service.zb;

import java.util.List;

import com.entity.zb.BankAccount;

/**
 * 
 * @ClassName:  BankAccountService   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: 朱彬
 * @date:   2017年9月11日 上午8:39:44   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface BankAccountService {
	public List<Object> queryBankAccount();
	public int addBankAccount(BankAccount bankaccount);
	public void addBankAccount(String string);
}
