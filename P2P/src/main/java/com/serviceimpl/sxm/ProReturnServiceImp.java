package com.serviceimpl.sxm;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.sxm.OrdersDao;
import com.dao.sxm.ProReturnDao;
import com.entity.ljl.ReturnLjl;
import com.entity.sxm.ProBack;
import com.service.sxm.ProReturnService;
/**
 * 
    * @ClassName: ProReturnServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用)  回报记录
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Service
public class ProReturnServiceImp implements ProReturnService {
	/**
	 * 回报dao接口
	 */
	@Autowired
	ProReturnDao prd;
	/**
	 * 订单dao接口
	 */
	@Autowired
	OrdersDao oDao;
	@Override
	/**
	 * 查询回报
	 */
	public List selectProReturn(ReturnLjl  r) {
		// TODO Auto-generated method stub
		return prd.selectProReturn(r);
	}
	/**
	 * 插入回报记录
	 */
	@Override
	@Transactional
	public int insertProBack(ProBack pb) {
		// TODO Auto-generated method stub
		int pback=prd.insertProBack(pb);
		/*int uporders=oDao.updateOrders(pb.getOrd_id());*/
		
		return pback;
	}

}
