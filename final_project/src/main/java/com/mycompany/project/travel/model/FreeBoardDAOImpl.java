package com.mycompany.project.travel.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public void insert(FreeBoardDTO dto) {	
		SqlSessionTemplate.insert("FreeBoardMapper.insert",dto);
		
	}

	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return SqlSessionTemplate.selectOne("FreeBoardMapper.detail",map);	
		
	}

	@Override
	public int update(FreeBoardDTO dto) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.update("FreeBoardMapper.update",dto);
	}

	@Override
	public int delete(int free_board_id) {
		// TODO Auto-generated method stub
		return SqlSessionTemplate.delete("FreeBoardMapper.delete",free_board_id);
	}



}
