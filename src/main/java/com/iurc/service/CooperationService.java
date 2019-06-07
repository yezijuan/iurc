package com.iurc.service;

import java.util.List;

import com.iurc.entity.Cooperation;

public interface CooperationService extends BaseService<Cooperation>{
	public List<Cooperation> queryByProjectId(Integer id);
	public List<Cooperation> searchByCondition(String condition1, String condition2,Integer currentPage, Integer pageSize);
}
