package com.mrmr.gamto.write;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mrmr.gamto.freeboard.dto.FreeboardDto;
import com.mrmr.gamto.report.dto.Book_reportDTO;

@Mapper
public interface IWriteDAO {
	public int writeBook_report(@Param("dto")Book_reportDTO dto);
}
