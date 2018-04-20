package com.web;

import com.common.config.ProjectConifg;
import com.common.utils.SHA1Utils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;

/**
 * @Description: 微信相关控制器
 * @param
 * @return 
 * @author lijinliang
 * @date 2018/4/19 20:07
 */
@RestController
@RequestMapping("/wxlogin")
public class WXLiginController {
    @Autowired
    ProjectConifg projectConifg;
    @RequestMapping(method = RequestMethod.GET)
    public void login(){

    }
    @RequestMapping(value = "/token", method = RequestMethod.GET)
    public String token(@RequestParam("timestamp") String timestamp,
                        @RequestParam("nonce") String nonce,
                        @RequestParam("signature") String  signature,
                        @RequestParam("echostr") String echostr){
        //字典序排序
        ArrayList<String> list=new ArrayList<String>();
        list.add(nonce);
        list.add(timestamp);
        list.add(projectConifg.getWxtoken());
        Collections.sort(list);
        String newsignature = SHA1Utils.getSHA1(list.get(0)+list.get(1)+list.get(2));
        if(newsignature.equals(signature)){
            return echostr;
        }
        return "";
    }
}
