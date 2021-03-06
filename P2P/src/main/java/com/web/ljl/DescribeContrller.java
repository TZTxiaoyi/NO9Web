package com.web.ljl;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.ljl.DescribeLjl;
import com.entity.ljl.PerProLjl;
import com.service.Tool.FileUploadService;
import com.service.ljl.DescribeServiecLjl;
/**
 * 项目的描述
 */
@Controller
@RequestMapping("/DescribeContrller")
public class DescribeContrller {
	@Autowired
	FileUploadService SaveCover;
	@Autowired
	DescribeServiecLjl DescribeService;
	/**
	 * 更新项目的描述
	 * 项目主题，内容，目标资金，筹集时间
	 */
	@RequestMapping("UpdateDescribe")
	@ResponseBody
	public String UpdateDescribe(@RequestBody DescribeLjl describe){
		
		String str=DescribeService.UpdataDescribe(describe);
		return str;
	}
	/**
	 * 查询项目的描述
	 * 项目主题，内容，目标资金，筹集时间
	 */
	@RequestMapping(value="/AllDescribe",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String AllDescribe(DescribeLjl describe){
		
		System.out.println(describe.getProjectsid());
		String str=DescribeService.AllDescribe(describe);
		System.out.println("45AllDescribe:"+str);
		return str;
		
	}
	/**
	 * 更新项目的图片
	 */
	@RequestMapping(value="/SaveCover",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map SaveCover(@RequestParam("file_data") MultipartFile myfile,DescribeLjl describe) throws IllegalStateException, IOException{
		Map map=SaveCover.SaveFile(myfile);
		map=DescribeService.SaveCover(map, describe);
		return map;
		
	}
}
