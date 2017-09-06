package com.dao.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Address;

/**
 * 
 * @ClassName:  AddressDao   
 * @Description:TODO(�ջ���ַ��Dao�ӿ�)   
 * @author: ���
 * @date:   2017��8��31�� ����7:49:23   
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
