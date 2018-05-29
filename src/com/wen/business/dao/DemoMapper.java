package com.wen.business.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wen.business.model.Demo;
import com.wen.util.EntityMapper;

public interface DemoMapper extends EntityMapper<Demo> {

	/**
	 * 根据参数查询
	 * @param map
	 * @return
	 */
	List selectDemoByParam(HashMap<String, Object> map);

	
}
