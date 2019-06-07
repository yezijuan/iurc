package com.iurc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iurc.dao.CollectionDao;
import com.iurc.entity.Collection;
import com.iurc.service.CollectionService;
@Service("collectionService")
public class CollectionServiceImpl implements CollectionService {

	@Resource
	private CollectionDao collectionDao;
	public List<Collection> findAll(Collection t) {
		return collectionDao.findAll(t);
	}

	public Collection find(Collection t) {
		return collectionDao.find(t);
	}

	public int add(Collection t) {
		return collectionDao.add(t);
	}

	public int edit(Collection t) {
		return collectionDao.edit(t);
	}

	public int remove(Collection t) {
		return collectionDao.remove(t);
	}

	public int delete(Integer id) {
		return collectionDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return collectionDao.deleteMore(list);
	}

	public Collection queryById(Integer id) {
		return collectionDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Collection> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return collectionDao.queryByPage(map);
	}

	public List<Collection> queryAll() {
		return collectionDao.queryAll();
	}

	public int getTotals() {
		return collectionDao.getTotals();
	}

}
