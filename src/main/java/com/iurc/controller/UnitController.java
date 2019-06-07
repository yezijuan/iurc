package com.iurc.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iurc.entity.Msg;
import com.iurc.entity.Unit;
import com.iurc.service.BaseService;
import com.iurc.service.UnitService;

@Controller
@RequestMapping("/unit")
public class UnitController extends BaseController<Unit>{
	
	
	@Resource
	private UnitService unitService;
	
	@Override
	protected BaseService<Unit> getBaseService() {		
		return unitService;
	}

	@Override
	protected String getPrefix() {		
		return "/unit";
	}
	
	
	@RequestMapping("findAllUnit")
	public void findAllUnit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PrintWriter out = null;
		String json =null;
		try{
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			List<Unit> list = unitService.findAllUnit();
			json = JSON.toJSONString(list);
			System.out.println(json);
		}catch(Exception e){
			
		}finally{
			out.write(json);
			out.flush();
			out.close();
		}
	}
	
	/**
	 * 1. 请求转发：
	 * 使用requestDispatcher对象：
	 * 转发格式：request.getRequestDispatcher("path").forward(response,request)
	 * 2. 请求重定向：
	 * 使用response的rsendRedirect方法：
	 * 重定向格式：response.sendRedirect("path");
	 * 3. 请求转发与请求重定向的区别：
	 * (1) 请求转发为服务器内部跳转，跳转一次，客户端接收结果，而不改变url地址，而请求重定向则跳转两次，既将结果返回给客户端，又使客户端的url地址改变。
　　　 * (2) 请求转发为为内部跳转，页面请求的对象一直存在，请求重定向则会结束上个页面的请求。
　　　 * (3) 请求转发的传参使用request对象方法setAttribute(“name”,value)，请求重定向只需使用url传参即可。
	 * */
	@RequestMapping("queryInfo")
	public void queryInfo(int id) throws Exception{
		Unit unit = getBaseService().queryById(id);
		System.out.println(unit.toString());
		request.setAttribute("unit", unit);
		//请求转发
		request.getRequestDispatcher("/admin/unitInfo.jsp").forward(request,response);
		
	}
	
	@RequestMapping("queryAgentInfo")
	public String queryAgentInfo(int id) throws Exception{
		Unit unit = unitService.queryUnitByUserId(id);
		System.out.println(unit.toString());
	//	request.setAttribute("unit", unit);
		//请求转发
	//	request.getRequestDispatcher("/agentUnitInfo.jsp").include(request,response);
		//请求转发
		request.getSession().setAttribute("unit",unit);
		return "redirect:/agentUnitInfo.jsp";
		
	}
	
	
	@RequestMapping("queryUnit")
	public void queryUnit(String unitType) throws Exception{
		JSONObject json = new JSONObject();
		List<Unit> unit =null;
		try{
			unit = unitService.queryUnitByType(Integer.valueOf(unitType));
			json.put("unit", unit);
			json.put("state", true);
		}catch(Exception e){
			json.put("state", false);
		}finally{
			System.out.println(json);
			System.out.println(json.toJSONString());
			write(json.toJSONString());
		}
		
		
	}
	
/*	@RequestMapping("findUnit")
	public void findUnit(String unitType,Map<String,Object> map) throws Exception{
		List<Unit> units =null;
		units = unitService.queryUnitByType(Integer.valueOf(unitType));
		System.out.println(units.toString());
		request.setAttribute("units", units);
		//请求转发
		request.getRequestDispatcher("unitInfo.jsp").forward(request,response);
	}
	*/
	
	@RequestMapping("findUnit")
	public void findUnit(String unitType,Map<String,Object> map) throws Exception{
		JSONObject json = new JSONObject();
		List<Unit> units =null;
		try{
			units = unitService.queryUnitByType(Integer.valueOf(unitType));
			json.put("units", units);
			json.put("state", true);
		}catch(Exception e){
			json.put("state", false);
		}finally{
			System.out.println(json);
			System.out.println(json.toJSONString());
			write(json.toJSONString());
		}
	}
	

	/**
	 * 代理申请
	 * */
	@RequestMapping("agentApplication")
	public void agentApplication() throws Exception{
		JSONObject json = new JSONObject();
		try{
			Msg flage= unitService.agentApplication(request, response);
			if(flage.getState()==1){
				json.put("msg", flage.getMsg());
				json.put("state", true);
			}else{
				json.put("msg", flage.getMsg());
				json.put("state", false);
			}
		}catch(Exception e){
			json.put("msg", "提交失败");
			json.put("state", false);
		}finally{
			System.out.println(json);
			write(json.toJSONString());
		}
	}
	
	/**
	 *  Unit 审核操作
	 * @param id
	 */
	@RequestMapping("checkById")
	public void checkById( int id){
		JSONObject json = new JSONObject();
		try{
			unitService.checkById(id,request,response);
			json.put("msg", "审核成功");
			json.put("state", 1);
		}catch(Exception e){
			json.put("msg", "审核失败");
			json.put("state", 0);
		}finally{
			write(json.toJSONString());
		}
	}

	
}
