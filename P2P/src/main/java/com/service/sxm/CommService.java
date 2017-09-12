package com.service.sxm;

import java.util.List;

import com.entity.sxm.Commentary;

public interface CommService {
	public int saveComm(Commentary c);
	public List<Object> selectComm();
}
