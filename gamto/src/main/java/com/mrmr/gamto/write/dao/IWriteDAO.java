package com.mrmr.gamto.write.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mrmr.gamto.report.dto.BookReportDTO;

@Mapper
public interface IWriteDAO {
	public int writeBookReport(@Param("dto")BookReportDTO dto);
}
