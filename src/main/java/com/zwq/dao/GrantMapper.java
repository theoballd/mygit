package com.zwq.dao;

import com.zwq.bean.Grant;
import com.zwq.bean.GrantExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GrantMapper {
    long countByExample(GrantExample example);

    int deleteByExample(GrantExample example);

    int deleteByPrimaryKey(String stuId);

    int insert(Grant record);

    int insertSelective(Grant record);

    List<Grant> selectByExample(GrantExample example);

    Grant selectByPrimaryKey(String stuId);

    int updateByExampleSelective(@Param("record") Grant record, @Param("example") GrantExample example);

    int updateByExample(@Param("record") Grant record, @Param("example") GrantExample example);

    int updateByPrimaryKeySelective(Grant record);

    int updateByPrimaryKey(Grant record);
}