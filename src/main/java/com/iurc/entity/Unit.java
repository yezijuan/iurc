/**
 * 
 */
package com.iurc.entity;

import java.util.List;

/**
 * @author yezi
 * @date 2019-2-23
 * @IURC1.2
 */
public class Unit {
	/*
	 * 主键
	 * */
	private Integer id;
	/*
	 * 单位负责人
	 * */
	private List<User> users;
	private Integer uid;
	/*
	 * 单位类型：0企业1高校2科研
	 * */
	private Integer unitType;
	/*
	 * 单位名称
	 * */
	private String unitName;
	/*
	 * 单位简介
	 * */
	private String introduction;
	/*
	 * 单位地址
	 * */
	private String address;
	/*
	 * 单位联系方式
	 * */
	private String phone;
	/*
	 * 行业领域
	 * */
	private String industryField;
	/*
	 * 发展优势
	 * */
	private String advantage;
	/*
	 * 状态
	 * */
	private Integer state;
	/*
	 * 单位负责人
	 * */
	private List<Project> projects;
	/*
	 * 单位负责人
	 * */
	private List<Cooperation> cooperations;
	
	
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public List<Cooperation> getCooperations() {
		return cooperations;
	}
	public void setCooperations(List<Cooperation> cooperations) {
		this.cooperations = cooperations;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Integer getUnitType() {
		return unitType;
	}
	public void setUnitType(Integer unitType) {
		this.unitType = unitType;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIndustryField() {
		return industryField;
	}
	public void setIndustryField(String industryField) {
		this.industryField = industryField;
	}
	public String getAdvantage() {
		return advantage;
	}
	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Unit [id=" + id + ", users=" + users + ", uid=" + uid
				+ ", unitType=" + unitType + ", unitName=" + unitName
				+ ", introduction=" + introduction + ", address=" + address
				+ ", phone=" + phone + ", industryField=" + industryField
				+ ", advantage=" + advantage + ", state=" + state + "]";
	}
	
}
