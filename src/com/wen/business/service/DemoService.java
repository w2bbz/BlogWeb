
package com.wen.business.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tk.mybatis.mapper.util.StringUtil;

import com.github.pagehelper.PageHelper;
import com.google.common.hash.BloomFilter;
import com.wen.business.dao.DemoMapper;
import com.wen.business.model.Demo;
import com.wen.util.RequestJson;
import com.wen.util.SnowflakeIdWorker;

@Api(value = "demo", tags = {"演示示例"})
@RestController
@RequestMapping("/demoService")
public class DemoService {
	
	@Autowired
	private DemoMapper demoMapper;

	@ApiOperation(value = "获取Demo列表", notes = "", httpMethod = "POST")
	@ApiImplicitParams({ 
		@ApiImplicitParam(name = "page", value = "当前页", paramType = "query"),
		@ApiImplicitParam(name = "limit", value = "每页条数", paramType = "query"),
	  })
	@RequestMapping(value ="/getDemoListByPage")
	public List getDemoForJackson2(Integer page,Integer limit) throws Exception{
		
		if(page==null){page=1;}
		if(limit==null){limit=10;}
		PageHelper.startPage(page, limit);
		
		Demo condition=new Demo();
		condition.setdDeleteState(1);
		
		List list=demoMapper.select(condition);
		
		return list;
	}
	
	@ApiOperation(value = "查询Demo实例", notes = "", httpMethod = "POST")
	@ApiImplicitParams({ 
		@ApiImplicitParam(name = "d_id", value = "序号", paramType = "query"),
		@ApiImplicitParam(name = "d_name", value = "名称", paramType = "query"),
	  })
	@RequestMapping(value ="/getDemoByParam")
	public List getDemoByParam(Long d_id,String d_name) throws Exception{
		
		HashMap<String, Object> map=new HashMap<>();
		
		map.put("dId", d_id);
		
		map.put("dName", d_name);
		
		List list=demoMapper.selectDemoByParam(map);
		
		return list;
	}
	
	@ApiOperation(value = "新增Demo实例", notes = "", httpMethod = "POST")
	@ApiImplicitParams({ 
		@ApiImplicitParam(name = "dName", value = "名称", paramType = "query"),
	  })
	@RequestMapping(value ="/addDemo")
	public boolean addDemo(String dName) throws Exception{
		
		if(StringUtil.isEmpty(dName)){return false;}
		
		Demo demo= new Demo();
		demo.setdName(dName);
		demo.setdId(new SnowflakeIdWorker(0, 0).nextId());
		demo.setdAddTime(new Date());
		demo.setdDeleteState(1);
		int num=demoMapper.insertSelective(demo);
		if(num>0){return true;}
		
		return false;
	}
	
	
	@ApiOperation(value = "删除Demo实例", notes = "", httpMethod = "POST")
	@ApiImplicitParams({ 
		@ApiImplicitParam(name = "dId", value = "序号", paramType = "query"),
	  })
	@RequestMapping(value ="/deleteDemo")
	public boolean deleteDemo(Long dId) throws Exception{
		
		if(dId==null||dId==0){return false;}
		Demo record =new Demo();
		record.setdId(dId);
		record.setdDeleteState(-1);
		int num=demoMapper.updateByPrimaryKeySelective(record);
		
		if(num>0){return true;}
		
		return false;
	}
	
	@ApiOperation(value = "更新Demo实例", notes = "", httpMethod = "POST")
	@ApiImplicitParams({ 
		//@ApiImplicitParam(name = "demo", value = "{\"dID\":1,\"dName\":\"赵武\"}", paramType = "form"),
	  })
	@RequestMapping(value ="/updateDemo")
	public boolean updateDemo(Demo demo) throws Exception{
		
		if(demo.getdId()==null||demo.getdId()==0){return false;}

		int num=demoMapper.updateByPrimaryKeySelective(demo);
		
		if(num>0){return true;}
		
		return false;
	}
}