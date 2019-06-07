package com.iurc.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Msg;
import com.iurc.entity.Unit;
import com.iurc.entity.User;

public interface UserService extends BaseService<User> {
	
	public List<Unit> queryByUnitId(Integer id);
	
	public Msg login(String username, String password,String code,
			HttpServletRequest request, HttpServletResponse response);
	
	public Msg register(String username, String password,String code,
			HttpServletRequest request, HttpServletResponse response);
	
	public Msg changePassword(String password,String code,
			HttpServletRequest request, HttpServletResponse response);
	
	public Msg editPersonalInformation(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public Msg forgetPassword(String username, String password, String code,
			HttpServletRequest request);
	
	public Msg disablesById(Integer id, HttpServletRequest request, HttpServletResponse response);
	
	public Msg attention(Integer id, HttpServletRequest request, HttpServletResponse response);
	
	public List<User> searchByCondition(String condition1, String condition2,Integer currentPage, Integer pageSize);
	/**
	 * 通过id添加单位代理人
	 * */
	public Msg addAgentById(Integer id, HttpServletRequest request, HttpServletResponse response);
	
}
