package com.zwq.service;


import com.zwq.dao.AdminMapper;
import com.zwq.dao.StudentMapper;
import com.zwq.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class LoginService {

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    TeacherMapper teacherMapper;

    @Autowired
    AdminMapper adminMapper;

    public String login(String count,String password,String identity,HttpServletRequest request) {
        if ("student".equals(identity)&&password.equals(studentMapper.selectByPrimaryKey(count).getStuPassword())){
           session(request,count,identity);
            return identity;
        }
    else if("teacher".equals(identity)&&password.equals(teacherMapper.selectByPrimaryKey(count).getTeaPassword())){
            session(request,count,identity);
            return identity;
        }

     else if("admin".equals(identity)&&password.equals(adminMapper.selectByPrimaryKey(count).getAdmPassword())) {
            session(request,count,identity);
            return identity;
        } else {
            return "fail";
        }
    }

    public void session(HttpServletRequest request,String count,String identity) {
        HttpSession session = request.getSession();
        session.setAttribute("UserCount", count);
        session.setAttribute("UserIdentity", identity);
    }
}
