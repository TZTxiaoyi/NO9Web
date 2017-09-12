package com.serviceimpl.Tool;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.service.Tool.FileUploadService;
@Service
public class FileUploadServiceImpl implements FileUploadService{

	@Override
	public Map SaveFile(MultipartFile myfile) 
			throws IllegalStateException, IOException {
		// 图片名称
		
				String tomcaturl=System.getProperty("catalina.home");

				//System.out.println(myfile);
		        String oldFileName =myfile.getOriginalFilename(); // 获取上传文件的原名
		        //System.out.println(oldFileName);
		        // 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
		        String saveFilePath =tomcaturl+"\\teswebapps\\P2P\\images";//"D:\\NO9Web\\P2P\\src\\main\\webapp\\images"; 
		       // System.out.println(saveFilePath);
		        // 上传图片
		        if (myfile != null && oldFileName != null && oldFileName.length() > 0) {
		            // 新的图片名称
		            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
		            // 新图片
		            File newFile = new File(saveFilePath + "\\" + newFileName);
		            // 将内存中的数据写入磁盘
		            myfile.transferTo(newFile);
		           // 将新图片名称返回到前端
		            Map<String, Object> map = new HashMap<String, Object>();
		            map.put("flag", 0);
		            map.put("url", newFileName);
		            
		            return map;
		            
		        } else {
		        	Map<String, Object> map = new HashMap<String, Object>();
		            map.put("flag", 1);
		            
		            return map;
		        }
	}

}
