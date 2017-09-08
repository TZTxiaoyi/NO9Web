package com.serviceimpl.sxm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.sxm.ProDetalDao;
import com.service.sxm.ProDetalService;
@Service
public class ProDetalServiceImp implements ProDetalService {
	@Autowired
	ProDetalDao pdao;
	@Override
	public List<Object> selectProdetal(Integer pid) {
		// TODO Auto-generated method stub
		return pdao.selectProdetal(pid);
	}

}
