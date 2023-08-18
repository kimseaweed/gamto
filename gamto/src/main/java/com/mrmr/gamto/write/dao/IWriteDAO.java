package com.mrmr.gamto.write.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mrmr.gamto.report.dto.BookReportDTO;

@Mapper
public interface IWriteDAO {
	public int writeBookReport(@Param("dto")BookReportDTO dto);
	public int updateBookReport(@Param("dto")BookReportDTO dto);
}
