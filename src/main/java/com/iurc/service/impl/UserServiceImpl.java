package com.iurc.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.iurc.dao.AttentionDao;
import com.iurc.dao.CheckedDao;
import com.iurc.dao.UserDao;
import com.iurc.entity.Attention;
import com.iurc.entity.Checked;
import com.iurc.entity.Msg;
import com.iurc.entity.Unit;
import com.iurc.entity.User;
import com.iurc.service.UserService;
import com.iurc.util.IurcPasword;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	@Resource
	private CheckedDao checkedDao;
	@Resource
	private AttentionDao attentionDao;
	
	public List<User> findAll(User t) {
		return userDao.findAll(t);
	}

	public int add(User t) {
		User u =t;
		u.setPassword(IurcPasword.getMD5(t.getPassword()));//密码加密保存
		return userDao.add(u);
	}

	public int edit(User t) {
		return userDao.edit(t);
	}

	public int remove(User t) {
		return userDao.remove(t);
	}

	public User find(User t) {
		return userDao.find(t);
	}

	public Msg login(String username, String password, String code,
			HttpServletRequest request, HttpServletResponse response) {
		//1.获取session
		HttpSession session = request.getSession();
		//2.获取session登录验证码
		String loginCode = (String)session.getAttribute("Code");
		//3.移除session保存的登录验证码
		session.removeAttribute("Code");
		Msg msg = new Msg();
		//4.验证码校验
		if(!(loginCode!=null&&loginCode.equalsIgnoreCase(code))){
				msg.setState(0);
				msg.setMsg("验证码错误，登录失败。");
				return msg;
		}else{
			//5.查询用户是否存在
			User user = new User();
			user.setUsername(username);
			//加密密码验证
			user.setPassword(IurcPasword.getMD5(password));
			User u =find(user);
			if(u!=null){
				if(u.getState()==0){//判断用户状态是否可用
					msg.setState(1);
					msg.setMsg("登录成功。");
					msg.setObj(u);
					//把用户信息存放到session
					session.setAttribute("user", u);
				}else{
					msg.setState(0);
					msg.setMsg("用户已被禁用，登录失败。");
				}
				return msg;
			}else{//账号或密码错误
				msg.setState(0);
				msg.setMsg("账号或密码错误，登录失败。");
				return msg;
			}
		}		
	}
	public Msg forgetPassword(String username, String password, String code,HttpServletRequest request){
		//1.获取session
		HttpSession session = request.getSession();
		//2.获取session登录验证码
		String Code = (String)session.getAttribute("Code");
		//3.移除session保存的登录验证码
		session.removeAttribute("Code");
		Msg msg = new Msg();
		//4.验证码校验
		if(!(Code!=null&&Code.equalsIgnoreCase(code))){
				msg.setState(0);
				msg.setMsg("验证码错误。");
				return msg;
		}else{
			//5.查询用户是否存在
			User user = new User();
			user.setUsername(username);
			User u =find(user);
			if(u!=null){
				if(u.getState()==0){//判断用户状态是否可用
					u.setPassword(IurcPasword.getMD5(password));
					//修改
					userDao.edit(u);
					msg.setState(1);
					msg.setMsg("修改成功。");
					msg.setObj(u);
					//把用户信息存放到session
					session.setAttribute("user", u);
				}else{
					msg.setState(0);
					msg.setMsg("修改失败。");
				}
				return msg;
			}else{//账号或密码错误
				msg.setState(0);
				msg.setMsg("修改失败。");
				return msg;
			}
		}					
	}
	public Msg register(String username, String password, String code,
			HttpServletRequest request, HttpServletResponse response) {
		//1.获取session
		HttpSession session = request.getSession();
		//2.获取session登录验证码
		String registerCode = (String)session.getAttribute("Code");
		//3.移除session保存的登录验证码
		session.removeAttribute("Code");
		Msg msg =new Msg();
		if(code.equalsIgnoreCase(registerCode)){//正确
			//2.注册验证码正确，把用户信息写入数据库（明文or密文）
			User u = new User();
			u.setUsername(username);
			//判断数据库是是否已存在该账号
			if(userDao.find(u)!=null){//该账号已存在，退出注册
				msg.setState(0);
				msg.setMsg("该账号已存在，注册失败。");
			}else{
				//保存加密后的密码
				u.setPassword(IurcPasword.getMD5(password));
				u.setUname(username);
				u.setUserType(1);
				u.setPhone(username);
				u.setAddress("");
				u.setSex(0);
				u.setAge(20);
				u.setUnitId(null);
				u.setBirthday(new Date(System.currentTimeMillis()));
				u.setImg("");
				u.setCreateTime(new Timestamp(System.currentTimeMillis()));
				u.setQqEmail("");
				u.setWeChat("");
				u.setState(0);
				userDao.add(u);
				msg.setState(1);
				msg.setMsg("注册成功。");
			}
			
		}else{
			msg.setState(0);
			msg.setMsg("验证码错误，注册失败。");
		}
		return msg;
	}

	public Msg changePassword(String password, String code,
			HttpServletRequest request, HttpServletResponse response) {
		//1.获取session
		HttpSession session = request.getSession();
		//2.获取session登录验证码
		String changePasswordCode = (String)session.getAttribute("Code");
		//3.移除session保存的登录验证码
		session.removeAttribute("Code");
		Msg msg =new Msg();
		if(code.equalsIgnoreCase(changePasswordCode)){//正确
			//2.验证码正确，把用户信息写入数据库（明文or密文）
			User u = (User) session.getAttribute("user");
			u.setPassword(IurcPasword.getMD5(password));
			userDao.edit(u);
			msg.setState(1);
			msg.setMsg("修改成功。");
		}else{
			msg.setState(0);
			msg.setMsg("修改失败。");
		}
		return msg;
	}

	public Msg editPersonalInformation(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String  uname= request.getParameter("uname");
		String  phone= request.getParameter("phone");
		String  address= request.getParameter("address");
		String  sex= request.getParameter("sex");
		String  age= request.getParameter("age");
		String  birthday= request.getParameter("birthday");
		String  qqEmail= request.getParameter("qqEmail");
		String  weChat= request.getParameter("weChat");
		HttpSession  session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setUname(uname);
		user.setPhone(phone);
		user.setAddress(address);
		user.setSex(Integer.valueOf(sex));
		user.setAge(Integer.valueOf(age));
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
		user.setBirthday(date);
		user.setQqEmail(qqEmail);
		user.setWeChat(weChat);
		int b = userDao.edit(user);
		Msg msg =new Msg();
		if(b>0){//修改成功
			msg.setState(1);
			msg.setMsg("修改成功。");
		}else{
			msg.setState(0);
			msg.setMsg("修改失败。");
		}
		return msg;
	}

	public int delete(Integer id) {
		return userDao.delete(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return userDao.deleteMore(list);
	}

	public User queryById(Integer id) {
		return userDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<User> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return userDao.queryByPage(map);
	}

	public List<User> queryAll() {
		return userDao.queryAll();
	}

	public int getTotals() {
		return userDao.getTotals();
	}

	public List<Unit> queryByUnitId(Integer id) {
		return userDao.queryByUnitId(id);
	}

	public Msg disablesById(Integer id,HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Checked t = new Checked();
		t.setId(0);
		t.setType(1);//审核类型为1 表示对用户的审核  1.User
		t.setTypeId(id);
		t.setUid(user.getId());
		t.setState(0);
		t.setCheckTime(new Timestamp(System.currentTimeMillis()));
		Msg msg = new Msg();
		//1.禁用该用户,把禁用审核记录到审核表
		int i = userDao.disablesById(id);
		int j = checkedDao.add(t);
		if(i>0&&j>0){
			msg.setMsg("禁用成功。");
			msg.setState(1);
		}else{
			msg.setMsg("禁用失败。");
			msg.setState(0);
		}
		return msg;
	}

	public Msg attention(Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Msg msg = new Msg();
		if(user!=null){
			//在用户关注表中查找是否已关注过该用户
			Attention at =new Attention();
			at.setAid(id);
			at.setUid(user.getId());
			Attention i = attentionDao.find(at);
			Attention a =new Attention();
			if(i==null){//该用户没有关注过
				a.setId(0);
				a.setAid(id);
				a.setUid(user.getId());
				a.setState(0);
				a.setCreateTime(new Timestamp(System.currentTimeMillis()));
				int j = attentionDao.add(a);
				if(j>0){
					msg.setMsg("关注成功。");
					msg.setState(1);
				}else{
					msg.setMsg("关注失败。");
					msg.setState(0);
				}
			}else{
				msg.setMsg("已关注过该用户。");
				msg.setState(0);
			}
		}else{
			msg.setMsg("用户未登录，关注失败。");
			msg.setState(0);
		}
		
		return msg;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<User> searchByCondition(String condition1, String condition2,Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("condition1", condition1);
		map.put("condition2", condition2);
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return userDao.searchByCondition(map);
	}

	public Msg addAgentById(Integer id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Checked t = new Checked();
		t.setId(0);
		t.setType(1);//审核类型为1 表示对用户的审核  1.User
		t.setTypeId(id);
		t.setUid(user.getId());
		t.setState(0);
		t.setCheckTime(new Timestamp(System.currentTimeMillis()));
		Msg msg = new Msg();
		//通过id号查找该用户是否存在，并把该用户信息取出来，便于修改
		User a = userDao.findById(id);
		int i =0;
		if(a!=null){
			//修改用户的unitId
			a.setUnitId(user.getUnitId());
			//修改用户的userType为2 高级用户
			a.setUserType(2);
			i = userDao.edit(a);
		}
		//添加该用户为单位代理人,把审核记录到审核表
		int j = checkedDao.add(t);
		if(i>0&&j>0){
			msg.setMsg("添加成功。");
			msg.setState(1);
		}else{
			msg.setMsg("添加失败。");
			msg.setState(0);
		}
		return msg;
	}

	
	
}
