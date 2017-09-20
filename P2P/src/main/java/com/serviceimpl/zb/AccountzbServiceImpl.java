package com.serviceimpl.zb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.AccountzbDao;
import com.entity.zb.Accountszb;
import com.service.zb.AccountzbService;
@Service
public class AccountzbServiceImpl implements AccountzbService {
	@Autowired
	AccountzbDao acdao;
	/**
	 * 修改密码
	 */
	@Override
	public int updateAccounts(Map map) {
		// TODO Auto-generated method stub
		return acdao.updateAccounts(map);
	}
	/**
	 * 查询账号的方法
	 */
	@Override
	public List<Accountszb> queryAccount(String account) {
		// TODO Auto-generated method stub
		return acdao.queryAccount(account);
	}

}
