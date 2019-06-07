package com.iurc.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Collection;
import com.iurc.entity.Msg;
import com.iurc.entity.Reply;
import com.iurc.entity.Theme;
import com.iurc.entity.User;
import com.iurc.service.BaseService;
import com.iurc.service.CollectionService;
import com.iurc.service.ReplyService;
import com.iurc.service.ThemeService;

@Controller
@RequestMapping("/theme")
public class ThemeController extends BaseController<Theme>{

	@Resource
	private ThemeService themeService;
	@Resource
	private ReplyService replyService;
	@Resource
	private CollectionService collectionServise;
	@Override
	protected BaseService<Theme> getBaseService() {
		return themeService;
	}

	@Override
	protected String getPrefix() {
		return "/theme";
	}
	
	
    /**
     * Theme 登陆用户在贴吧中心发的帖子
     * 
     */
	@RequestMapping("/addTheme")
	public void addTheme(){
		JSONObject json = new JSONObject();
		Msg msg =new Msg();
		try{
			msg = themeService.addTheme(request,response);
			json.put("msg", msg.getMsg());
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", msg.getMsg());
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	
	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 */
	@RequestMapping("/queryThemeByPage")
	public void queryThemeByPage(){
		JSONObject json = new JSONObject();
		try{
			//查询
			List<Theme> list = themeService.queryThemeByPage(1, 10);
			json.put("theme", list);
			json.put("state", true);
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
	
	
	
	@RequestMapping("findTheme")
	public String findTheme(Map<String,Object> map){
		
		String themeId = request.getParameter("id");
		Integer id = Integer.valueOf(themeId);
		Theme theme = new Theme();
		theme.setId(id);
		//1.找到Theme
		Theme n =getBaseService().find(theme);
		System.out.println(n.toString());
		
		//请求转发
		request.getSession().setAttribute("theme",n);
		return "redirect:/themeInfo.jsp";
	}
	
	
	/**
	 * 根据主题编号分页查询回复情况
	 * 
	 */
	@RequestMapping("/queryReplyByThemeId")
	public void queryReplyByThemeId(String id){
		JSONObject json = new JSONObject();
		try{
			List<Reply> list = replyService.queryReplyByThemeId(Integer.valueOf(id));
			json.put("reply",list);
			json.put("state", true);
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
	 * 通过登陆用户的id查询主题收藏
	 * */
	@RequestMapping("/queryByUidAndType")
	public void queryByUidAndType(){
		JSONObject json = new JSONObject();
		try{
			List<Theme> list = themeService.queryByUidAndType(request);
			json.put("themes",list);
			json.put("state", true);
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
	 * 通过登陆用户的id查询主题收藏
	 * */
	@RequestMapping("/queryByUid")
	public void queryByUid(){
		JSONObject json = new JSONObject();
		try{
			List<Theme> list = themeService.queryByUid(request);
			json.put("themes",list);
			json.put("state", true);
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
	 *  Theme 禁用操作
	 * @param id
	 */
	@RequestMapping("/disablesById")
	public void disablesById( int id){
		JSONObject json = new JSONObject();
		Msg msg = null;
		try{
			msg =  themeService.disablesById(id,request,response);
			json.put("msg", msg.getMsg());
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg",  "禁用失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	
	
	/**
	 *  T 收藏操作
	 * @param t
	 */
	@RequestMapping("/collect")
	public void collect(String id){
		JSONObject json = new JSONObject();
		//1.获取登陆用户的信息
		User user = (User) request.getSession().getAttribute("user");
		try{
			if(user!=null){
				//2.保存收藏信息到数据库库
				Collection c = new Collection();
				c.setId(0);
				c.setUid(user.getId());
				c.setType(2);//收藏类别：1新闻 2主题
				c.setTypeId(Integer.parseInt(id));
				c.setState(0);
				c.setCreateTime(new Timestamp(System.currentTimeMillis()));
				//查询该用户是否收藏过该新闻
				Collection co = collectionServise.find(c);
				if(co==null){//
					collectionServise.add(c);
					json.put("msg", "收藏成功");
					json.put("state", 1);
				}else{
					json.put("msg", "已收藏");
					json.put("state", 1);
				}
				
			}else{
				json.put("msg", "用户未登陆，收藏失败");
				json.put("state", 0);
			}
			
		}catch(Exception e){
			json.put("msg", "收藏失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	

}
