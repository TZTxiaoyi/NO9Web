
package com.shiro;

import java.util.HashMap;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.ly.UsersDao;
import com.entity.tzt.Accounts;
import com.entity.tzt.Employee;



/**
 * 
* @Title: Realm.java  
* @Package com.shiro  
* @Description: TODO(验证用户和为用户授权)  
* @author 自定义 Realm
* @date 2017年8月31日
 */
public class Realm extends AuthorizingRealm{
	@Autowired
	private UsersDao usersDao;//调用用户DAO接口
	
	/**
	 * 为用户认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub

		UsernamePasswordToken upToken =(UsernamePasswordToken) token;
			System.out.println("9999999999999999999999999999999999999999999999999999");
		String accounts = upToken.getUsername();//从令牌中获得用户名称
		
		Accounts accounts2=new Accounts();
		
		accounts2.setAccounts(accounts);
		
		System.out.println("accounts2-------:"+accounts2.getAccounts());
		Accounts alList= usersDao.queryAccounts(accounts2);
		System.out.println("password-------:"+alList.getPasswords());
			
			//System.out.println("alist---------:"+alList.getEmpid());
			
		if(alList==null){
			System.out.println("6666666666");
			throw new UnknownAccountException();//用户名不存在
		}else{
			String password = alList.getPasswords();//获得数据库用户密码
			System.out.println("password-------:"+password);
			/**创建简单认证信息
			 * 参数一：签名:程序可以在任意位置获取当前放入的对象
			 * 参数二：从数据库中查询出的密码
			 * 参数三：当前realm的名称
			 */
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(alList,password,this.getClass().getSimpleName());
		 System.out.println("gubh:"+info);
			return info;//返回给安全管理器 ，由安全管理器比对密码	
		}

	}


	/**
	 * 为用户授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection PC) {
		// TODO Auto-generated method stub
		System.out.println("huihua5555555555555");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Accounts accounts =(Accounts)PC.getPrimaryPrincipal();
		List<HashMap<String,Object>> userMap = usersDao.queryAllFunction(accounts);
		for(int i=0;i<userMap.size();i++){
			info.addStringPermission(userMap.get(i).get("KEYWORD").toString());
		}
		
		return info;
	}
	

}

