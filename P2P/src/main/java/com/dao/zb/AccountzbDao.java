package com.dao.zb;

import java.util.List;
import java.util.Map;

import com.entity.zb.Accountszb;
/**
 * 
 * @ClassName:  AccountzbDao   
 * @Description:TODO(Account Dao)   
 * @author: 朱彬
 * @date:   2017年9月14日 下午2:37:13   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
public interface AccountzbDao {
	public int updateAccounts(Map map);
	public List<Accountszb> queryAccount(String account);
}
