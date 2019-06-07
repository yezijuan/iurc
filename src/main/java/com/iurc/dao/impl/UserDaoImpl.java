package com.iurc.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iurc.dao.UserDao;
import com.iurc.entity.Unit;
import com.iurc.entity.User;
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User>  implements UserDao {

	@Override
	public String getNs() {
		return "com.iurc.dao.UserDao";
	}

	public List<Unit> queryByUnitId(Integer id) {
		return getSqlSession().selectList(getNs()+".queryByUnitId",id);
	}

	public List<User> queryByUserId(Integer id) {
		return getSqlSession().selectList(getNs()+".queryByUserId",id);
	}

	public int disablesById(Integer id) {
		return getSqlSession().update(getNs()+".disablesById", id);
	}

	@SuppressWarnings("rawtypes")
	public List<User> searchByCondition(Map map) {
		return getSqlSession().selectList(getNs()+".searchByCondition",map);
	}

	public User findById(Integer id) {
		return getSqlSession().selectOne(getNs()+".findById", id);
	}

}
