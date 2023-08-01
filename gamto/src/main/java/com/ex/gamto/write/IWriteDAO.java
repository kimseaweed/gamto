package com.ex.gamto.write;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ex.gamto.freeboard.dto.FreeboardDto;
import com.ex.gamto.report.dto.Book_reportDTO;

@Mapper
public interface IWriteDAO {
	public int writeBook_report(@Param("dto")Book_reportDTO dto);
	public int writeFree_board(@Param("dto")FreeboardDto dto);
}
