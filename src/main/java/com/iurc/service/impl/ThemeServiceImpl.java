package com.iurc.service.impl;

import java.sql.Timestamp;
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

import com.iurc.dao.CheckedDao;
import com.iurc.dao.ThemeDao;
import com.iurc.entity.Checked;
import com.iurc.entity.Msg;
import com.iurc.entity.Theme;
import com.iurc.entity.User;
import com.iurc.service.ThemeService;
@Service("themeService")
public class ThemeServiceImpl implements ThemeService {

	@Resource
	private ThemeDao themeDao;
	@Resource
	private CheckedDao checkedDao;
	
	public List<Theme> findAll(Theme t) {
		return themeDao.findAll(t);
	}

	public Theme find(Theme t) {
		return themeDao.find(t);
	}

	public int add(Theme t) {
		return themeDao.add(t);
	}

	public int edit(Theme t) {
		return themeDao.edit(t);
	}

	public int remove(Theme t) {
		return themeDao.remove(t);
	}

	public int delete(Integer id) {
		return themeDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return themeDao.deleteMore(list);
	}

	public Theme queryById(Integer id) {
		return themeDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Theme> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return themeDao.queryByPage(map);
	}

	public List<Theme> queryAll() {
		return themeDao.queryAll();
	}

	public int getTotals() {
		return themeDao.getTotals();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Theme> queryThemeByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return themeDao.queryThemeByPage(map);
	}

	public Msg addTheme(HttpServletRequest request, HttpServletResponse response) {
		//判断用户是否已登录
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//获取请求信息
		String  title= request.getParameter("title");
		String  content= request.getParameter("content");
		Msg msg =new Msg();
		if(user!=null){
			Theme theme = new Theme();
			theme.setUid(user.getId());
			theme.setTitle(title);
			theme.setContent(content);
			theme.setId(0);
			theme.setState(0);
			theme.setDeliverTime(new Timestamp(System.currentTimeMillis()));
			themeDao.add(theme);
			msg.setState(1);
			msg.setMsg("保存成功。");
		}else{
			msg.setState(0);
			msg.setMsg("保存失败。");
		}
		
		return msg;
	}

	public List<Theme> queryByUidAndType(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		List<Theme>  list = themeDao.queryByUidAndType(uid);
		return list;
	}

	public List<Theme> queryByUid(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		List<Theme>  list = themeDao.queryByUid(uid);
		return list;
	}

	public Msg disablesById(Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Checked t = new Checked();
		t.setId(0);
		t.setType(4);//审核类型为4 表示对主题的审核  4.Theme
		t.setTypeId(id);
		t.setUid(user.getId());
		t.setState(0);
		t.setCheckTime(new Timestamp(System.currentTimeMillis()));
		Msg msg = new Msg();
		//1.禁用该用户,把禁用审核记录到审核表
		int i = themeDao.disablesById(id);
		int j = checkedDao.add(t);
		if(i>0&&j>0){
			msg.setMsg("禁用成功。");
			msg.setState(1);
		}else{
			msg.setMsg("禁用失败。");
			msg.setState(0);
		}
		return msg;
	}

	

}
