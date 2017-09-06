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
 * @Description:TODO(收货地址)   
 * @author: 朱彬
 * @date:   2017年8月31日 下午7:56:16   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	AddressDao ad;
	
	@Override
	public List<Object> queryAddress() {
		// TODO Auto-generated method stub
		return ad.queryAddress();
	}

	@Override
	public int addAddress(Address address) {
		// TODO Auto-generated method stub
		return ad.addAddress(address);
	}

	@Override
	public int updateAddress(Map map) {
		// TODO Auto-generated method stub
		return ad.updateAddress(map);
	}
	/**
	 * 删除方法
	 */
	@Override
	public void deleteAddress(Integer addressId) {
		// TODO Auto-generated method stub
		ad.deleteAddress(addressId);
	}
	

	

}
