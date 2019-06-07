package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Msg;
import com.iurc.entity.Unit;

public interface UnitService extends BaseService<Unit> {
	public List<Unit> findAllUnit();
	public List<Unit> queryUnitByType(Integer unitType);
	
	public Msg agentApplication(HttpServletRequest request, 
			HttpServletResponse response);
	public Msg checkById(Integer id,HttpServletRequest request,
			HttpServletResponse response);
	
	public Unit queryUnitByUserId(Integer id);
	
	
	
}
