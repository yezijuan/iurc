package com.iurc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iurc.dao.CooperationDao;
import com.iurc.entity.Cooperation;
import com.iurc.service.CooperationService;
@Service("cooperationService")
public class CooperationServiceImpl implements CooperationService {

	@Resource
	private CooperationDao cooperationDao;
	public List<Cooperation> findAll(Cooperation t) {
		return cooperationDao.findAll(t);
	}

	public Cooperation find(Cooperation t) {
		return cooperationDao.find(t);
	}

	public int add(Cooperation t) {
		return cooperationDao.add(t);
	}

	public int edit(Cooperation t) {
		return cooperationDao.edit(t);
	}

	public int remove(Cooperation t) {
		return cooperationDao.remove(t);
	}

	public int delete(Integer id) {
		return cooperationDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return cooperationDao.deleteMore(list);
	}

	public Cooperation queryById(Integer id) {
		return cooperationDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Cooperation> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return cooperationDao.queryByPage(map);
	}

	public List<Cooperation> queryAll() {
		return cooperationDao.queryAll();
	}

	public int getTotals() {
		return cooperationDao.getTotals();
	}

	public List<Cooperation> queryByProjectId(Integer id) {
		return cooperationDao.queryByProjectId(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Cooperation> searchByCondition(String condition1,
			String condition2, Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("condition1", condition1);
		map.put("condition2", condition2);
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return cooperationDao.searchByCondition(map);
	}

}
