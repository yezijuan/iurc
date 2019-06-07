package com.iurc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Msg;
import com.iurc.entity.Pager;
import com.iurc.entity.Project;
import com.iurc.service.BaseService;
import com.iurc.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController<Project>{

	@Resource
	private ProjectService projectService;
	@Override
	protected BaseService<Project> getBaseService() {
		return projectService;
	}

	@Override
	protected String getPrefix() {
		// TODO Auto-generated method stub
		return "/project";
	}
	
	
	/**
	 * 查询所有
	 */
	@RequestMapping("/query")
	public void query(){
		JSONObject json = new JSONObject();
		try{
			List<Project> list = projectService.queryAll();
			json.put("project",list);
			json.put("state", true);
		}catch(Exception e){
			json.put("msg", "操作失败。");
			json.put("state", false);
		}finally{
			String jsonStr = JSON.toJSONString(json);
			System.out.println(jsonStr);
			write(jsonStr);
		}		
	}
	
	

	@RequestMapping("searchByCondition")
	public void searchByCondition(String condition1,String condition2,String page,String rows) throws Exception{
		JSONObject json = new JSONObject();
		Pager<Project> pager = new Pager<Project>(getBaseService().getTotals(),page,rows);
		json.put("total",getBaseService().getTotals());
		json.put("rows", projectService.searchByCondition(condition1, condition2,pager.getSp(), pager.getPageSize()));
		String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
		System.out.println(jsonStr);
		write(jsonStr);
	}
	

	/**
	 * 拟定项目
	 */
	@RequestMapping("/drawUpProject")
	public void drawUpProject(){
		JSONObject json = new JSONObject();
		Msg msg= new Msg();
		try{
			msg = projectService.drawUpProject(request,response);
			json.put("msg",msg.getMsg());
			json.put("state", msg.getState());
		}catch(Exception e){
			json.put("msg", "操作失败。");
			json.put("state", 0);
		}finally{
			String jsonStr = JSON.toJSONString(json);
			System.out.println(jsonStr);
			write(jsonStr);
		}		
	}
	

}
