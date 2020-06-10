package com.zwq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwq.bean.*;
import com.zwq.dao.ClasMapper;
import com.zwq.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;


    @Autowired
    ClasMapper clasMapper;


    //以Json的形式
    @ResponseBody
    @RequestMapping(value = "/getScholarshipStudentMessage", method = RequestMethod.GET)
    public Msg getScholarshipStudentMessage(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "identity") String identity, @RequestParam(value = "classs") Integer classId, @RequestParam(value = "searchText", defaultValue = "all") String searchText, HttpServletRequest request) {


        ScholarshipExample scholarshipExample = new ScholarshipExample();

        if (searchText.equals("all")) {
            if (identity.equals("全部")) {
                if (classId == 0) {
                    scholarshipExample = null;
                } else {
                    scholarshipExample.createCriteria().andStuClassIdEqualTo(classId);
                }
            } else {
                if (classId == 0) {
                    scholarshipExample.createCriteria().andWhetherEqualTo(identity);
                } else {
                    scholarshipExample.createCriteria().andWhetherEqualTo(identity).andStuClassIdEqualTo(classId);
                }
            }
        } else {
            if (identity.equals("全部")) {
                if (classId == 0) {
                    scholarshipExample.createCriteria().andStuNameLike("%"+searchText+"%");
                } else {
                    scholarshipExample.createCriteria().andStuNameLike("%"+searchText+"%").andStuClassIdEqualTo(classId);
                }
            } else {
                if (classId == 0) {
                    scholarshipExample.createCriteria().andWhetherEqualTo(identity).andStuNameLike("%"+searchText+"%");
                } else {
                    scholarshipExample.createCriteria().andWhetherEqualTo(identity).andStuClassIdEqualTo(classId).andStuNameLike("%"+searchText+"%");
                }
            }
        }
        //引入PageHelper分页插件
        //在查询之前调用以下方法
        PageHelper.startPage(pn, 5); //每页5条数据 pn为从第几页开始查
        List<Scholarship> scholarship = adminService.getScholarshipStudent(scholarshipExample);  //此方法为分页查询

        PageInfo page1 = new PageInfo(scholarship, 5);  //连续显示5页，使用pageinfo包装查询的结果 封装了详细的分页信息，包括我们查询出来的信息


        return Msg.success("处理成功").add("pageInfo1", page1);
    }


    //以Json的形式
    @ResponseBody
    @RequestMapping(value = "/getGrantStudentMessage", method = RequestMethod.GET)
    public Msg getGrantStudentMessage(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "identity") String identity, @RequestParam(value = "classs") Integer classId, @RequestParam(value = "searchText", defaultValue = "all") String searchText, HttpServletRequest request) {

        GrantExample grantExample = new GrantExample();

        if (searchText.equals("all")) {
            if (identity.equals("全部")) {
                if (classId == 0) {
                    grantExample = null;
                } else {
                    grantExample.createCriteria().andStuClassIdEqualTo(classId);
                }
            } else {
                if (classId == 0) {
                    grantExample.createCriteria().andWhetherEqualTo(identity);
                } else {
                    grantExample.createCriteria().andWhetherEqualTo(identity).andStuClassIdEqualTo(classId);
                }
            }
        } else {
            if (identity.equals("全部")) {
                if (classId == 0) {
                    grantExample.createCriteria().andStuNameLike("%"+searchText+"%");
                } else {
                    grantExample.createCriteria().andStuNameLike("%"+searchText+"%").andStuClassIdEqualTo(classId);
                }
            } else {
                if (classId == 0) {
                    grantExample.createCriteria().andWhetherEqualTo(identity).andStuNameLike("%"+searchText+"%");
                } else {
                    grantExample.createCriteria().andWhetherEqualTo(identity).andStuClassIdEqualTo(classId).andStuNameLike("%"+searchText+"%");
                }
            }
        }

        PageHelper.startPage(pn, 5); //每页5条数据 pn为从第几页开始查
        List<Grant> grants = adminService.getGrantsStudent(grantExample);
        PageInfo page2 = new PageInfo(grants, 5);


        return Msg.success("处理成功").add("pageInfo2", page2);
    }

    //审核奖学金
    @ResponseBody
    @RequestMapping(value = "/checkScholarship/{id}", method = RequestMethod.POST)
    public void checkScholarship(@PathVariable("id") String id, @RequestParam(value = "identity") String identity) {
        adminService.checkScholarship(id, identity);
    }

    //审核助学金
    @ResponseBody
    @RequestMapping(value = "/checkGrant/{id}", method = RequestMethod.POST)
    public void checkGrant(@PathVariable("id") String id, @RequestParam(value = "identity") String identity) {
        adminService.checkGrant(id, identity);
    }

    //获取学生信息
    @ResponseBody
    @RequestMapping(value = "/getStudent/{id}", method = RequestMethod.GET)
    public Student getStudent(@PathVariable("id") String id,HttpServletRequest request) {
        return adminService.getStudent(id);
    }


    //修改密码
    @ResponseBody
    @RequestMapping(value = "/editPassword", method = RequestMethod.POST)
    public Msg editPassword(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String id=(String)session.getAttribute("UserCount");
        String firstPassword=request.getParameter("firstPassword");
        String newPassword=request.getParameter("newPassword");
        if(adminService.getPassword(id).equals(firstPassword)==false){
            return Msg.success("原密码错误");
        }
        else {
            adminService.editPassword(newPassword);
            return Msg.success("处理成功");
        }
    }


    @RequestMapping(value = "/userManage",method = RequestMethod.GET)
    public String userManage() {
        return "userManage";
    }
}


