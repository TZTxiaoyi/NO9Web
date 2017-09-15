package com.service.ljl;

import java.util.Map;

import com.entity.ljl.DescribeLjl;
import com.entity.ljl.PerProLjl;

public interface DescribeServiecLjl {
	public String UpdataDescribe(DescribeLjl describe);
	public String AllDescribe(DescribeLjl describe);
	public Map SaveCover(Map map,DescribeLjl describe);
}
