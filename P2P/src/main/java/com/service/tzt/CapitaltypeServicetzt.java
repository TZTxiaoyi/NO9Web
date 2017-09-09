package com.service.tzt;

import com.entity.tzt.Capitaltype;
import com.entity.tzt.Roletable;

/**
 * @类功能说明：  资金流向类型接口
 * @作者：TZT  
 * @创建时间：2017年9月8日 下午3:44:33
 */
public interface CapitaltypeServicetzt {
	public String queryCapitaltype();
	public String addCapitaltype(Capitaltype capitaltype);
	public String updateCapitaltype(Capitaltype capitaltype);
}
