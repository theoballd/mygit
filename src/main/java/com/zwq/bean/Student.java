package com.zwq.bean;

public class Student {
    private String stuId;

    private String stuPassword;

    private String stuName;

    private int stuClassId;

    private Clas clas;

    private int stuRank;

    private Boolean stuPunishment;

    private Boolean stuGrad;

    private Scholarship scholarship;

    private Grant grant;

    public Scholarship getScholarship() {
        return scholarship;
    }

    public void setScholarship(Scholarship scholarship) {
        this.scholarship = scholarship;
    }

    public Grant getGrant() {
        return grant;
    }

    public void setGrant(Grant grant) {
        this.grant = grant;
    }

    public int getStuClassId() {
        return stuClassId;
    }

    public void setStuClassId(int stuClassId) {
        this.stuClassId = stuClassId;
    }


    public void setClas(Clas clas) {
        this.clas = clas;
    }



    public Clas getClas() {
        return clas;
    }


    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword == null ? null : stuPassword.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public int getStuRank() {
        return stuRank;
    }

    public void setStuRank(int stuRank) {
        this.stuRank = stuRank;
    }

    public Boolean getStuPunishment() {
        return stuPunishment;
    }

    public void setStuPunishment(Boolean stuPunishment) {
        this.stuPunishment = stuPunishment;
    }

    public Boolean getStuGrad() {
        return stuGrad;
    }

    public void setStuGrad(Boolean stuGrad) {
        this.stuGrad = stuGrad;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuId='" + stuId + '\'' +
                ", stuPassword='" + stuPassword + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuClassId=" + stuClassId +
                ", clas=" + clas +
                ", stuRank=" + stuRank +
                ", stuPunishment=" + stuPunishment +
                ", stuGrad=" + stuGrad +
                ", scholarship=" + scholarship +
                ", grant=" + grant +
                '}';
    }
}