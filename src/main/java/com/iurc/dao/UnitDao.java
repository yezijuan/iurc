package com.iurc.dao;

import java.util.List;

import com.iurc.entity.Unit;

public interface UnitDao extends BaseDao<Unit> {
	public List<Unit> findAllUnit();
	public List<Unit> queryUnitByType(Integer unitType);
	public int checkById(Integer id);
	public Unit queryUnitByUserId(Integer id);
	
	
}
