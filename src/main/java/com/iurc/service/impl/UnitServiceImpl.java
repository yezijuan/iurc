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

import com.iurc.dao.CheckedDao;
import com.iurc.dao.UnitDao;
import com.iurc.dao.UserDao;
import com.iurc.entity.Checked;
import com.iurc.entity.Msg;
import com.iurc.entity.Unit;
import com.iurc.entity.User;
import com.iurc.service.UnitService;
@Service("unitService")
public class UnitServiceImpl implements UnitService {

	@Resource
	private UnitDao unitDao;
	@Resource
	private CheckedDao checkedDao;
	@Resource
	private UserDao userDao;
	
	public List<Unit> findAll(Unit t) {
		return unitDao.findAll(t);
	}

	public Unit find(Unit t) {
		return unitDao.find(t);
	}

	public int add(Unit t) {
		return unitDao.add(t);
	}

	public int edit(Unit t) {
		return unitDao.edit(t);
	}

	public int remove(Unit t) {
		return unitDao.remove(t);
	}

	public List<Unit> findAllUnit() {
		return unitDao.findAllUnit();
	}

	public int delete(Integer id) {
		return unitDao.delete(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int deleteMore(String ids) {
		List list = new ArrayList(Arrays.asList(ids.split(","))); 
		return unitDao.deleteMore(list);
	}

	public Unit queryById(Integer id) {
		return unitDao.queryById(id);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Unit> queryByPage(Integer currentPage, Integer pageSize) {
		Map map = new HashMap<String, Integer>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("pageSize", pageSize);
		return unitDao.queryByPage(map);
	}

	public List<Unit> queryAll() {
		return unitDao.queryAll();
	}

	public int getTotals() {
		return unitDao.getTotals();
	}

	public List<Unit> queryUnitByType(Integer unitType) {
		return unitDao.queryUnitByType(unitType);
	}

	public Msg agentApplication(HttpServletRequest request,
			HttpServletResponse response) {
		//判断用户是否已登录
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//获取请求信息
		String  unitName= request.getParameter("unitName");
		String  introduction= request.getParameter("introduction");
		String  industryField= request.getParameter("industryField");
		String  advantage= request.getParameter("advantage");
		String  unitType= request.getParameter("unitType");
		String  address= request.getParameter("address");
		String  phone= request.getParameter("phone");
		Unit unit = new Unit();
		Msg msg= new Msg();
		if(user!=null){
			unit.setId(0);
			unit.setUid(user.getId());
			unit.setUnitName(unitName);
			unit.setIntroduction(introduction);
			unit.setIndustryField(industryField);
			unit.setAdvantage(advantage);
			unit.setUnitType(Integer.valueOf(unitType));
			unit.setAddress(address);
			unit.setPhone(phone);
			unit.setState(1);//没有经过审核的单位默认为禁用
			unitDao.add(unit);
			msg.setMsg("提交成功。");
			msg.setState(1);
		}else{
			msg.setMsg("用户未登录。");
			msg.setState(0);
		}
		return msg;
	}

	public Msg checkById(Integer id,HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Checked t = new Checked();
		t.setId(0);
		t.setType(2);//审核类型为2 表示对单位的审核  2.Unit
		t.setTypeId(id);
		t.setUid(user.getId());
		t.setState(0);
		t.setCheckTime(new Timestamp(System.currentTimeMillis()));
		Msg msg = new Msg();
		//1.修改单位状态
		int i = unitDao.checkById(id);
		//2.根据单位id查询单位信息
		Unit unit = unitDao.queryById(id);
		//获取申请人id
		Integer uid = unit.getUid();
		//通过申请人的id查找申请人信息
		User u = userDao.findById(uid);
		//修改申请人的权限（用户类型 userType = 2  单位    unitId ）
		u.setUserType(2);
		u.setUnitId(id);
		//更新申请人信息
		int k = userDao.edit(u);
		//3.禁用该用户,把禁用审核记录到审核表
		int j = checkedDao.add(t);
		if(i>0&&j>0&&k>0){
			msg.setMsg("审核成功。");
			msg.setState(1);
		}else{
			msg.setMsg("审核失败。");
			msg.setState(0);
		}
		return msg;
	}

	public Unit queryUnitByUserId(Integer id) {
		return unitDao.queryUnitByUserId(id);
	}

	
	

}
