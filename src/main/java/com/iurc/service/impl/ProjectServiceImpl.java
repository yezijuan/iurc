package com.iurc.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.iurc.dao.ProjectDao;
import com.iurc.entity.Msg;
import com.iurc.entity.Project;
import com.iurc.entity.Unit;
import com.iurc.entity.User;
import com.iurc.service.ProjectService;
@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectDao projectDao;
	
	public List<Project> findAll(Project t) {
		return projectDao.findAll(t);
	}

	public Project find(Project t) {
		return projectDao.find(t);
	}

	public int add(Project t) {
		return projectDao.add(t);
	}

	public int edit(Project t) {
		return projectDao.edit(t);
	}

	public int remove(Project t) {
		return projectDao.remove(t);
	}

	public int delete(Integer id) {
		return projectDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return projectDao.deleteMore(list);
	}

	public Project queryById(Integer id) {
		return projectDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Project> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return projectDao.queryByPage(map);
	}

	public List<Project> queryAll() {
		return projectDao.queryAll();
	}

	public int getTotals() {
		return projectDao.getTotals();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Project> searchByCondition(String condition1, String condition2,
			Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("condition1", condition1);
		map.put("condition2", condition2);
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return projectDao.searchByCondition(map);
	}

	public Msg drawUpProject(HttpServletRequest request,
			HttpServletResponse response) {
		//判断用户是否已登录
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//获取请求信息
		String  projectName= request.getParameter("projectName");
		String  projectContent= request.getParameter("projectContent");
		Msg msg= new Msg();
		if(user!=null){
			Project project = new Project();
			project.setId(0);
			project.setProjectName(projectName);
			project.setProjectContent(projectContent);
			project.setUnitId(user.getUnitId());
			project.setProjectFoundingTime(new Timestamp(System.currentTimeMillis()));
			project.setState(0);
			projectDao.add(project);
			msg.setState(1);
			msg.setMsg("发布成功。");
		}else{
			msg.setState(0);
			msg.setMsg("登录信息已失效,。");
		}
		return msg;
	}
	

}
