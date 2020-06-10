package com.zwq.service;

import com.zwq.bean.*;
import com.zwq.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class StudentService {

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    ClasMapper clasMapper;

    @Autowired
    ScholarshipMapper scholarshipMapper;

    @Autowired
    GrantMapper grantMapper;

    String id;



    //获取学生信息
    public Student getStudent(String id) {
        this.id=id;
     Student student = studentMapper.selectByPrimaryKey(id);
     if(scholarshipMapper.selectByPrimaryKey(id)!=null) {
         student.setScholarship(scholarshipMapper.selectByPrimaryKey(id));
     }
     if(grantMapper.selectByPrimaryKey(id)!=null) {
         student.setGrant(grantMapper.selectByPrimaryKey(id));
     }
        return student;
    }


    //获取班级信息
    public List<Clas> getClas() {
         return clasMapper.selectByExample(null);
    }

    //添加奖学金
    public void saveScholarshipStudent(Scholarship scholarship) {
        scholarship.setWhether("未审核");
        scholarship.setFile("wwww");
        scholarshipMapper.insertSelective(scholarship);
    }


//添加助学金
    public void saveGrantStudent(Grant grantStudent) {
        grantStudent.setWhether("未审核");
        grantStudent.setFile("wwww");
        grantMapper.insertSelective(grantStudent);
    }


    //取消助学金
    public void deleteScholarshipStudent(String id) {
        scholarshipMapper.deleteByPrimaryKey(id);
    }


    //取消奖学金
    public void deleteGrantStudent(String id) {
        grantMapper.deleteByPrimaryKey(id);
    }



    //更新奖学金学生信息
    public void updateScholarshipStudent(Scholarship scholarship) {
        ScholarshipExample scholarshipExample =new ScholarshipExample();
        scholarshipExample.createCriteria().andStuIdEqualTo(scholarship.getStuId());
        scholarshipMapper.updateByExampleSelective(scholarship, scholarshipExample);
    }


    //更新助学金学生信息
    public void updateGrantStudent(Grant grant) {
        GrantExample grantExample = new GrantExample();
        grantExample.createCriteria().andStuIdEqualTo(grant.getStuId());
        grantMapper.updateByExampleSelective(grant, grantExample);
    }

    public String getPassword(String id) {
        return studentMapper.selectByPrimaryKey(id).getStuPassword();
    }

    public void editPassword(String newPassword) {
        Student student = new Student();
        student.setStuPassword(newPassword);
        StudentExample studentExample=new StudentExample();
        studentExample.createCriteria().andStuIdEqualTo(id);
        studentMapper.updateByExampleSelective(student,studentExample);
    }
}
