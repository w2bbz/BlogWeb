
package com.wen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.AuthenticationException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tk.mybatis.mapper.util.StringUtil;

import com.github.pagehelper.PageHelper;
import com.google.common.hash.BloomFilter;
import com.wen.business.dao.BlogWorkRecordMapper;
import com.wen.business.frame.BaseController;
import com.wen.business.model.BlogWorkRecord;
import com.wen.business.util.NetworkUtil;
import com.wen.business.util.RequestJson;
import com.wen.business.util.SnowflakeIdWorker;

@Api(value = "systemController", tags = {"系统接口"})
@RestController
@RequestMapping("/systemController")
public class SystemController extends BaseController{
	
	@ApiOperation(value = "用户登陆", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "account", value = "账号", paramType = "query"),
		@ApiImplicitParam(name = "password", value = "密码", paramType = "query"),
	})
	@RequestMapping(value ="/login.do")
	//@RequestJson
	public boolean login(HttpServletRequest request,String account,String password) throws Exception{
		
		UsernamePasswordToken token = new UsernamePasswordToken(account, password, null);   
	    
		token.setRememberMe(true);  
	      
	    // shiro登陆验证  
	    try {  
	        SecurityUtils.getSubject().login(token);
	        
	    } catch (UnknownAccountException ex) {
	    	throw new Exception("用户不存在或者密码错误");
	    } catch (IncorrectCredentialsException ex) {    	
	    	throw new Exception("用户不存在或者密码错误");
	    } catch (Exception ex) {
	    	throw new Exception("内部错误，请重试");  
	    }
	    
		return true;
	}
	
	
	@ApiOperation(value = "用户退出", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
	})
	@RequestMapping(value ="/logout.do")
	public boolean logout(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		Subject subject = SecurityUtils.getSubject();
		
	    if (subject != null) {  
			try {
				subject.logout();

				// 清除 session 中的所有信息
				request.getSession().invalidate();
				
				/*Cookie[] cookie=request.getCookies();  
				for(Cookie c:cookie){  
				    if("autoLogin".equals(c.getName())){  
				        c.setMaxAge(0);  
				        response.addCookie(c);  
				    }  
				}*/ 

			} catch (Exception ex) {
				throw new Exception("退出错误");
			} 
	    }
	    
		return true;
	}
}