package com.iurc.entity;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class User {
	/*
	 * 1.用户id，做唯一标识（主键）自动增长
	 **/
	private Integer id;
	/*
	 * 2.用户名字，昵称
	 * */
	private String uname;
	/*
	 * 3.用于登录的账号（手机号）
	 * */
	private String username;
	/*
	 * 4.密码
	 * */
	private String password;
	/*
	 * 5.用户类型： 0普通用户 1高级用户
	 * */
	private Integer userType;
	/*
	 * 6.联系电话
	 * */
	private String phone;
	/*
	 * 7.联系地址
	 * */
	private String address;
	/*
	 * 8.性别：0女 1男
	 * */
	private Integer sex;
	/*
	 * 9.年龄
	 * */
	private Integer age;
	/*
	 * 10.出生日期
	 * */
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	/*
	 * 11.头像
	 * */
	private String img;
	/*
	 * 12.所属单位：公司、科研机构和高校id  （已注册公司可通过下拉框选择单位）
	 * */
	private Unit unit;
	private Integer unitId;
	/*
	 * 13.用户注册时间
	 * */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Timestamp createTime;
	/*
	 * 14.qq邮箱
	 * */
	private String qqEmail;
	/*
	 * 15.微信账号
	 * */
	private String weChat;
	/*
	 * 16.用户状态：0可用 1禁用
	 * */
	private Integer state;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getQqEmail() {
		return qqEmail;
	}
	public void setQqEmail(String qqEmail) {
		this.qqEmail = qqEmail;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", uname=" + uname + ", username=" + username
				+ ", password=" + password + ", userType=" + userType
				+ ", phone=" + phone + ", address=" + address + ", sex=" + sex
				+ ", age=" + age + ", birthday=" + birthday + ", img=" + img
				+ ", unit=" + unit + ", unitId=" + unitId + ", createTime="
				+ createTime + ", qqEmail=" + qqEmail + ", weChat=" + weChat
				+ ", state=" + state + "]";
	}
	
		
}
