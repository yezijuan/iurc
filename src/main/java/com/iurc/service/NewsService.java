package com.iurc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iurc.entity.Msg;
import com.iurc.entity.News;

public interface NewsService extends BaseService<News> {
	public List<News> findAllNews();
	public List<News> findCooperationNews(Integer type);
	public List<News> findTechnologyNews(Integer type);
	public int put(String uploadPath,  @RequestParam(value="picture",required=false)MultipartFile file,
    		HttpServletRequest request, HttpServletResponse response);
	
	public List<News> queryPage(Integer author,Integer newsTypeId,Integer currentPage, Integer pageSize);
	
	public List<News> queryNews(Integer newsTypeId,Integer currentPage, Integer pageSize);
	
	public List<News> myCollection(HttpServletRequest request, HttpServletResponse response);
	
	/*
	 * 根据登陆用户的id号查询用户投的新闻稿
	 * */
	public List<News> myRelease(HttpServletRequest request, HttpServletResponse response);
	
	public Msg checkById(Integer id,HttpServletRequest request,
			HttpServletResponse response);
	
}
