package com.common.config;

import org.springframework.stereotype.Component;

/**
 * @Description: 项目配置
 * @param 
 * @return 
 * @author lijinliang
 * @date 2018/4/19 20:36
 */
public class ProjectConifg {
    private String wxtoken;

    public String getWxtoken() {
        return wxtoken;
    }

    public void setWxtoken(String wxtoken) {
        this.wxtoken = wxtoken;
    }
}
