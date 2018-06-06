package com.wen.business.dao;

import java.util.HashMap;

import com.wen.business.model.BaseUser;
import com.wen.business.model.BlogWorkRecord;
import com.wen.util.EntityMapper;

public interface BaseUserMapper extends EntityMapper<BaseUser> {

	BaseUser selectBaseUserByParam(HashMap<String, Object> map);
	
}
