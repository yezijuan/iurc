package com.iurc.service;

import java.util.List;

public interface BaseService<T> {
	
	public List<T>  findAll(T t);
	public T find(T t);
	public int add(T t);
	public int edit(T t);
	public int remove(T t);

	

	public int delete(Integer id);
	public int deleteMore(String ids);
	public T queryById(Integer id);
	public List<T> queryByPage(Integer currentPage,Integer pageSize);
	public List<T> queryAll();
	public int getTotals();	
}
