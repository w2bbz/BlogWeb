package com.wen.business.frame;

import java.util.HashMap;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.wen.business.dao.BaseRoleMapper;
import com.wen.business.dao.BaseUserMapper;
import com.wen.business.model.BaseUser;

public class CustomRealm extends AuthorizingRealm{
    
	private static final Logger logger = LoggerFactory.getLogger(CustomRealm.class);
    
    @Autowired
    private BaseUserMapper baseUserMapper;
    
    @Autowired
    private BaseRoleMapper baseRoleMapper;
    /**
     * 用户授权认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        logger.info("======用户授权认证======");
        String userName = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();     
        simpleAuthorizationInfo.setRoles(baseRoleMapper.selectBaseRolesByParam(userName));
        return simpleAuthorizationInfo;
   
    }
    /**
     * 用户登陆认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        logger.info("======用户登陆认证======");
        String account = authenticationToken.getPrincipal().toString();
        HashMap<String,Object> map=new HashMap();
        map.put("account", account);
        BaseUser user = baseUserMapper.selectBaseUserByParam(map);
        if (user!=null) {
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getAccount(), user.getPassword(), "");
            this.setSession("currentUser", user);
            return authenticationInfo;
        }
        return null; 
        
    }
    
    
    /** 
     * 将一些数据放到ShiroSession中,以便于其它地方使用 
     * @see  比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到 
     */  
    private void setSession(Object key, Object value){  
        Subject currentUser = SecurityUtils.getSubject();  
        if(null != currentUser){  
            Session session = currentUser.getSession();  
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");  
            if(null != session){  
                session.setAttribute(key, value);  
            }  
        }  
    }  

}