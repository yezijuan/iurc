package com.iurc.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iurc.dao.ReplyDao;
import com.iurc.entity.Reply;
@Repository("replyDao")
public class ReplyDaoImpl extends BaseDaoImpl<Reply>  implements ReplyDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.ReplyDao";
	}

	
	public List<Reply> queryReplyByThemeId(Integer id) {
		List<Reply> list = getSqlSession().selectList(getNs()+".queryReplyByThemeId",id);
		return list;
	}

	
	public List<Reply> queryByUid(Integer uid) {
		List<Reply> list = getSqlSession().selectList(getNs()+".queryByUid",uid);
		return list;
	}

}
