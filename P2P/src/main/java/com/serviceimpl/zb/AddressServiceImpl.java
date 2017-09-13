package com.serviceimpl.zb;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.AddressDao;
import com.entity.zb.Address;
import com.service.zb.AddressService;
/**
 * 
 * @ClassName:  AddressServiceImpl   
 * @Description:TODO(地址的事务层)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:09:49   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	AddressDao ad;
	/**
	 * 查询
	 */
	@Override
	public List<Object> queryAddress(int empid) {
		// TODO Auto-generated method stub
		return ad.queryAddress(empid);
	}
	/**
	 * 添加
	 */
	@Override
	public int addAddress(Address address) {
		// TODO Auto-generated method stub
		return ad.addAddress(address);
	}
	/**
	 * 更新
	 */
	@Override
	public int updateAddress(Map map) {
		// TODO Auto-generated method stub
		return ad.updateAddress(map);
	}
	/**
	 * 删除
	 */
	@Override
	public void deleteAddress(Integer addressId) {
		// TODO Auto-generated method stub
		ad.deleteAddress(addressId);
	}
	

	

}
