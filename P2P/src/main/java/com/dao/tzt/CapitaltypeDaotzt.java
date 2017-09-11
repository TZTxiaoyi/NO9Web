package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Capitaltype;

/**
 * 
 * @类功能说明： 资金流向类别表接口  
 * @作者：TZT  
 * @创建时间：2017年9月8日 下午3:34:52
 */
public interface CapitaltypeDaotzt {
	public List<Map> queryCapitaltype();
	public int addCapitaltype(Capitaltype capitaltype);
	public int updateCapitaltype(Capitaltype  capitaltype);
}
