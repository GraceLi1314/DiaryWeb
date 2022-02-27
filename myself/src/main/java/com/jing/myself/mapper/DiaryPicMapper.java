package com.jing.myself.mapper;

import com.jing.myself.pojo.DiaryPic;
import com.jing.myself.pojo.DiaryPicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DiaryPicMapper {
    long countByExample(DiaryPicExample example);

    int deleteByExample(DiaryPicExample example);

    int insert(DiaryPic record);

    int insertSelective(DiaryPic record);

    List<DiaryPic> selectByExample(DiaryPicExample example);

    int updateByExampleSelective(@Param("record") DiaryPic record, @Param("example") DiaryPicExample example);

    int updateByExample(@Param("record") DiaryPic record, @Param("example") DiaryPicExample example);
}