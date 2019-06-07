package com.iurc.entity;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Theme {
	
	private Integer id;
	private String title;
	private String content;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp deliverTime;
	private Integer uid;
	private Integer state;
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDeliverTime() {
		return deliverTime;
	}
	public void setDeliverTime(Timestamp deliverTime) {
		this.deliverTime = deliverTime;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Theme [id=" + id + ", title=" + title + ", content=" + content
				+ ", deliverTime=" + deliverTime + ", uid=" + uid + ", state="
				+ state + ", user=" + user + "]";
	}
	
	

}
