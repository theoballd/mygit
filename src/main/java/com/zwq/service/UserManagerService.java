package com.zwq.service;


import com.zwq.bean.*;
import com.zwq.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.soap.Addressing;
import java.util.List;



@Service
public class UserManagerService {

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    ClasMapper clasMapper;

    @Autowired
    TeacherMapper teacherMapper;

    @Autowired
    ScholarshipMapper scholarshipMapper;

    @Autowired
    GrantMapper grantMapper;

    public List<Student> getStudents(StudentExample studentExample) {
        List<Student> students=  studentMapper.selectByExample(studentExample);
        for (Student student : students) {
            student.setClas(clasMapper.selectByPrimaryKey(student.getStuClassId()));
        }
    return students;
    }


    public List<Teacher> getTeachers(TeacherExample teacherExample) {
        List<Teacher> teachers=  teacherMapper.selectByExample(teacherExample);
        for (Teacher teacher : teachers) {
            teacher.setClas(clasMapper.selectByPrimaryKey(teacher.getTeaClassId()));
        }
        return teachers;
    }


    public Student getStudent(String id) {
       return studentMapper.selectByPrimaryKey(id);
    }

    public Teacher getTeacher(String id) {
        return teacherMapper.selectByPrimaryKey(id);
    }

    public void updateStudent(Student student,String id) {
        StudentExample studentExample=new StudentExample();
        studentExample.createCriteria().andStuIdEqualTo(id);
        studentMapper.updateByExampleSelective(student,studentExample);
        if(scholarshipMapper.selectByPrimaryKey(id)!=null){
          Scholarship scholarship=  scholarshipMapper.selectByPrimaryKey(id);
          scholarship.setStuId(student.getStuId());
          scholarship.setStuName(student.getStuName());
          scholarship.setStuClassId(student.getStuClassId());
        }
    }

    public void updateTeacher(Teacher teacher,String id) {
        TeacherExample teacherExample=new TeacherExample();
        teacherExample.createCriteria().andTeaIdEqualTo(id);
        teacherMapper.updateByExampleSelective(teacher,teacherExample);
    }

    public void deletStudent(String id) {
        studentMapper.deleteByPrimaryKey(id);
    }


    public void deletTeacher(String id) {
        teacherMapper.deleteByPrimaryKey(id);
    }

    public void addStudent(Student student) {
        student.setStuPassword("123456");
        studentMapper.insertSelective(student);
    }

    public void addTeacher(Teacher teacher) {
        teacher.setTeaPassword("123456");
        teacherMapper.insertSelective(teacher);
    }
}
