package com.mycompany.project.board.mapper;

import java.util.List;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.travel.model.VO;

public interface Mapper {

	
	public List<FreeBoardDTO> list();
	public List<FreeBoardDTO> listPaging(Criteria cri);
	public int total();
}
