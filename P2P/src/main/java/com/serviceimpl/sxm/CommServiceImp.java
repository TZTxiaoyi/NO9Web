package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.CommDao;
import com.entity.sxm.Commentary;
import com.service.sxm.CommService;
/**
 * 
    * @ClassName: CommServiceImp  
    * @Description: TODO(这里用一句话描述这个类的作用) 订单的插入与查询 
    * @author ASUS  
    * @date 2017年9月15日  
    *
 */
@Service
public class CommServiceImp implements CommService {
	@Autowired
	/**
	 * 评论dao接口
	 */
	CommDao cdao;
	/**
	 * 插入评论
	 */
	public int saveComm(Commentary c) {
		// TODO Auto-generated method stub
		return cdao.saveComm(c);
	}
	/**
	 * 查询评论
	 */
	public List<Object> selectComm(Commentary c) {
		// TODO Auto-generated method stub
		return cdao.selectComm(c);
	}

}
