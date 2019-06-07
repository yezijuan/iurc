package com.iurc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iurc.dao.CheckedDao;
import com.iurc.entity.Checked;
import com.iurc.service.CheckedService;
@Service("checkedService")
public class CheckedServiceImpl implements CheckedService {

	@Resource
	private CheckedDao checkedDao;
	
	public List<Checked> findAll(Checked t) {
		return checkedDao.findAll(t);
	}

	public Checked find(Checked t) {
		return checkedDao.find(t);
	}

	public int add(Checked t) {
		return checkedDao.add(t);
	}

	public int edit(Checked t) {
		return checkedDao.edit(t);
	}

	public int remove(Checked t) {
		return checkedDao.remove(t);
	}

	public int delete(Integer id) {
		return checkedDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return checkedDao.deleteMore(list);
	}

	public Checked queryById(Integer id) {
		return checkedDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Checked> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return checkedDao.queryByPage(map);
	}

	public List<Checked> queryAll() {
		return checkedDao.queryAll();
	}

	public int getTotals() {
		return checkedDao.getTotals();
	}

}
