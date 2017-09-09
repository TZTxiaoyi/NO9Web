package com.service.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Address;

/**
 * 
 * @ClassName:  AddressService   
 * @Description:TODO( 地址的Service)   
 * @author: 朱彬
 * @date:   2017年9月6日 下午3:08:49   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface AddressService {
	public List<Object> queryAddress();
	public int addAddress(Address address);
	public int updateAddress(Map map);
	public void deleteAddress(Integer addressId);

}
