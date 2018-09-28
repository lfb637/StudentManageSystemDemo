package cn.service.impl;

import cn.service.PageService;

import java.util.List;
import cn.dao.StudentDao;
import cn.dao.impl.StudentDaoimp;
import cn.entity.Page;
import cn.entity.Student;

public class PageServiceimp implements PageService{
    private StudentDao studentDao = null;
	public PageServiceimp(){
		studentDao = new StudentDaoimp();
	}
	@Override
	public Page<Student> findAllStudentWithPage(int pageNum, int pageSize) {
		List<Student> allStudent = studentDao.getAllStudent();
		int studentSize = allStudent.size();    //得到总学生数量
		//创建page对象
		Page<Student> page = new Page<Student>(pageNum,pageSize,studentSize);
		//获取page的开始页
		int startIndex = page.getStartIndex();
		//由startIndex与pageSize获取每页数据
		page.setList(studentDao.getPageStudent(startIndex, pageSize));
		return page;
	} 
} 
	 
