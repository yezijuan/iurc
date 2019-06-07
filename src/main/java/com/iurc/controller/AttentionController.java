package com.iurc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.iurc.entity.Attention;
import com.iurc.service.BaseService;
import com.iurc.service.AttentionService;

@Controller
@RequestMapping("/attention")
public class AttentionController extends BaseController<Attention>{

	@Resource
	private AttentionService attentionService;
	@Override
	protected BaseService<Attention> getBaseService() {
		return attentionService;
	}

	@Override
	protected String getPrefix() {
		return "/attention";
	}
	
	
	/**
     * 我的关注
     * @param t
     */
	@RequestMapping("/myAttention")
	public void myAttention(){
		JSONObject json = new JSONObject();
		List<Attention> attention = null;
		try{
			attention = attentionService.queryByuid(request, response);
			json.put("attention", attention);
			json.put("state", true);
		}catch(Exception e){
			json.put("msg", "保存失败");
			json.put("state", false);
		}finally{
			System.out.println(json);
			write(json.toJSONString());
		}
	}
	
	

	/**
     * 谁关注我
     * @param t
     */
	@RequestMapping("/attentionMe")
	public void attentionMe(){
		JSONObject json = new JSONObject();
		List<Attention> attention = null;
		try{
			attention = attentionService.queryByaid(request, response);
			json.put("attention", attention);
			json.put("state", true);
		}catch(Exception e){
			json.put("msg", "保存失败");
			json.put("state", false);
		}finally{
			System.out.println(json);
			write(json.toJSONString());
		}
	}

}
