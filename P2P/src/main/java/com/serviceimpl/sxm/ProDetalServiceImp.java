package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProDetalDao;
import com.service.sxm.ProDetalService;
/**
 * 
    * @ClassName: ProDetalServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  订单详情
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Service
public class ProDetalServiceImp implements ProDetalService {
	@Autowired
	ProDetalDao pdao;
	@Override
	/**
	 * 查询订单详情
	 */
	public List<Object> selectProdetal(Integer pid) {
		// TODO Auto-generated method stub
		return pdao.selectProdetal(pid);
	}

}
