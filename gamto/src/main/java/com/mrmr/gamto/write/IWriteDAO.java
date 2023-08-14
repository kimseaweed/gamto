package com.mrmr.gamto.write;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mrmr.gamto.report.dto.BookReportDTO;

@Mapper
public interface IWriteDAO {
	public int writeBook_report(@Param("dto")BookReportDTO dto);
}
