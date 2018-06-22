package com.wen.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.wen.business.dao.BaiduMarkApiMapper;
import com.wen.business.model.BaiduMarkApi;

@Component("cacheService")
public class CacheService {
	
	@Autowired
	private BaiduMarkApiMapper baiduMarkApiMapper;
	
	@Cacheable(value="commonCache",key="'CacheService_getBaiduApiCache'") 
	public List<BaiduMarkApi> getBaiduApiCache(){
		
		//FIXME
		List<BaiduMarkApi> list = baiduMarkApiMapper.selectAll();

		return list;
	}

}
