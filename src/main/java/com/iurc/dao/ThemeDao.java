package com.iurc.dao;

import java.util.List;
import java.util.Map;
import com.iurc.entity.Theme;

public interface ThemeDao extends BaseDao<Theme> {
	@SuppressWarnings("rawtypes")
	public List<Theme> queryThemeByPage(Map map);
	/**
	 * 通过登陆用户的id查询主题收藏
	 * */
	public List<Theme> queryByUidAndType(Integer uid);
	/**
	 * 通过登陆用户的id查询已发表的主题
	 * */
	public List<Theme> queryByUid(Integer uid);
	
	public int disablesById(Integer id);
}
