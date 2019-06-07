package com.iurc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iurc.dao.ProjectDao;
import com.iurc.entity.Project;
@Repository("projectDao")
public class ProjectDaoImpl extends BaseDaoImpl<Project>  implements ProjectDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.ProjectDao";
	}

	
	public List<Project> queryByProjectId(Integer id) {
		List<Project> list = getSqlSession().selectList(getNs()+".queryByProjectId",id);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List<Project> searchByCondition(Map map) {
		return getSqlSession().selectList(getNs()+".searchByCondition",map);
	}	
}
