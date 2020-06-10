package com.zwq.controller;

import com.zwq.bean.Msg;
import com.zwq.dao.AdminMapper;
import com.zwq.dao.StudentMapper;
import com.zwq.dao.TeacherMapper;
import com.zwq.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    LoginService loginService;

    @Autowired
    StudentMapper studentMapper;
    @Autowired
    TeacherMapper teacherMapper;
    @Autowired
    AdminMapper adminMapper;

    private String identity;

    @ResponseBody
    @RequestMapping(value = "/verify",  method = RequestMethod.POST)
    public Msg verify(HttpServletRequest request) {
        String id = request.getParameter("count");
        String password = request.getParameter("password");
        identity = request.getParameter("identity");
        if (identity.equals("student")) {
            if (studentMapper.selectByPrimaryKey(id) == null) {
                return Msg.success("账号不存在");
            } else if (studentMapper.selectByPrimaryKey(id).getStuPassword().equals(password) == false) {
                return Msg.success("密码错误");
            }
        }
        if (identity.equals("teacher")) {
            if (teacherMapper.selectByPrimaryKey(id) == null) {
                return Msg.success("账号不存在");
            } else if (teacherMapper.selectByPrimaryKey(id).getTeaPassword().equals(password) == false) {
                return Msg.success("密码错误");
            }
        }
        if (identity.equals("admin")) {
            if (adminMapper.selectByPrimaryKey(id) == null) {
                return Msg.success("账号不存在");
            } else if (adminMapper.selectByPrimaryKey(id).getAdmPassword().equals(password) == false) {
                return Msg.success("密码错误");
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("UserCount", id);
        session.setAttribute("UserIdentity", identity);
        return Msg.success(identity);
        }

    @RequestMapping(value = "/login1",method = RequestMethod.GET)
    public String login() {
        return identity;
    }
    }

