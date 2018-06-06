package com.wen.business.dao;

import java.util.HashMap;
import java.util.Set;

import com.wen.business.model.BaseRole;
import com.wen.business.model.BaseUser;
import com.wen.business.model.BlogWorkRecord;
import com.wen.util.EntityMapper;

public interface BaseRoleMapper extends EntityMapper<BaseRole> {

	Set<String> selectBaseRolesByParam(String userName);
	
}
