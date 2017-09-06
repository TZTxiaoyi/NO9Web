package com.service.ljl;

import java.util.List;
import java.util.Map;

public interface IndetailServiceLjl {
	public int SaveIndetail();
	public int UpdateIndetail();
	public List AllIndetail();
	
	public int SvaeText(Map map);
	public int UpdateText(Map map);
}
