package com.iurc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iurc.dao.NewsDao;
import com.iurc.entity.News;
@Repository("newsDao")
public class NewsDaoImpl extends BaseDaoImpl<News>  implements NewsDao {

	@Override
	public String getNs() {
		return "com.iurc.dao.NewsDao";
	}

	
	public List<News> findAllNews() {
		List<News> list = getSqlSession().selectList(getNs()+".findAllNews");
		return list;
	}

	
	@SuppressWarnings("rawtypes")
	public List<News> queryPage(Map map) {
		return getSqlSession().selectList(getNs()+".queryPage",map);
	}

	
	@SuppressWarnings("rawtypes")
	public List<News> queryNews(Map map) {
		return getSqlSession().selectList(getNs()+".queryNews",map);
	}

	
	public List<News> myCollection(Integer author) {
		List<News> list = getSqlSession().selectList(getNs()+".myCollection",author);
		return list;
	}

	
	public List<News> myRelease(Integer id) {
		List<News> list = getSqlSession().selectList(getNs()+".myRelease",id);
		return list;
	}

	
	public int checkById(Integer id) {
		return getSqlSession().update(getNs()+".checkById", id);
	}
	
}
