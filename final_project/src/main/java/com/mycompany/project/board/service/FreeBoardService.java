package com.mycompany.project.board.service;

import java.util.List;
import java.util.Map;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;





public interface FreeBoardService {
	
	void insert(FreeBoardDTO dto);
	Map<String, Object> detail(Map<String,Object> map);
	List<FreeBoardDTO> list();
	List<FreeBoardDTO> listPaging(Criteria cri);
	int total();
	int update(FreeBoardDTO dto);
	int delete(int free_board_id);

}
