package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.UserDealDao;
import com.service.ly.UserDealService;
@Service
public class UserDealServiceImpl implements UserDealService{
	
	@Autowired
	UserDealDao userDealDao;
	//查询用户交易记录
	public List selUserDealRecor() {
		// TODO Auto-generated method stub
		return userDealDao.selUserDealRecord();
	}
	
}
