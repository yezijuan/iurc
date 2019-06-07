package com.iurc.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iurc.entity.Msg;
import com.iurc.entity.Pager;
import com.iurc.entity.UploadFile;
import com.iurc.entity.User;
import com.iurc.service.BaseService;
import com.iurc.service.UserService;
import com.iurc.util.FileUtil;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User>{

	@Resource
	private UserService userService;
	@Override
	protected BaseService<User> getBaseService() {		
		return userService;
	}

	@Override
	protected String getPrefix() {		
		return "/user";
	}
	
	/*
	 * 判断用户是否登陆
	 * */
	@RequestMapping("islogin")
	public void islogin(){
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		try{
			if(user==null){
				json.put("msg", "用户未登录。");
				json.put("state", 0);
			}else{//已登录
				if(user.getUserType()==1){
					json.put("msg", "普通用户登录。");
					json.put("state", 1);
				}
				if(user.getUserType()==2){
					json.put("msg", "高级用户登录。");
					json.put("state", 2);
				}
				if(user.getUserType()==3){
					json.put("msg", "管理员登录。");
					json.put("state", 3);
				}
			}
			
		}catch(Exception e){
			json.put("msg", "操作失败。");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}	
	}
	
	/*
	 * 用户登陆
	 * */
	@RequestMapping("login")
	public String login(String username, String password, String code,
			HttpServletRequest request, HttpServletResponse response){
		Msg message = userService.login(username, password, code, request,response);
		if(message.getState()==1){//登陆成功,页面跳转到首页
			//重定向到index.jsp
			 return  "redirect:/index.jsp";
		}else{
			//重定向到login.jsp
			 return "redirect:/login.jsp";
		}		
	}
	
	/*
	@RequestMapping("login")
	@ResponseBody
	public void login(String username, String password, String code,
			HttpServletRequest request, HttpServletResponse response){
		JSONObject json = new JSONObject();
		Msg message =null;
		try{
			message = userService.login(username, password, code, request,response);
			if(message.getState()==1){
				json.put("msg", message.getMsg());
				json.put("state", true);
			}else{
				json.put("msg", message.getMsg());
				json.put("state",false);
			}
		}catch(Exception e){
			json.put("msg", "登陆失败");
			json.put("state", false);
		}finally{
			write(json.toJSONString());
		}
	}
	*/
	/*
	 * 用户注销
	 * */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		//获取session
		HttpSession  session = request.getSession();
		//销毁session
		session.removeAttribute("user");
		//重定向到index.jsp
		return  "redirect:/index.jsp";
	}
	/*
	 * 忘记密码
	 * */
	@RequestMapping("forgetPassword")
	public String forgetPassword(String username, String password, String code){
		userService.forgetPassword(username,password,code,request);
		return  "redirect:/login.jsp";
	}
	
	
	/*
	 * 用户注册
	 * */
	/*@RequestMapping("register")
	public String register(String username, String password, String code,
			HttpServletRequest request, HttpServletResponse response) {
		
		Msg msg = userService.register(username, password, code, request,response);
		
		if(msg.getState()==1){//登陆成功,页面跳转到首页
			//重定向到index.jsp
			 return  "redirect:/personalInfomation.jsp";
		}else{
			//重定向到login.jsp
			 return "redirect:/login.jsp";
		}	
	}
	*/
	
	@RequestMapping("register")
	public void register(String username, String password, String code) {
		JSONObject json = new JSONObject();
		Msg msg = null;
		try{
			msg = userService.register(username, password, code, request,response);
			json.put("msg", msg.getMsg());
			json.put("state", msg.getState());
		}catch(Exception e){
			json.put("msg", "发生异常，注册失败。");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
		
	}
	
	
	
	/*
	 * 更改密码
	 * */
	@RequestMapping("changePassword")
	public String changePassword(String password, String code,
			HttpServletRequest request, HttpServletResponse response){
		
		Msg msg = userService.changePassword(password, code, request,response);	
		if(msg.getState()==1){//修改成功,页面跳转到首页
			//重定向到index.jsp
			 return  "redirect:/personalInfomation.jsp";
		}else{
			//重定向到login.jsp
			 return "redirect:/personalInfomation.jsp";
		}	
		
	}
	/*
	 * 更改个人信息
	 * */
	@RequestMapping("editPersonalInformation")
	public String editPersonalInformation(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Msg msg = userService.editPersonalInformation(request, response);	
		if(msg.getState()==1){//修改成功,页面跳转到首页
			//重定向到index.jsp
			 return  "redirect:/personalInfomation.jsp";
		}else{
			//重定向到login.jsp
			 return "redirect:/personalInfomation.jsp";
		}	
	}	

	/*
	 * 更改头像
	 * */
	@RequestMapping("uploadImg")
	public void uploadImg(String uploadPath,  @RequestParam(value="file",required=false)MultipartFile file,
    		HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); // 在登录时将 User 对象放入了 会话中
		UploadFile  uploadFile = FileUtil.upload(uploadPath, file, request);
		if(uploadFile!=null){//上传成功
		//	String oldImg = user.getImg();
		//	String path=uploadFile.getAccessPath()+uploadFile.getFileName();
			String path="upload/img/"+uploadFile.getFileName();
			user.setImg(path);
			System.out.println(path);
			int i = userService.edit(user);
			if(i>0){//修改成功
				//删除旧头像
				//FileUtil.deleteFile(uploadPath, oldImg, request);
				//修改成功后返回最新头像
	    		session.setAttribute("image_path",path);
				response.sendRedirect(request.getContextPath() + "/editImg.jsp");
			}
			
		}
	}
	
	/**
	 * 查询所有id号
	 */
	@RequestMapping("/queryByUnitId")
	public void queryByUnitId(int id){
		String json = JSONArray.toJSONString(userService.queryByUnitId(id));
		System.out.println(json);
		write(json);
	}
	
	/**
	 *  User 禁用操作
	 * @param t
	 */
	@RequestMapping("/disablesById")
	public void disablesById( int id){
		JSONObject json = new JSONObject();
		Msg msg = null;
		try{
			msg =  userService.disablesById(id,request,response);
			json.put("msg", msg.getMsg());
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg",  msg.getMsg());
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	/**
	 *  User 关注操作
	 * @param id
	 */
	@RequestMapping("/attention")
	public void attention( int id){
		JSONObject json = new JSONObject();
		Msg msg = null;
		try{
			msg =  userService.attention(id,request,response);
			json.put("msg", msg.getMsg());
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg",  msg.getMsg());
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	

	@RequestMapping("searchByCondition")
	public void searchByCondition(String condition1,String condition2,String page,String rows) throws Exception{
		JSONObject json = new JSONObject();
		Pager<User> pager = new Pager<User>(getBaseService().getTotals(),page,rows);
		json.put("total",getBaseService().getTotals());
		json.put("rows", userService.searchByCondition(condition1, condition2,pager.getSp(), pager.getPageSize()));
		String jsonStr = JSON.toJSONString(json,SerializerFeature.DisableCircularReferenceDetect);
		System.out.println(jsonStr);
		write(jsonStr);
	}
	
	
	/**
	 *  User 添加代理操作
	 * @param id  将成为单位代理人的id号
	 */
	@RequestMapping("/addAgentById")
	public void addAgentById( int id){
		JSONObject json = new JSONObject();
		Msg msg = null;
		try{
			msg =  userService.addAgentById(id,request,response);
			json.put("msg", msg.getMsg());
			json.put("state", msg.getState());
		}catch(Exception e){
			json.put("msg",  "添加失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}
	
	
}
