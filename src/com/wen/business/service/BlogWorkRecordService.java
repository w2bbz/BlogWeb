
package com.wen.business.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.apache.log4j.Logger;
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

@Api(value = "blogWorkRecordService", tags = {"日志接口"})
@RestController
@RequestMapping("/blogWorkRecordService")
public class BlogWorkRecordService extends BaseService{
	
	@Autowired
	private BlogWorkRecordMapper blogWorkRecordMapper;
	
	@ApiOperation(value = "新增BlogWorkRecord实例", notes = "", httpMethod = "POST")
	@ApiImplicitParams({
		//@ApiImplicitParam(name = "blogWorkRecord", value = "{\"title\":'title',\"recordTime\":'2010-12-12 12:12:12',\"content\":'content'}", paramType = "form")
	  })
	@RequestMapping(value ="/addBlogWorkRecord.do")
	public boolean addBlogWorkRecord(HttpServletRequest request,@ModelAttribute BlogWorkRecord blogWorkRecord) throws Exception{
		
		Date date=new Date();
		blogWorkRecord.setId(new SnowflakeIdWorker(0, 0).nextId());
		blogWorkRecord.setDeleteState(1);
		blogWorkRecord.setAddTime(date);
		
		Long userId=((BaseUser)request.getSession().getAttribute("currentUser")).getId();
		//System.out.println(account);
		blogWorkRecord.setUserId(userId);
		
		blogWorkRecord.setIp(NetworkUtil.getIPAddress(request));
		blogWorkRecord.setUserAgent(request.getHeader("User-Agent"));
		
		int rt=blogWorkRecordMapper.insertSelective(blogWorkRecord);
		
		if(rt>0){return true;}
		
		return false;
	}
}