package com.iurc.dao.impl;

import org.springframework.stereotype.Repository;

import com.iurc.dao.CheckedDao;
import com.iurc.entity.Checked;
@Repository("checkedDao")
public class CheckedDaoImpl extends BaseDaoImpl<Checked>  implements CheckedDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.CheckedDao";
	}

}
