package com.dao.sxm;

import java.util.List;

import com.entity.sxm.Commentary;

public interface CommDao {
	public int saveComm(Commentary c);
	public List<Object> selectComm();
}
