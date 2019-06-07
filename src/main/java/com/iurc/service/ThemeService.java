package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Msg;
import com.iurc.entity.Theme;

public interface ThemeService extends BaseService<Theme>{
	public List<Theme> queryThemeByPage(Integer currentPage,Integer pageSize);
	public Msg addTheme(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 通过登陆用户的id查询主题收藏
	 * */
	public List<Theme> queryByUidAndType(HttpServletRequest request);
	
	/**
	 * 通过登陆用户的id查询已发表的主题
	 * */
	public List<Theme> queryByUid(HttpServletRequest request);
	
	public Msg disablesById(Integer id, HttpServletRequest request, HttpServletResponse response);
}
