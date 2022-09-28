package com.mycompany.project.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.board.mapper.Mapper;
import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDAO;
import com.mycompany.project.board.model.FreeBoardDTO;




@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	FreeBoardDAO boardDAO;
	
	@Autowired
	Mapper mapper;

	@Override
	public void insert(FreeBoardDTO dto) {
		boardDAO.insert(dto);	
	}
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}
	@Override
	public int update(FreeBoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDAO.update(dto);
	}
	
	@Override
	public int delete(int free_board_id) {
		return boardDAO.delete(free_board_id);
	}
	@Override
	public List<FreeBoardDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}
	@Override
	public List<FreeBoardDTO> listPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.listPaging(cri);
	}
	@Override
	public int total() {
		return mapper.total();
	}

}
