package com.zwq.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {


    private String applyType; //申请类型
    private String msg;   //提示信息
    private Student student;

    private Map<String,Object> extend =new HashMap<String,Object>();

    public static Msg success(String messages){
        Msg result= new Msg();
        result.setMsg(messages);
        return result;
    }



    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return  this;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public String getMsg() {
        return msg;
    }

    public void setApplyType(String applyType) {
        this.applyType = applyType;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getApplyType() {
        return applyType;
    }

    public Student getStudent() {
        return student;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
