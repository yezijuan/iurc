package com.iurc.dao;

import java.util.List;

import com.iurc.entity.Attention;
public interface AttentionDao extends BaseDao<Attention> {
	/**
	 * 通过登陆用户的id号查询自己关注的用户
	 * */
	public List<Attention> queryByuid(Integer id);
	/**
	 * 通过登陆用户的id号查询被谁关注
	 * */
	public List<Attention> queryByaid(Integer id);
	
}
