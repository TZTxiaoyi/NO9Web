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
	public int addBankAccount(BankAccount bankaccount);
	public List<Object> queryBankAccount(Integer id);
	/**
	 * 
	* @Title: updateBankAccount
	* @Description: TODO(提现的方法)
	* @param @param txbalance
	* @param @param empid
	* @param @return    设定文件
	* @return int    返回类型
	* @throws
	 */
	public int updateBankAccount(float txbalance,Integer empid);
}
