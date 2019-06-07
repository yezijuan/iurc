package com.iurc.dao;

import java.util.List;
import java.util.Map;

import com.iurc.entity.Cooperation;

public interface CooperationDao extends BaseDao<Cooperation> {
	/**
	 * 通过项目id查询合同
	 * */
	public List<Cooperation> queryByProjectId(Integer id);
	/**
	 * 通过合作方id查询合同
	 * */
	public List<Cooperation> queryBycUnitId(Integer id);
	/**
	 * 查询所有合同
	 * */
	public List<Cooperation> queryCooperation();
	/**
	 * 通过合同id查询单位合同
	 * */
	public List<Cooperation> queryByCooperationId(Integer id);
	/**
	 * 高级用户分页查询本单位合同
	 * */
	@SuppressWarnings("rawtypes")
	public List<Cooperation> searchByCondition(Map map);
	
}
