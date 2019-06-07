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
import org.springframework.web.multipart.MultipartFile;

import com.iurc.dao.CheckedDao;
import com.iurc.dao.NewsDao;
import com.iurc.entity.Checked;
import com.iurc.entity.Msg;
import com.iurc.entity.News;
import com.iurc.entity.UploadFile;
import com.iurc.entity.User;
import com.iurc.service.NewsService;
import com.iurc.util.FileUtil;
@Service("newsService")
public class NewsServiceImpl implements NewsService {

	@Resource
	private NewsDao newsDao;
	@Resource
	private CheckedDao checkedDao;
	
	public List<News> findAll(News t) {
		return newsDao.findAll(t);
	}

	public News find(News t) {
		return newsDao.find(t);
	}

	public int add(News t) {
		return newsDao.add(t);
	}

	public int edit(News t) {
		return newsDao.edit(t);
	}

	public int remove(News t) {
		return newsDao.remove(t);
	}

	public List<News> findAllNews() {
		return newsDao.findAllNews();
	}
	

	public List<News> findCooperationNews(Integer type) {
		List<News> list = newsDao.findAllNews();
		List<News> l = new ArrayList<News>();
		for(News n : list){
			if(n.getNewsTypeId()==1){
				l.add(n);
			}
		}
		return l;
	}
	
	public List<News> findTechnologyNews(Integer type) {
		List<News> list = newsDao.findAllNews();
		List<News> l = new ArrayList<News>();
		for(News n : list){
			if(n.getNewsTypeId()==2){
				l.add(n);
			}
		}
		return l;
	}

	public int put(String uploadPath, MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
	
		int i =0;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String newsTypeId = request.getParameter("newsTypeId");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); // 在登录时将 User 对象放入了 会话中
		//判断登录用户的权限 userType（高级用户和管理员新增的新闻不需要再审核）
		Integer userType = user.getUserType();
		News news = new News();
		if(userType==1){
			news.setChecked(0);//未审核
			news.setState(1);//禁用
		}else{
			news.setChecked(1);//已审核
			news.setState(0);//可用
		}
		UploadFile  uploadFile = FileUtil.upload(uploadPath, file, request);
		if(uploadFile!=null){//上传成功
			Integer uid = user.getId();
			String path="/iurc1.1/upload/news/"+uploadFile.getFileName();
			news.setId(0);
			news.setTitle(title);
			news.setContent(content);
			news.setPicture(path);
			news.setReportTime(null);
			news.setNewsTypeId(Integer.valueOf(newsTypeId));
			news.setAuthor(uid);
			news.setReadCounts(0);
			news.setPraiseCounts(0);
			news.setCollectionCounts(0);
			news.setCreateTime(new Timestamp(System.currentTimeMillis()));
			System.out.println(path);
			i = add(news);
    		return i;
		}
		return i;
	}

	public List<News> queryByPage(Integer currentPage, Integer pageSize) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return newsDao.queryByPage(map);
	}
	public List<News> queryPage(Integer author,Integer newsTypeId,Integer currentPage, Integer pageSize) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("author", author);
		map.put("newsTypeId", newsTypeId);
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return newsDao.queryPage(map);
	}

	public int delete(Integer id) {
		return newsDao.delete(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return newsDao.deleteMore(list);
	}

	public News queryById(Integer id) {
		return newsDao.queryById(id);
	}

	public List<News> queryAll() {
		return newsDao.queryAll();
	}

	public int getTotals() {
		return newsDao.getTotals();
	}

	public List<News> queryNews(Integer newsTypeId, Integer currentPage,
			Integer pageSize) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("newsTypeId", newsTypeId);
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return newsDao.queryNews(map);
	}

	public List<News> myCollection(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer author = user.getId();
		List<News> list = newsDao.myCollection(author);
		return list;
	}

	public List<News> myRelease(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer id = user.getId();
		List<News> list = newsDao.myRelease(id);
		return list;
	}

	public Msg checkById(Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Checked t = new Checked();
		t.setId(0);
		t.setType(3);//审核类型为3 表示对单位的审核  3.News
		t.setTypeId(id);
		t.setUid(user.getId());
		t.setState(0);
		t.setCheckTime(new Timestamp(System.currentTimeMillis()));
		Msg msg = new Msg();
		//1.禁用该用户,把禁用审核记录到审核表
		int i = newsDao.checkById(id);
		int j = checkedDao.add(t);
		if(i>0&&j>0){
			msg.setMsg("审核成功。");
			msg.setState(1);
		}else{
			msg.setMsg("审核失败。");
			msg.setState(0);
		}
		return msg;
	}

}
