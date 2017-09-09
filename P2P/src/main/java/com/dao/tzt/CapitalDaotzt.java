package com.dao.tzt;

import java.util.List;
import java.util.Map;

import com.entity.tzt.Accounts;
import com.entity.tzt.Capital;

public interface CapitalDaotzt {
	public List<Map> queryCapital(Capital capital);
	public int addCapital(Capital capital);
}
