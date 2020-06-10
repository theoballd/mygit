package com.zwq.controller;

import com.zwq.bean.*;
import com.zwq.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService studentService;


    //获取所有班级
    @ResponseBody
    @RequestMapping("/getClas")
    public Msg getClas() {
        List<Clas> list = studentService.getClas();
        return Msg.success("处理成功").add("clas", list);
    }


    //获取学生信息
    @ResponseBody
    @RequestMapping(value = "/getStudent", method = RequestMethod.GET)
    public Student getStudent(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String id=(String)session.getAttribute("UserCount");
        return studentService.getStudent(id);
    }

    //申请奖学金保存
    @ResponseBody
    @RequestMapping(value = "/scholarshipSave", method = RequestMethod.GET)
    public Msg saveScholarship(Scholarship scholarship) {
        System.out.println(scholarship);
        studentService.saveScholarshipStudent(scholarship);
        return Msg.success("处理成功");
    }



    //申请助学金保存
    @ResponseBody
    @RequestMapping(value = "/grantSave", method = RequestMethod.GET)
    public Msg saveGrant(Grant grant) {
        System.out.println(grant);
        studentService.saveGrantStudent(grant);
        return Msg.success("处理成功");
    }


    //取消奖学金
    @ResponseBody
    @RequestMapping(value = "/deleteScholarship/{id}", method = RequestMethod.POST)
    public Msg deleteScholarship(@PathVariable("id") String id) {
       studentService.deleteScholarshipStudent(id);
        return Msg.success("处理成功");
    }


    //取消助学金
    @ResponseBody
    @RequestMapping(value = "/deleteGrant/{id}", method = RequestMethod.POST)
    public Msg deleteGrant(@PathVariable("id") String id) {
        studentService.deleteGrantStudent(id);
        return Msg.success("处理成功");
    }




    //修改奖学金信息
    @ResponseBody
    @RequestMapping(value = "/updateScholarshipStudent", method = RequestMethod.POST)
    public Msg updateScholarshipStudent(Scholarship scholarship) {
        studentService.updateScholarshipStudent(scholarship);
        return Msg.success("处理成功");
    }



    //修改助学金信息
    @ResponseBody
    @RequestMapping(value = "/updateGrantStudent", method = RequestMethod.POST)
    public Msg updateGrantStudent(Grant grant) {
        studentService.updateGrantStudent(grant);
        return Msg.success("处理成功");
    }


    //修改密码
    @ResponseBody
    @RequestMapping(value = "/editPassword", method = RequestMethod.POST)
    public Msg editPassword(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String id=(String)session.getAttribute("UserCount");
        String firstPassword=request.getParameter("firstPassword");
         String newPassword=request.getParameter("newPassword");
         if(studentService.getPassword(id).equals(firstPassword)==false){
             return Msg.success("原密码错误");
         }
         else {
             studentService.editPassword(newPassword);
             return Msg.success("处理成功");
         }
    }
}
