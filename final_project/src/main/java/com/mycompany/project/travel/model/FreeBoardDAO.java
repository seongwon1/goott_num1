package com.mycompany.project.travel.model;

import java.util.List;
import java.util.Map;

public interface FreeBoardDAO {
	
	//insert update delete 
	void insert(FreeBoardDTO dto);
	Map<String,Object> detail(Map<String,Object> map);
	int update(FreeBoardDTO dto);
	int delete(int free_board_id);
}
