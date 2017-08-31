package com.web.ljl;
import com.dao.ljl.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testweb")
public class testweb {
	@Autowired
	test test;
	@RequestMapping("/testerr")
	public void err(){
		System.out.println("11");
		test.eeer();
		
	}
}
