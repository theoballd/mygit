package com.zwq.bean;

public class Teacher {
    private String teaId;

    private String teaPassword;

    private String teaName;

    private Integer teaClassId;

    private  Clas clas;

    public Clas getClas() {
        return clas;
    }

    public void setClas(Clas clas) {
        this.clas = clas;
    }

    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId == null ? null : teaId.trim();
    }

    public String getTeaPassword() {
        return teaPassword;
    }

    public void setTeaPassword(String teaPassword) {
        this.teaPassword = teaPassword == null ? null : teaPassword.trim();
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName == null ? null : teaName.trim();
    }

    public Integer getTeaClassId() {
        return teaClassId;
    }

    public void setTeaClassId(Integer teaClassId) {
        this.teaClassId = teaClassId;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teaId='" + teaId + '\'' +
                ", teaPassword='" + teaPassword + '\'' +
                ", teaName='" + teaName + '\'' +
                ", teaClassId=" + teaClassId +
                ", clas=" + clas +
                '}';
    }
}