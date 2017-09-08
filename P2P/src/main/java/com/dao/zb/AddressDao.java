package com.dao.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Address;

/**
 * 
 * @ClassName:  AddressDao   
 * @Description:TODO(收货地址的Dao接口)   
 * @author: 朱彬
 * @date:   2017年8月31日 下午7:49:23   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface AddressDao {
	public List<Object>queryAddress();
	public int addAddress(Address address);
	public int updateAddress(Map map);
	public boolean deleteAddress(int id);
}
