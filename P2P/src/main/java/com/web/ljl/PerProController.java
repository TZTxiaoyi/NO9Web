package com.web.ljl;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.ljl.PerProLjl;
import com.service.Tool.FileUploadService;
import com.service.ljl.PerProServiceLjl;
/**
 * 项目个人资料
 */
@Controller
@RequestMapping("/PerProController")
public class PerProController {
	@Autowired
	FileUploadService savefile;
	@Autowired
	PerProServiceLjl PerService;
	/**
	 * 更新项目个人资料
	 */
	@RequestMapping("/UpataPerPro")
	@ResponseBody
	public String UpataPerPro(@RequestBody PerProLjl perpro){
		System.out.println(perpro.getIdcard());
		int flag=PerService.UpdataPerPro(perpro);
		if(flag==1){
			return "success";
			
		}
		return "err";
	}
	/**
	 * 查询项目个人资料
	 */
	@RequestMapping(value="/AllPerPro",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String AllPerPro( PerProLjl perpro){
		
		System.out.println(perpro.getProjectsid());
		//perpro.setProjectsid(100101);
		String str=PerService.AllPerPro(perpro);
		System.out.println("AllPerPro:"+str);
		return str;
		
	}
	/**
	 * 保存身份证图片
	 */
	@RequestMapping(value="/SaveFile",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map SaveFile(@RequestParam("file_data") MultipartFile myfile,PerProLjl perpro) throws IllegalStateException, IOException{
		Map<String,Object> map=savefile.SaveFile(myfile);
		map=PerService.SaveIdentity(map, perpro);
		return map;
		
	}
}
