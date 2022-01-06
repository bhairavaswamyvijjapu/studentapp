package com.sample.model;

public class Student {

	private int sid;
	private String name;
	private String phno;
    private String email;
    private String address;
    
    
	public Student(int sid, String name, String phno, String email, String address) {
		super();
		this.sid = sid;
		this.name = name;
		this.phno = phno;
		this.email = email;
		this.address = address;
	}
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
    
    
}
