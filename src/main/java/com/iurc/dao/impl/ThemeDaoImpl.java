package com.iurc.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iurc.dao.ThemeDao;
import com.iurc.entity.Theme;
@Repository("themeDao")
public class ThemeDaoImpl extends BaseDaoImpl<Theme>  implements ThemeDao{

	@Override
	public String getNs() {
		return "com.iurc.dao.ThemeDao";
	}

	
	@SuppressWarnings("rawtypes")
	public List<Theme> queryThemeByPage(Map map) {
		return getSqlSession().selectList(getNs()+".queryThemeByPage",map);
	}

	
	public List<Theme> queryByUidAndType(Integer uid) {
		return getSqlSession().selectList(getNs()+".queryByUidAndType",uid);
	}

	
	public List<Theme> queryByUid(Integer uid) {
		return getSqlSession().selectList(getNs()+".queryByUid",uid);
	}

	
	public int disablesById(Integer id) {
		return getSqlSession().update(getNs()+".disablesById", id);
	}

}
