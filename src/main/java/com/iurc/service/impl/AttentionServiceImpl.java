package com.iurc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.iurc.dao.AttentionDao;
import com.iurc.entity.Attention;
import com.iurc.entity.User;
import com.iurc.service.AttentionService;
@Service("attentionService")
public class AttentionServiceImpl implements AttentionService {

	@Resource
	private AttentionDao attentionDao;
	public List<Attention> findAll(Attention t) {
		return attentionDao.findAll(t);
	}

	public Attention find(Attention t) {
		return attentionDao.find(t);
	}

	public int add(Attention t) {
		return attentionDao.add(t);
	}

	public int edit(Attention t) {
		return attentionDao.edit(t);
	}

	public int remove(Attention t) {
		return attentionDao.remove(t);
	}

	public int delete(Integer id) {
		return attentionDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return attentionDao.deleteMore(list);
	}

	public Attention queryById(Integer id) {
		return attentionDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Attention> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return attentionDao.queryByPage(map);
	}

	public List<Attention> queryAll() {
		return attentionDao.queryAll();
	}

	public int getTotals() {
		return attentionDao.getTotals();
	}

	public List<Attention> queryByuid(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Attention> attention = null;
		if(user!=null){
			attention = attentionDao.queryByuid(user.getId());
		}
		return attention;
	}

	public List<Attention> queryByaid(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Attention> attention = null;
		if(user!=null){
			attention = attentionDao.queryByaid(user.getId());
		}
		return attention;
	}

}
