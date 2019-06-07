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

import com.iurc.dao.ReplyDao;
import com.iurc.entity.Msg;
import com.iurc.entity.Reply;
import com.iurc.entity.User;
import com.iurc.service.ReplyService;
@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource
	private ReplyDao replyDao;
	
	public List<Reply> findAll(Reply t) {
		return replyDao.findAll(t);
	}

	public Reply find(Reply t) {
		return replyDao.find(t);
	}

	public int add(Reply t) {
		return replyDao.add(t);
	}

	public int edit(Reply t) {
		return replyDao.edit(t);
	}

	public int remove(Reply t) {
		return replyDao.remove(t);
	}

	public int delete(Integer id) {
		return replyDao.delete(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return replyDao.deleteMore(list);
	}

	public Reply queryById(Integer id) {
		return replyDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Reply> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return replyDao.queryByPage(map);
	}

	public List<Reply> queryAll() {
		return replyDao.queryAll();
	}

	public int getTotals() {
		return replyDao.getTotals();
	}

	public List<Reply> queryReplyByThemeId(Integer id) {
		return replyDao.queryReplyByThemeId(id);
	}

	public Msg reTheme(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); // 在登录时将 User 对象放入了 会话中
		Integer uid = user.getId();
		String reUserId = request.getParameter("reUserId");
		String content = request.getParameter("content");
		String themeId = request.getParameter("themeId");
		Reply reply =new Reply();
		int b =0;
		if(content!=null&&!(content.equals(""))){
			reply.setUid(uid);
			reply.setReUserId(Integer.valueOf(reUserId));
			reply.setContent(content);
			reply.setThemeId(Integer.valueOf(themeId));
			reply.setReplyTime(new Timestamp(System.currentTimeMillis()));
			reply.setId(0);
			reply.setState(0);
			b = replyDao.add(reply);
		}
		Msg msg =new Msg();
		if(b>0){//发表成功
			msg.setState(1);
			msg.setMsg("发表成功。");
		}else{
			msg.setState(0);
			msg.setMsg("发表失败。");
		}
		return msg;
	}

	public List<Reply> queryByUid(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); // 在登录时将 User 对象放入了 会话中
		Integer uid = user.getId();
		List<Reply>  list = replyDao.queryByUid(uid);
		return list;
	}
	
	
	

	

}
