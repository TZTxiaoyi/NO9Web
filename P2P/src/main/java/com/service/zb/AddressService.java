package com.service.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Address;

/**
 * 
 * @ClassName:  AddressService   
 * @Description:TODO(收货地址的service)   
 * @author: 朱彬
 * @date:   2017年8月31日 下午7:53:44   
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
