package com.iurc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Pager;
import com.iurc.service.BaseService;
import com.iurc.util.TimestampEditor;
/**
 * BaseController<T>  泛型
 * abstract  抽象类
 * 
 *
 * @param <T>
 */
public abstract class BaseController<T> {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	//两个抽象方法
	protected abstract BaseService<T> getBaseService();
	protected abstract String getPrefix();
	
	protected final String ADD=getPrefix()+"add";
	protected final String UPDATE=getPrefix()+"update";
	protected final String VIEW=getPrefix()+"view";
	protected final String LIST=getPrefix()+"list";
	/**
	 * //被@ModelAttribute注释的方法会在controller每个方法执行前都执行（方法无返回值）
	 * @param request
	 * @param response
	 */
	@ModelAttribute      
	public void setReqAndRes(HttpServletRequest request,HttpServletResponse response){
		this.request = request;
		this.response = response;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	    binder.registerCustomEditor(Timestamp.class, new TimestampEditor());  
	}
	
	/**
	 * PrintWriter 
	 * @param json
	 */
    public void write(String json){
    	PrintWriter out = null;
    	try {
        	response.setContentType("text/html;charset=utf-8");
    		out = response.getWriter();
    		out.write(json);
    		out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
    }
    /**
     * 
     * @return
     */
    public HttpSession getSession() {
        return request.getSession(true);
    }
    /**
     * T 新增操作
     * @param t
     */
	@RequestMapping("/add")
	public void add(T t){
		JSONObject json = new JSONObject();
		try{
			getBaseService().add(t);
			json.put("msg", "保存成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "保存失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	/**
	 *  T 更新操作
	 * @param t
	 */
	@RequestMapping("/update")
	public void update(T t){
		JSONObject json = new JSONObject();
		try{
			getBaseService().edit(t);
			json.put("msg", "更新成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "更新失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	/**
	 * T 删除操作
	 * @param id
	 */
	@RequestMapping("/delete")
	public void delete(String id){
		JSONObject json = new JSONObject();
		try{
			getBaseService().delete(Integer.parseInt(id));
			json.put("msg", "删除成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "删除失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	/**
	 * 根据 ids 批量删除操作
	 * @param ids
	 */
	@RequestMapping("/deleteMore")
	public void deleteMore(String ids){
		JSONObject json = new JSONObject();
		try{
			getBaseService().deleteMore(ids);
			json.put("msg", "删除成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "删除失败");
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
	@RequestMapping("/queryByPage")
	public void queryByPage(String page,String rows){
		JSONObject json = new JSONObject();
		Pager<T> pager = new Pager<T>(getBaseService().getTotals(),page,rows);
		json.put("total",getBaseService().getTotals());
		json.put("rows", getBaseService().queryByPage(pager.getSp(), pager.getPageSize()));
		//DisableCircularReferenceDetect来禁止循环引用检测
		String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
		System.out.println(jsonStr);
		write(jsonStr);
	}
	/**
	 * 查询所有
	 */
	@RequestMapping("/queryAll")
	public void queryAll(){
		String json = JSONArray.toJSONString(getBaseService().queryAll());
		System.out.println(json);
		write(json);
	}
	
	/**
	 * 查询所有id号
	 */
	@RequestMapping("/queryById")
	public void queryById(int id){
		String json = JSONArray.toJSONString(getBaseService().queryById(id));
		System.out.println(json);
		write(json);
	}

}
