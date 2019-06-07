package com.iurc.dao;


import java.util.List;
import java.util.Map;

import com.iurc.entity.Unit;
import com.iurc.entity.User;

public interface UserDao extends BaseDao<User> {
	public List<Unit> queryByUnitId(Integer id);
	
	public List<User> queryByUserId(Integer id);
	
	public int disablesById(Integer id);
	
	@SuppressWarnings("rawtypes")
	public List<User> searchByCondition(Map map);
	
	public User findById(Integer id);
	
}
