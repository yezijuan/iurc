package com.iurc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iurc.dao.CooperationDao;
import com.iurc.entity.Cooperation;
@Repository("cooperationDao")
public class CooperationDaoImpl extends BaseDaoImpl<Cooperation>  implements CooperationDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.CooperationDao";
	}

	
	public List<Cooperation> queryByProjectId(Integer id) {
		List<Cooperation> list = getSqlSession().selectList(getNs()+".queryByProjectId",id);
		return list;	
	}

	
	public List<Cooperation> queryBycUnitId(Integer id) {
		List<Cooperation> list = getSqlSession().selectList(getNs()+".queryBycUnitId",id);
		return list;
	}

	
	public List<Cooperation> queryCooperation() {
		List<Cooperation> list = getSqlSession().selectList(getNs()+".queryCooperation");
		return list;
	}

	
	public List<Cooperation> queryByCooperationId(Integer id) {
		List<Cooperation> list = getSqlSession().selectList(getNs()+".queryByCooperationId",id);
		return list;
	}

	
	@SuppressWarnings("rawtypes")
	public List<Cooperation> searchByCondition(Map map) {
		return getSqlSession().selectList(getNs()+".searchByCondition",map);
	}

}
