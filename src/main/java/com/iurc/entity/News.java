package com.iurc.entity;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class News {
	
	private Integer id;
	private String title;
	private String content;
	private String picture;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp reportTime;
	private Integer newsTypeId;
	private Integer author;
	private Integer readCounts;
	private Integer praiseCounts;
	private Integer collectionCounts;
	private Integer checked;
	private Integer state;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp createTime;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Timestamp getReportTime() {
		return reportTime;
	}
	public void setReportTime(Timestamp reportTime) {
		this.reportTime = reportTime;
	}
	public Integer getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public Integer getAuthor() {
		return author;
	}
	public void setAuthor(Integer author) {
		this.author = author;
	}
	public Integer getReadCounts() {
		return readCounts;
	}
	public void setReadCounts(Integer readCounts) {
		this.readCounts = readCounts;
	}
	public Integer getPraiseCounts() {
		return praiseCounts;
	}
	public void setPraiseCounts(Integer praiseCounts) {
		this.praiseCounts = praiseCounts;
	}
	public Integer getCollectionCounts() {
		return collectionCounts;
	}
	public void setCollectionCounts(Integer collectionCounts) {
		this.collectionCounts = collectionCounts;
	}
	public Integer getChecked() {
		return checked;
	}
	public void setChecked(Integer checked) {
		this.checked = checked;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public News(Integer id, String title, String content, String picture,
			Timestamp reportTime, Integer newsTypeId, Integer author,
			Integer readCounts, Integer praiseCounts, Integer collectionCounts,
			Integer checked, Integer state, Timestamp createTime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.picture = picture;
		this.reportTime = reportTime;
		this.newsTypeId = newsTypeId;
		this.author = author;
		this.readCounts = readCounts;
		this.praiseCounts = praiseCounts;
		this.collectionCounts = collectionCounts;
		this.checked = checked;
		this.state = state;
		this.createTime = createTime;
	}
	public News() {
		super();
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", content=" + content
				+ ", picture=" + picture + ", reportTime=" + reportTime
				+ ", newsTypeId=" + newsTypeId + ", author=" + author
				+ ", readCounts=" + readCounts + ", praiseCounts="
				+ praiseCounts + ", collectionCounts=" + collectionCounts
				+ ", checked=" + checked + ", state=" + state + ", createTime="
				+ createTime + "]";
	}
	
	

}
