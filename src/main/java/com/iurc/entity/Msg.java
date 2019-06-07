package com.iurc.entity;

public class Msg {
	/*
	 * 返回提示信息
	 * */
	private String msg;
	/*
	 * 处理状态 0失败1成功
	 * */
	private Integer state;
	/*
	 * 对象
	 * */
	private Object obj;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	
}
