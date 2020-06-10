package com.zwq.service;

import com.zwq.bean.*;
import com.zwq.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Service
public class TeacherService {


    @Autowired
     ClasMapper clasMapper;

   @Autowired
    TeacherMapper teacherMapper;

    @Autowired
    ScholarshipMapper scholarshipMapper;

    @Autowired
    GrantMapper grantMapper;

    @Autowired
    StudentMapper studentMapper;

    private String id;


        public List<Scholarship> getScholarshipStudent(ScholarshipExample scholarshipExample) {

        List<Scholarship> scholarshipList = scholarshipMapper.selectByExample(scholarshipExample);
        
        for (Scholarship scholarship : scholarshipList) {
            scholarship.setClas(clasMapper.selectByPrimaryKey(scholarship.getStuClassId()));
        }
        return scholarshipList;
    }


    public List<Grant> getGrantsStudent(GrantExample grantExample) {
        List<Grant> grantStudentList= grantMapper.selectByExample(grantExample);

        for (Grant grant : grantStudentList) {
            grant.setClas(clasMapper.selectByPrimaryKey(grant.getStuClassId()));
        }
        return grantStudentList;
    }

    //审核奖学金
    public void checkScholarship(String id,String identity) {
        Scholarship scholarship =new Scholarship();
        scholarship.setWhether(identity);
        ScholarshipExample scholarshipExample =new ScholarshipExample();
        scholarshipExample.createCriteria().andStuIdEqualTo(id);
        scholarshipMapper.updateByExampleSelective(scholarship, scholarshipExample);
    }

    //审核助学金
    public void checkGrant(String id, String identity) {
        Grant grant =new Grant();
        grant.setWhether(identity);
        GrantExample grantsExample =new GrantExample();
        grantsExample.createCriteria().andStuIdEqualTo(id);
        grantMapper.updateByExampleSelective(grant, grantsExample);
    }

    public Teacher getTeacher(HttpServletRequest request) {
        HttpSession session = request.getSession();
        id= (String) session.getAttribute("UserCount");
        return   teacherMapper.selectByPrimaryKey(id);  //(String)session.getAttribute("UserCount")为id
    }

    public List<Scholarship> search(ScholarshipExample scholarshipExample) {
        List<Scholarship> scholarships =scholarshipMapper.selectByExample(scholarshipExample);
        return scholarships;
    }

    //获取学生信息
    public Student getStudent(String id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        if(scholarshipMapper.selectByPrimaryKey(id)!=null) {
            student.setScholarship(scholarshipMapper.selectByPrimaryKey(id));
        }
        if(grantMapper.selectByPrimaryKey(id)!=null) {
            student.setGrant(grantMapper.selectByPrimaryKey(id));
        }
        return student;
    }

    public String getPassword(String id) {
        return teacherMapper.selectByPrimaryKey(id).getTeaPassword();
    }

    public void editPassword(String newPassword) {
        Student student = new Student();
        student.setStuPassword(newPassword);
        StudentExample studentExample=new StudentExample();
        studentExample.createCriteria().andStuIdEqualTo(id);
        studentMapper.updateByExampleSelective(student,studentExample);
    }
}
