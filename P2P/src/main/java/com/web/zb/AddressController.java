package com.web.zb;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.zb.Address;
import com.service.zb.AddressService;

/**
 * 
 * @ClassName:  AddressController   
 * @Description:TODO(收货地址的控制层)   
 * @author: 朱彬
 * @date:   2017年8月31日 下午8:00:15   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Controller
@RequestMapping("/zhubin")
public class AddressController {
	@Autowired
	AddressService asv;	
	/**
	 * 
	* @Title: addAddress
	* @Description: TODO(添加收货地址的方法)
	* @param @param str
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/addAddress.do")
	public void addAddress(@RequestBody String str,HttpServletResponse resp){
		System.out.println("str="+str);
		Address address = JSON.parseObject(str,Address.class);
		System.out.println(address.getName());
		int flag = -1;
		flag = asv.addAddress(address);
		System.out.println("flag="+flag);
		try {
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: queryAddress
	* @Description: TODO(查询收货地址的方法)
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/queryAddress.do")
	public void queryAddress(HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		List<Object> lob = asv.queryAddress();
		JSON json = new JSONArray(lob);
		System.out.println(json.toString());
		try {
			resp.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	* @Title: updateAddress
	* @Description: TODO(修改收货地址的方法)
	* @param @param address
	* @param @param resp    设定文件
	* @return void    返回类型
	* @throws
	 */
	@RequestMapping("/updateAddress.do")
	public void updateAddress(@RequestBody String address,HttpServletResponse resp){
		//System.out.println("=========="+address);
		JSON json=new JSONArray();		
		Map map=(Map)json.parse(address);
		//System.out.println("=========="+map);
		int flag = asv.updateAddress(map);
		try {
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param <Msg>
	 * @param <Msg>
	 * 
	* @Title: deleteAddress
	* @Description: TODO(地址删除方法)
	* @param     设定文件
	* @return void    返回类型
	* @throws
	 */
	@ResponseBody
	@RequestMapping(value="/deleteAddress.do")
	public boolean deleteAddressById(@RequestParam(value="addressId") Integer addressId){
		//System.out.println("--------addressId--------"+addressId);
		asv.deleteAddress(addressId);
		return true;
		
	}
	
	
	
}
