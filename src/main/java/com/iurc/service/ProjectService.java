package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Msg;
import com.iurc.entity.Project;

public interface ProjectService extends BaseService<Project>{
	public List<Project> searchByCondition(String condition1, String condition2,
			Integer currentPage, Integer pageSize);
	/**
	 * 高级用户拟定项目
	 * */
	public Msg drawUpProject(HttpServletRequest request, 
			HttpServletResponse response);
}
