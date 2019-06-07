package com.iurc.controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iurc.entity.Collection;
import com.iurc.entity.Msg;
import com.iurc.entity.News;
import com.iurc.entity.User;
import com.iurc.service.BaseService;
import com.iurc.service.CollectionService;
import com.iurc.service.NewsService;
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController<News>{
	@Resource
	private NewsService newsServise;
	@Resource
	private CollectionService collectionServise;
	
	@Override
	protected BaseService<News> getBaseService() {		
		return newsServise;
	}

	@Override
	protected String getPrefix() {		
		return "/news";
	}
	
	
	@RequestMapping("queryPage")
	public void queryPage() throws Exception{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer author =null;
		if(user!=null){
			Integer id = user.getId();
			author = id;
		}
		String type = request.getParameter("type");
		Integer tp = Integer.valueOf(type);
		PrintWriter out = null;
		String json =null;
		try{
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			List<News> list = null;
			list = newsServise.queryPage(author,tp,1, 5);
			json = JSON.toJSONString(list);
			System.out.println(json);
		}catch(Exception e){
			
		}finally{
			out.write(json);
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping("queryNews")
	public void queryNews(String type) throws Exception{
		Integer tp = Integer.valueOf(type);
		String json = null;
		try{
			List<News> list = null;
			list = newsServise.queryNews(tp,1, 5);
			json = JSON.toJSONString(list);
			System.out.println(json);
		}catch(Exception e){
			
		}finally{
			write(json);
		}
		
	}
	
	
	@RequestMapping("findNews")
	public String findNews(HttpServletRequest request,Map<String,Object> map) throws Exception{
		String newsId = request.getParameter("id");
		Integer id = Integer.valueOf(newsId);
		News news = new News();
		news.setId(id);
		//1.找到News
		News n =newsServise.find(news);
		//2.阅读量加一
		n.setReadCounts(n.getReadCounts()+1);
		//3.更新News信息
		newsServise.edit(n);
		System.out.println(n);
		map.put("news", n);
		return "newsInfo";
	}

	@RequestMapping(value = "put", method = RequestMethod.POST)
	public void put(String uploadPath,  @RequestParam(value="picture",required=false)MultipartFile file,
    		HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int i = newsServise.put(uploadPath, file, request, response);
		
			if(i>0){//新闻提交成功
				response.sendRedirect(request.getContextPath() + "/newsRelease.jsp");
				JSONObject json = new JSONObject();
				try{
					json.put("msg", "提交成功");
					json.put("state", true);
				}catch(Exception e){
					json.put("msg", "提交失败");
					json.put("state", false);
				}finally{
					write(json.toJSONString());
				}
			}	
	}
	/**
	 *  T 点赞操作
	 * @param t
	 */
	@RequestMapping("/good")
	public void good(String id){
		JSONObject json = new JSONObject();
		try{
			News n=newsServise.queryById(Integer.parseInt(id));
			n.setPraiseCounts(n.getPraiseCounts()+1);
			getBaseService().edit(n);
			json.put("msg", "点赞成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "点赞失败");
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
				c.setType(1);//收藏类别：1新闻 2主题
				c.setTypeId(Integer.parseInt(id));
				c.setState(0);
				c.setCreateTime(new Timestamp(System.currentTimeMillis()));
				//查询该用户是否收藏过该新闻
				Collection co = collectionServise.find(c);
				if(co==null){//
					collectionServise.add(c);
					//3.更新News的收藏量
					News n=newsServise.queryById(Integer.parseInt(id));
					n.setCollectionCounts(n.getCollectionCounts()+1);
					getBaseService().edit(n);
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
	
	
	/**
	 * 我的新闻收藏 
	 * @param t
	 */
	@RequestMapping("/myCollection")
	public void myCollection(){
		JSONObject json = new JSONObject();
		try{
			List<News> list  = newsServise.myCollection(request, response);
			json.put("newsList", list);
			json.put("state", true);
		}catch(Exception e){
			json.put("msg", "查询失败。");
			json.put("state", false);
		}finally{
			write(json.toJSONString());
		}
	}
	
	
	/**
	 * 我投稿的新闻 
	 * @param t
	 */
	@RequestMapping("/myRelease")
	public void myRelease(){
		JSONObject json = new JSONObject();
		try{
			List<News> list  = newsServise.myRelease(request, response);
			json.put("newsList", list);
			json.put("state", true);
		}catch(Exception e){
			json.put("msg", "查询失败。");
			json.put("state", false);
		}finally{
			write(json.toJSONString());
		}
	}
	
	/**
	 *  News 审核操作
	 * @param id
	 */
	@RequestMapping("checkById")
	public void checkById( int id){
		JSONObject json = new JSONObject();
		try{
			Msg msg = newsServise.checkById(id,request,response);
			json.put("msg", msg.getMsg());
			json.put("state", msg.getState());
		}catch(Exception e){
			json.put("msg", "审核失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	
}
