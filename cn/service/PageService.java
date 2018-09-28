package cn.service;

import cn.entity.Page;
import cn.entity.Student;

public interface PageService {
	 /**
	 *  param: pageNum :当前页
	 *         pageSize: 每页条数
	 * */
	 Page<Student> findAllStudentWithPage(int pageNum,int pageSize);
} 
