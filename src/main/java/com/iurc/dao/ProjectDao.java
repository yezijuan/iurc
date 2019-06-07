package com.iurc.dao;

import java.util.List;
import java.util.Map;

import com.iurc.entity.Project;
public interface ProjectDao extends BaseDao<Project> {
	public List<Project> queryByProjectId(Integer id);
	@SuppressWarnings("rawtypes")
	public List<Project> searchByCondition(Map map);
}
