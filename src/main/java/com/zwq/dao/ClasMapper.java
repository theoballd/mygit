package com.zwq.dao;


import com.zwq.bean.Clas;
import com.zwq.bean.ClasExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClasMapper {


    long countByExample(ClasExample example);

    int deleteByExample(ClasExample example);

    int deleteByPrimaryKey(Integer classId);

    int insert(Clas record);

    int insertSelective(Clas record);

    List<Clas> selectByExample(ClasExample example);

    Clas selectByPrimaryKey(int classId);

    Clas selectByName(String classname);

    int updateByExampleSelective(@Param("record") Clas record, @Param("example") ClasExample example);

    int updateByExample(@Param("record") Clas record, @Param("example") ClasExample example);

    int updateByPrimaryKeySelective(Clas record);

    int updateByPrimaryKey(Clas record);
}
