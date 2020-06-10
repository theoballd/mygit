package com.zwq.bean;

public class Clas {
    private int classId;

    private String className;

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    @Override
    public String toString() {
        return "Clas{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                '}';
    }
}