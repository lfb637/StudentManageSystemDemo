package cn.entity;
/*
 * @ Copyright (c) Create by JASON  Date:2018-02-09  All rights reserved.
 *
 * @ class description：学生表
 *
 */
public class Student {
	private int id;
	private String name;
	private int gradeId;
	private String sex;
	private int age;
	private String profile;
	public Student(){
		super();
	}
	public Student(int id, String name,int gradeId,String sex,int age,String profile){
		   super();
		   this.id = id;
		   this.name = name;
		   this.gradeId = gradeId;
		   this.sex  = sex;
		   this.age = age;
		   this.profile = profile;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
}


