package com.web.ljl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.service.ljl.ProjectsServiceLjl;

@Controller
@RequestMapping("/ProjectsController")
public class ProjectsController {
	
	@Autowired
	ProjectsServiceLjl projectsServiceLjl;
	@RequestMapping("/AllProjectsType")
	public void AllProjectsType(HttpServletResponse response){
		String str=projectsServiceLjl.AllProjectsType();
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		System.out.println(str);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/uploadFile")
    public void uploadFile(@RequestParam("file_data") MultipartFile myfile ,HttpServletRequest request,HttpServletResponse response)
            throws IllegalStateException, IOException {
        // 图片名称
		
		String tomcaturl=System.getProperty("catalina.home");

		System.out.println(myfile);
        String oldFileName =myfile.getOriginalFilename(); // 获取上传文件的原名
        System.out.println(oldFileName);
        // 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
        String saveFilePath = tomcaturl+"\\teswebapps\\P2P\\image";
        System.out.println(saveFilePath);
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
            map.put("success", "成功啦");
            map.put("url", newFileName);
            JSON json=new JSONArray();
            
            response.getWriter().write(json.toJSONString(map));
            
        } else {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("error", "图片不合法");
            JSON json=new JSONArray();
        	response.getWriter().write(json.toJSONString(map));
        }
        
    }
	
	@RequestMapping("/AllProjects")
	public String AllProjects(@RequestBody UserLjl user,HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		System.out.println("11");
		//System.out.println(str);
		System.out.println(user.getEmpid());
		String str= projectsServiceLjl.AllProjects(user);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	@RequestMapping("/SaveProjects")
	public String SaveProjects(ProjectsLjl proLjl,HttpServletRequest request,HttpServletResponse response){
		System.out.println(proLjl.getAddtime()+","+proLjl.getEmpid()+","+proLjl.getProjectsstate());
		System.out.println("57878");
		String str=projectsServiceLjl.SaveProjects(proLjl);
		System.out.println(str);
		return "";
		
	}
	
}
