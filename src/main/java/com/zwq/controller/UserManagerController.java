package com.zwq.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwq.bean.*;
import com.zwq.dao.StudentMapper;
import com.zwq.dao.TeacherMapper;
import com.zwq.service.UserManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/userManage")
public class UserManagerController {

    @Autowired
    UserManagerService userManagerService;

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    TeacherMapper teacherMapper;

    //获取所有学生信息
    @ResponseBody
    @RequestMapping(value = "/getStudents",method = RequestMethod.GET)
    public Msg getStudents(@RequestParam(value = "pn",defaultValue ="1") Integer pn, @RequestParam(value = "classs") int classId, @RequestParam(value = "searchText",defaultValue ="all") String searchText , HttpServletRequest request){

        StudentExample studentExample =new StudentExample();
        if(searchText.equals("all")) {
            if (classId == 0) {
                studentExample=null;
            }else {
                studentExample.createCriteria().andStuClassIdEqualTo(classId);
//                scholarshipStudentExample.createCriteria().andStuClassIdEqualTo(teacher.getTeaClassId()).andStuNameLike(searchText);
            }
        }else{
            if (classId == 0) {
                studentExample.createCriteria().andStuNameLike("%"+searchText+"%");
            }else{
                studentExample.createCriteria().andStuClassIdEqualTo(classId).andStuNameLike("%"+searchText+"%");
            }
        }

        //引入PageHelper分页插件
        //在查询之前调用以下方法
        PageHelper.startPage(pn, 5); //每页5条数据 pn为从第几页开始查
        List<Student> students = userManagerService.getStudents(studentExample);  //此方法为分页查询

        PageInfo page1=new PageInfo(students,5);  //连续显示5页，使用pageinfo包装查询的结果 封装了详细的分页信息，包括我们查询出来的信息

        return Msg.success("处理成功").add("pageInfo1",page1);
    }


    //获取所有老师信息
    @ResponseBody
    @RequestMapping(value = "/getTeachers",method = RequestMethod.GET)
    public Msg getTeachers(@RequestParam(value = "pn",defaultValue ="1") Integer pn, @RequestParam(value = "classs") int classId, @RequestParam(value = "searchText",defaultValue ="all") String searchText , HttpServletRequest request){

        TeacherExample teacherExample =new TeacherExample();
        if(searchText.equals("all")) {
            if (classId == 0) {
                teacherExample=null;
            }else {
                teacherExample.createCriteria().andTeaClassIdEqualTo(classId);
//                scholarshipStudentExample.createCriteria().andStuClassIdEqualTo(teacher.getTeaClassId()).andStuNameLike(searchText);
            }
        }else{
            if (classId == 0) {
                teacherExample.createCriteria().andTeaNameLike("%"+searchText+"%");
            }else{
                teacherExample.createCriteria().andTeaClassIdEqualTo(classId).andTeaNameLike("%"+searchText+"%");
            }
        }

        //引入PageHelper分页插件
        //在查询之前调用以下方法
        PageHelper.startPage(pn, 5); //每页5条数据 pn为从第几页开始查
        List<Teacher>teachers = userManagerService.getTeachers(teacherExample);  //此方法为分页查询

        PageInfo page2=new PageInfo(teachers,5);  //连续显示5页，使用pageinfo包装查询的结果 封装了详细的分页信息，包括我们查询出来的信息

        return Msg.success("处理成功").add("pageInfo2",page2);
    }


    //获取单个学生信息
    @ResponseBody
    @RequestMapping(value = "/getStudent/{id}", method = RequestMethod.GET)
    public Student getStudent(@PathVariable("id") String id) {
        return userManagerService.getStudent(id);
    }

    //修改学生信息
    @ResponseBody
    @RequestMapping(value = "/updateStudent/{id}", method = RequestMethod.POST)
    public Msg updateStudent(@PathVariable("id") String id,Student student) {
        StudentExample studentExample1 = new StudentExample();
        StudentExample studentExample2 = new StudentExample();
        StudentExample studentExample3 = new StudentExample();
        studentExample1.createCriteria().andStuIdEqualTo(student.getStuId());
        studentExample2.createCriteria().andStuNameEqualTo(student.getStuName());
        studentExample3.createCriteria().andStuRankEqualTo(student.getStuRank()).andStuClassIdEqualTo(student.getStuClassId());
        if (id.equals(student.getStuId()) == false && studentMapper.countByExample(studentExample1) > 0) {
            return Msg.success("学号已存在");
        } else if ((studentMapper.selectByPrimaryKey(id).getStuName()).equals(student.getStuName()) == false && studentMapper.countByExample(studentExample2) > 0) {
            return Msg.success("名字已存在");
        } else if (studentMapper.countByExample(studentExample3) > 0) {
            Student student2=new Student();
            for(Student student1:studentMapper.selectByExample(studentExample3)){
                student2=student1;
            }
            if(student2.getStuId().equals(student.getStuId())==false){
                return Msg.success("排名已存在");
                }
            }
            userManagerService.updateStudent(student, id);
            return Msg.success("处理成功");
    }


    //获取单个老师信息
    @ResponseBody
    @RequestMapping(value = "/getTeacher/{id}", method = RequestMethod.GET)
    public Teacher getTeacher(@PathVariable("id") String id) {
        return userManagerService.getTeacher(id);
    }

    //修改老师信息
    @ResponseBody
    @RequestMapping(value = "/updateTeacher/{id}", method = RequestMethod.POST)
    public Msg updateTeacher(@PathVariable("id") String id,Teacher teacher) {
        System.out.println(teacher);
        TeacherExample teacherExample1=new TeacherExample();
        TeacherExample teacherExample2=new TeacherExample();
        TeacherExample teacherExample3=new TeacherExample();
        teacherExample1.createCriteria().andTeaIdEqualTo(teacher.getTeaId());
        teacherExample2.createCriteria().andTeaNameEqualTo(teacher.getTeaName());
        teacherExample3.createCriteria().andTeaClassIdEqualTo(teacher.getTeaClassId());
        if(id.equals(teacher.getTeaId())==false&&teacherMapper.countByExample(teacherExample1)>0) {
            return Msg.success("学号已存在");
        }
        else if ((teacherMapper.selectByPrimaryKey(id).getTeaName()).equals(teacher.getTeaName())==false&&teacherMapper.countByExample(teacherExample2)>0){
            return Msg.success("名字已存在");
        }


        else if (!teacher.getTeaClassId().equals(teacherMapper.selectByPrimaryKey(id).getTeaClassId()) &&teacherMapper.countByExample(teacherExample3)>0){
            return Msg.success("班级已存在");
        }
        else {
            userManagerService.updateTeacher(teacher, id);
            return Msg.success("处理成功");
        }
    }


    //删除学生
    @ResponseBody
    @RequestMapping(value = "/deletStudent/{id}", method = RequestMethod.POST)
    public Msg deletStudent(@PathVariable("id") String id) {
        userManagerService.deletStudent(id);
        return Msg.success("处理成功");
    }

    //删除老师
    @ResponseBody
    @RequestMapping(value = "/deletTeacher/{id}", method = RequestMethod.POST)
    public Msg deletTeacher(@PathVariable("id") String id) {
        userManagerService.deletTeacher(id);
        return Msg.success("处理成功");
    }

    //增加学生
    @ResponseBody
    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public Msg addStudent(Student student) {
        StudentExample studentExample1=new StudentExample();
        StudentExample studentExample2=new StudentExample();
        StudentExample studentExample3=new StudentExample();
        studentExample1.createCriteria().andStuIdEqualTo(student.getStuId());
        studentExample2.createCriteria().andStuNameEqualTo(student.getStuName());
        studentExample3.createCriteria().andStuRankEqualTo(student.getStuRank()).andStuClassIdEqualTo(student.getStuClassId());
        if(studentMapper.countByExample(studentExample1)>0) {
            return Msg.success("学号已存在");
        }
        else if (studentMapper.countByExample(studentExample2)>0){
            return Msg.success("名字已存在");
        }


        else if (studentMapper.countByExample(studentExample3)>0){
            return Msg.success("排名已存在");
        }
        else {
            userManagerService.addStudent(student);
            return Msg.success("处理成功");
        }
    }

    //增加老师
    @ResponseBody
    @RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
    public Msg addTeacher(Teacher teacher) {
        TeacherExample teacherExample1=new TeacherExample();
        TeacherExample teacherExample2=new TeacherExample();
        TeacherExample teacherExample3=new TeacherExample();
        teacherExample1.createCriteria().andTeaIdEqualTo(teacher.getTeaId());
        teacherExample2.createCriteria().andTeaNameEqualTo(teacher.getTeaName());
        teacherExample3.createCriteria().andTeaClassIdEqualTo(teacher.getTeaClassId());
        if(teacherMapper.countByExample(teacherExample1)>0) {
            return Msg.success("工号已存在");
        }
        else if (teacherMapper.countByExample(teacherExample2)>0){
            return Msg.success("名字已存在");
        }


        else if (teacherMapper.countByExample(teacherExample3)>0){
            return Msg.success("班级已存在");
        }
        else {
            userManagerService.addTeacher(teacher);
            return Msg.success("处理成功");
        }
    }
}
