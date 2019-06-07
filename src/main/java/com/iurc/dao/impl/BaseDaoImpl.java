package com.iurc.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iurc.dao.BaseDao;
@Repository("baseDao")
public abstract class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao<T> {

	
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//命名空间
	public abstract String getNs();
	
	public List<T> findAll(T t) {
		List<T> list = getSqlSession().selectList(getNs()+".findAll",t);
		return list;
	}
	
	public T find(T t) {
		return getSqlSession().selectOne(getNs()+".find",t);
	}

	public int add(T t) {
		return getSqlSession().insert(getNs()+".add", t);
	}

	public int edit(T t) {
		return getSqlSession().update(getNs()+".edit", t);
	}

	public int remove(T t) {
		return getSqlSession().update(getNs()+".remove", t);
	}
	
	public int delete(Integer id) {
		
		return getSqlSession().delete(getNs()+".delete", id);
		
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteMore(List ids) {
		return getSqlSession().delete(getNs()+".deleteMore", ids);
		
	}
	
	public T queryById(Integer id) {
		return getSqlSession().selectOne(getNs()+".queryById",id);
	}
	
	@SuppressWarnings("rawtypes")
	public List<T> queryByPage(Map map) {
		return getSqlSession().selectList(getNs()+".queryByPage",map);
	}
	
	public List<T> queryAll() {
		return getSqlSession().selectList(getNs()+".queryAll");
	}
	
	public int getTotals() {
		return getSqlSession().selectOne(getNs()+".getTotals");
	}
	
	
}
