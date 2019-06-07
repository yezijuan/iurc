/**
 * 
 */
package com.iurc.entity;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author yezi
 * @date 2019-2-23
 * @IURC1.1
 */
public class Cooperation {
	/*
	 * 主键自增ID
	 * */
	private Integer id;
	/*
	 * 合作项目(外键)
	 * */
	private Integer projectId;
	/*
	 * 合作方(外键)
	 * */
	private Integer cUnitId;
	/*
	 * 达成合作时间
	 * */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp cooperatedTime;
	/*
	 * 合同（附件路径）
	 * */
	private String contract;
	/*
	 * 合同状态
	 * */
	private Integer state;
	/*
	 * 项目
	 * */
	private Project project;
	/*
	 * 合作方
	 * */
	private Unit unit;
	
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
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
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getcUnitId() {
		return cUnitId;
	}
	public void setcUnitId(Integer cUnitId) {
		this.cUnitId = cUnitId;
	}
	public Timestamp getCooperatedTime() {
		return cooperatedTime;
	}
	public void setCooperatedTime(Timestamp cooperatedTime) {
		this.cooperatedTime = cooperatedTime;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Cooperation [id=" + id + ", projectId=" + projectId
				+ ", cUnitId=" + cUnitId + ", cooperatedTime=" + cooperatedTime
				+ ", contract=" + contract + ", state=" + state + ", project="
				+ project + ", unit=" + unit + "]";
	}
	
	
	
	
}
