
package com.wen.business.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import com.wen.business.model.BaseUser;
import com.wen.business.model.BlogWorkRecord;
import com.wen.util.NetworkUtil;
import com.wen.util.RequestJson;
import com.wen.util.SnowflakeIdWorker;

@Api(value = "commonService", tags = {"公用接口"})
@RestController
@RequestMapping("/commonService")
public class CommonService extends BaseService{
	
	
	@ApiOperation(value = "获取访问IP地址", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "random", value = "随机数", paramType = "query"),
	})
	@RequestMapping(value ="/getRequestIp.do")
	public JSONObject getRequestIp(HttpServletRequest request,String random) throws Exception{
		
		String ip=NetworkUtil.getIPAddress(request);
		
		JSONObject obj=new JSONObject();
		
		obj.put("ip", ip);
		
		return obj;
	}
}