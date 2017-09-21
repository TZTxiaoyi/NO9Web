package com.serviceimpl.zb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ljl.EmployeeDaoLjl;
import com.dao.ljl.PlatformFundsDaoLjl;
import com.dao.zb.BankAccountDao;
import com.entity.zb.BankAccount;
import com.service.zb.BankAccountService;
/**
 * 
 * @ClassName:  BankAccountServiceImpl   
 * @Description:TODO(�����˺ŵ�ҵ���)   
 * @author: ���
 * @date:   2017��9��5�� ����9:53:01   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class BankAccountServiceImpl implements BankAccountService {
	@Autowired
	BankAccountDao bad;
	@Autowired
	PlatformFundsDaoLjl platdao;
	@Autowired
	EmployeeDaoLjl empdao;
	@Override
	public List<Object> queryBankAccount(Integer id) {
		// TODO Auto-generated method stub
		return bad.queryBankAccount(id);
	}
	/**
	 * ������п�
	 * @param bankaccount 
	 */
	@Override
	public int addBankAccount(BankAccount bankaccount) {
		// TODO Auto-generated method stub
		return bad.addBankAccount(bankaccount);
	}
	@Override
	public void addBankAccount(String string) {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 提现的方法！！
	 */
	@Override
	public int updateBankAccount(float txbalance, Integer empid) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("money",-txbalance);
		platdao.eUpdatefund(map);
		map.put("empid", empid);
		map.put("details", 177);
		empdao.InsertTransaction(map);
		return bad.updateBankAccount(txbalance, empid);
	}

}
