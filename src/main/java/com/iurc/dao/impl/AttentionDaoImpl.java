package com.iurc.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.iurc.dao.AttentionDao;
import com.iurc.entity.Attention;
@Repository("attentionDao")
public class AttentionDaoImpl extends BaseDaoImpl<Attention>  implements AttentionDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.AttentionDao";
	}

	
	public List<Attention> queryByuid(Integer id) {
		return  getSqlSession().selectList(getNs()+".queryByuid",id);
	}

	
	public List<Attention> queryByaid(Integer id) {
		return getSqlSession().selectList(getNs()+".queryByaid",id);
	}


	
}
