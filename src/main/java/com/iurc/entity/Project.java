/**
 * 
 */
package com.iurc.entity;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author yezi
 * @date 2019-2-23
 * @IURC1.1
 */
public class Project {
	/*
	 * 主键自增ID
	 * */
	private Integer id;
	/*
	 * 发起项目合作方(外键)
	 * */
	private Integer unitId;
	/*
	 * 项目名称
	 * */
	private String projectName;
	/*
	 * 项目内容
	 * */
	private String projectContent;
	/*
	 * 状态：0待合作1已合作
	 * */
	private Integer state;
	/*
	 * 项目创建时间
	 * */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp projectFoundingTime;
	/*
	 * 合同
	 * */
	private List<Cooperation> cooperations;
	/*
	 * 合作方
	 * */
	private Unit unit;
	
	
	public List<Cooperation> getCooperations() {
		return cooperations;
	}
	public void setCooperations(List<Cooperation> cooperations) {
		this.cooperations = cooperations;
	}
	
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectContent() {
		return projectContent;
	}
	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Timestamp getProjectFoundingTime() {
		return projectFoundingTime;
	}
	public void setProjectFoundingTime(Timestamp projectFoundingTime) {
		this.projectFoundingTime = projectFoundingTime;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", unitId=" + unitId + ", projectName="
				+ projectName + ", projectContent=" + projectContent
				+ ", state=" + state + ", projectFoundingTime="
				+ projectFoundingTime + ", cooperations=" + cooperations
				+ ", unit=" + unit + "]";
	}
	
	
	
}
