package com.service.zb;

import java.util.List;

import com.entity.zb.BankAccount;

/**
 * 
 * @ClassName:  BankAccountService   
 * @Description:TODO(�����˺ŵ�Service)   
 * @author: ���
 * @date:   2017��9��5�� ����9:51:21   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface BankAccountService {
	public List<Object> queryBankAccount();
	public int addBankAccount(BankAccount bankaccount);
}
