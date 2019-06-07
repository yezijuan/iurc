package com.iurc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Msg;
import com.iurc.entity.Reply;
import com.iurc.entity.User;
import com.iurc.service.BaseService;
import com.iurc.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController extends BaseController<Reply>{

	@Resource
	private ReplyService replyService;
	@Override
	protected BaseService<Reply> getBaseService() {
		return replyService;
	}

	@Override
	protected String getPrefix() {
		return "/reply";
	}
	
	
	
	/**
	 * 根据登录用户编号查询回复信息
	 * 
	 */
	@RequestMapping("/queryReply")
	public void queryReply(){
		JSONObject json = new JSONObject();
		List<Reply> list =null;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		try{
			if(user==null){
				json.put("msg", "用户未登录。");
				json.put("state", false);
			}else{//已登录
				list = replyService.queryByUid(request);
				json.put("replys",list);
				json.put("state", true);
			}
		}catch(Exception e){
			json.put("msg", "操作失败。");
			json.put("state", false);
		}finally{
			//DisableCircularReferenceDetect来禁止循环引用检测
			String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println(jsonStr);
			write(jsonStr);
		}
	}
	
	/**
	 * 根据主题编号分页查询回复情况
	 * @param page
	 * @param rows
	 */
	@RequestMapping("/reTheme")
	public void reTheme(){
		JSONObject json = new JSONObject();
		Msg msg =null;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		try{
			if(user==null){
				json.put("msg", "用户未登录，回复失败。");
				json.put("state", false);
			}else{//已登录
				msg = replyService.reTheme(request, response);
				json.put("msg",msg.getMsg());
				json.put("state", true);
			}
		}catch(Exception e){
			json.put("msg", "操作失败。");
			json.put("state", false);
		}finally{
			//DisableCircularReferenceDetect来禁止循环引用检测
			String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println(jsonStr);
			write(jsonStr);
		}
	}
	

	
}
