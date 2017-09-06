package com.service.ljl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.entity.ljl.PerProLjl;

public interface PerProServiceLjl {
	public int UpdataPerPro(PerProLjl perpro);
	public String AllPerPro(PerProLjl perpro);
	public Map SaveIdentity(Map map,PerProLjl perpro);
}
