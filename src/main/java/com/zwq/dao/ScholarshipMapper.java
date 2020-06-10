package com.zwq.dao;

import com.zwq.bean.Scholarship;
import com.zwq.bean.ScholarshipExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScholarshipMapper {
    long countByExample(ScholarshipExample example);

    int deleteByExample(ScholarshipExample example);

    int deleteByPrimaryKey(String stuId);

    int insert(Scholarship record);

    int insertSelective(Scholarship record);

    List<Scholarship> selectByExample(ScholarshipExample example);

    Scholarship selectByPrimaryKey(String stuId);

    int updateByExampleSelective(@Param("record") Scholarship record, @Param("example") ScholarshipExample example);

    int updateByExample(@Param("record") Scholarship record, @Param("example") ScholarshipExample example);

    int updateByPrimaryKeySelective(Scholarship record);

    int updateByPrimaryKey(Scholarship record);
}