package com.bil.user.vo;

public class UserVO {

	private String userSeq   ;
	private String userId  ;
	private String pwd  ;
	private String name  ;
	private String regDt  ;
	
	
	
	public UserVO() {
	}
	
	
	
	public UserVO(String userSeq, String userId, String pwd, String name, String regDt) {
		this.userSeq = userSeq;
		this.userId = userId;
		this.pwd = pwd;
		this.name = name;
		this.regDt = regDt;
	}

	

	public String getUserSeq() {
		return userSeq; 
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}



	@Override
	public String toString() {
		return "UserVO [userSeq=" + userSeq + ", userId=" + userId + ", pwd=" + pwd + ", name=" + name
				+ ", regDt=" + regDt + "]";
	}




}
