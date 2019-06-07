package com.iurc.dao;

import java.util.List;
import java.util.Map;

import com.iurc.entity.News;

public interface NewsDao extends BaseDao<News> {
	public List<News> findAllNews();
	@SuppressWarnings("rawtypes")
	public List<News> queryPage(Map map);
	@SuppressWarnings("rawtypes")
	public List<News> queryNews(Map map);
	/**
	 * 根据登陆用户的id号查询用户收藏的新闻稿
	 * */
	public List<News> myCollection(Integer author);
	/**
	 * 根据登陆用户的id号查询用户投的新闻稿
	 * */
	public List<News> myRelease(Integer id);
	
	public int checkById(Integer id);
	
}
