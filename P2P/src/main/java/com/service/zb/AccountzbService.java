package com.service.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Accountszb;
/**
 * 
 * @ClassName:  AccountzbService   
 * @Description:TODO(Account  service)   
 * @author: 朱彬
 * @date:   2017年9月14日 下午2:39:45   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface AccountzbService {
	public int updateAccounts(Map map);
	public List<Accountszb> queryAccount(String account);
}
