package com.iurc.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iurc.dao.UnitDao;
import com.iurc.entity.Unit;
@Repository("unitDao")
public class UnitDaoImpl extends BaseDaoImpl<Unit>  implements UnitDao {

	@Override
	public String getNs() {
		return "com.iurc.dao.UnitDao";
	}

	public List<Unit> findAllUnit() {
		List<Unit> list = getSqlSession().selectList(getNs()+".findAllUnit");
		return list;
	}

	public List<Unit> queryUnitByType(Integer unitType) {
		List<Unit> list = getSqlSession().selectList(getNs()+".queryUnitByType",unitType);
		return list;
	}

	public int checkById(Integer id) {
		return getSqlSession().update(getNs()+".checkById", id);
	}

	public Unit queryUnitByUserId(Integer id) {
		return getSqlSession().selectOne(getNs()+".queryUnitByUserId", id);
	}

	
}
