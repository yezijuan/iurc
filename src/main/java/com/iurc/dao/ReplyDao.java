package com.iurc.dao;

import java.util.List;

import com.iurc.entity.Reply;

public interface ReplyDao extends BaseDao<Reply> {
	/**
	 * 通过主题id查询回复
	 * */
	public List<Reply> queryReplyByThemeId(Integer id);
	/**
	 * 通过用户uid查询回复
	 * */
	public List<Reply> queryByUid(Integer uid);
}
