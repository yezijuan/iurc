package com.iurc.dao.impl;

import org.springframework.stereotype.Repository;

import com.iurc.dao.CollectionDao;
import com.iurc.entity.Collection;
@Repository("collectionDao")
public class CollectionDaoImpl extends BaseDaoImpl<Collection>  implements CollectionDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.CollectionDao";
	}

}
