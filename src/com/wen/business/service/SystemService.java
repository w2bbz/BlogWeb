
package com.wen.business.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

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
import com.wen.business.frame.BaseService;
import com.wen.business.model.BlogWorkRecord;
import com.wen.util.NetworkUtil;
import com.wen.util.RequestJson;
import com.wen.util.SnowflakeIdWorker;

@Api(value = "systemService", tags = {"系统接口"})
@RestController
@RequestMapping("/systemService")
public class SystemService extends BaseService{
	
	@ApiOperation(value = "用户登陆", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "account", value = "账号", paramType = "query"),
		@ApiImplicitParam(name = "password", value = "密码", paramType = "query"),
	})
	@RequestMapping(value ="/login.do")
	//@RequestJson
	public Map<String, Object> login(HttpServletRequest request,String account,String password) throws Exception{
		
		Map<String, Object> map=new HashMap<>();
		
		JSONObject data=new JSONObject();
		
		UsernamePasswordToken token = new UsernamePasswordToken(account, password, null);   
	    
		token.setRememberMe(true);  
	      
	    // shiro登陆验证  
	    try {  
	        SecurityUtils.getSubject().login(token);
	        
	        map.put("state", "200");
	        
	        data.put("message", "index.jsp");
	        
	    } catch (UnknownAccountException ex) {
	    	map.put("state", "500");
	    	
	    	data.put("message", "用户不存在或者密码错误");
	    	
	    } catch (IncorrectCredentialsException ex) {
	    	
	    	map.put("state", "500");
	    	
	    	data.put("message", "用户不存在或者密码错误");
	    	
	    } catch (Exception ex) {
	    	
	    	map.put("state", "error");
	    	
	    	data.put("message", "内部错误，请重试");
	    	
	        ex.printStackTrace();  
	    }
	    
	    map.put("data", data);
	    
		return map;
	}
	
	
	@ApiOperation(value = "用户退出", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
	})
	@RequestMapping(value ="/logout.do")
	public JSONObject logout() throws Exception{
		
		Subject subject = SecurityUtils.getSubject();
		
		JSONObject obj=new JSONObject();
		
	    if (subject != null) {  
	        try{  
	            subject.logout();
	            obj.put("state", "200");
		        obj.put("data", "login");
	        }catch(Exception ex){
	        	
	        	obj.put("state", "500");
		        obj.put("data", "login.jsp");
	        }  
	    }
	    
		return obj;
	}
}