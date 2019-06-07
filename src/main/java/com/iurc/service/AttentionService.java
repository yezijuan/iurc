package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Attention;

public interface AttentionService extends BaseService<Attention>{
	/*
	 * 通过登陆用户的id号查询自己关注的用户
	 * */
	public List<Attention> queryByuid(HttpServletRequest request, 
			HttpServletResponse response);
	/*
	 * 通过登陆用户的id号查询被谁关注
	 * */
	public List<Attention> queryByaid(HttpServletRequest request, 
			HttpServletResponse response);
}
