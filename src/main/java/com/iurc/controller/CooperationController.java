package com.iurc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Cooperation;
import com.iurc.entity.Pager;
import com.iurc.service.BaseService;
import com.iurc.service.CooperationService;

@Controller
@RequestMapping("/cooperation")
public class CooperationController extends BaseController<Cooperation>{

	@Resource
	private CooperationService cooperationService;
	@Override
	protected BaseService<Cooperation> getBaseService() {
		return cooperationService;
	}

	@Override
	protected String getPrefix() {
		return "/cooperation";
	}
	
	/**
	 * 查询所有
	 */
	@RequestMapping("/query")
	public void query(){
		JSONObject json = new JSONObject();
		try{
			List<Cooperation> list = cooperationService.queryAll();
			json.put("cooperation",list);
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
		Pager<Cooperation> pager = new Pager<Cooperation>(getBaseService().getTotals(),page,rows);
		json.put("total",getBaseService().getTotals());
		json.put("rows", cooperationService.searchByCondition(condition1, condition2,pager.getSp(), pager.getPageSize()));
		String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
		System.out.println(jsonStr);
		write(jsonStr);
	}
	
	
	
}
