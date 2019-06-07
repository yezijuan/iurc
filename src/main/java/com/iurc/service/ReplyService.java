package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iurc.entity.Msg;
import com.iurc.entity.Reply;

public interface ReplyService extends BaseService<Reply>{
	/*
	 * 通过主题id查询回复
	 * */
	public List<Reply> queryReplyByThemeId(Integer id);
	/*
	 * 通过用户id添加指定主题回复
	 * */
	public Msg reTheme(HttpServletRequest request, HttpServletResponse response);
	
	/*
	 * 通过用户uid查询回复
	 * */
	public List<Reply> queryByUid(HttpServletRequest request);
}
