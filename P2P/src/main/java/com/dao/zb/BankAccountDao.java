package com.dao.zb;

import java.util.List;

import com.entity.zb.BankAccount;
/**
 * 
 * @ClassName:  BankAccountDao   
 * @Description:TODO(�����˺ŵ�dao�ӿ�)   
 * @author: ���
 * @date:   2017��9��5�� ����9:50:08   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface BankAccountDao {
	public List<Object> queryBankAccount();
	public int addBankAccount(BankAccount bankaccount);
}
