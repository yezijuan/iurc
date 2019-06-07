package com.iurc.entity;

import java.util.List;

public class Pager<T> {

	//当前页
	private int sp;
	//每一页显示行数
	private int pageSize = 10;
	//总行数
	private int totals;
	//总页数
	private int pageCounts;
	//查询结果
	private List<T> list;
	
	public Pager(){
		
	}
	public Pager(int totals,String currentPage,String rows){
		this.totals = totals;
		try{
			this.sp = Integer.parseInt(currentPage);
			this.pageSize = Integer.parseInt(rows);
		}catch(Exception e){
			this.sp = 1;
		}
		this.pageCounts = this.totals/this.pageSize;
		if(this.totals%this.pageSize!=0){
			this.pageCounts++;
		}
		if(this.sp>this.pageCounts){
			this.sp = this.pageCounts;
		}
		if(this.sp<1){
			this.sp = 1;
		}
	}
	
	public int getSp() {
		return sp;
	}
	public void setSp(int sp) {
		this.sp = sp;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotals() {
		return totals;
	}
	public void setTotals(int totals) {
		this.totals = totals;
	}
	public int getPageCounts() {
		return pageCounts;
	}
	public void setPageCounts(int pageCounts) {
		this.pageCounts = pageCounts;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
