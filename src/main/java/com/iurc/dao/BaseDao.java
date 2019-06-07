package com.iurc.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T>{
	
	public List<T>  findAll(T t);
	public T find(T t);
	public int add(T t);
	public int edit(T t);
	public int remove(T t);
	
	
	public int delete(Integer id);
	@SuppressWarnings("rawtypes")
	public int deleteMore(List ids);
	public T queryById(Integer id);
	@SuppressWarnings("rawtypes")
	public List<T> queryByPage(Map map);
	public List<T> queryAll();
	public int getTotals();	
}
