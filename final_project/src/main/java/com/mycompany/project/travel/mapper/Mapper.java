package com.mycompany.project.travel.mapper;

import java.util.List;

import com.mycompany.project.travel.model.Criteria;
import com.mycompany.project.travel.model.FreeBoardDTO;
import com.mycompany.project.travel.model.VO;

public interface Mapper {
//	조회,select
	public List<VO> getList();
//	페이징
	public List<VO> getListPaging(Criteria cri);
	
	public List<FreeBoardDTO> list();
	
	public List<FreeBoardDTO> listPaging(Criteria cri);
	public int total();
//	페이징 갯수
	public int getTotal();
//	조회
	public VO getpage(int travel_num);
// 지체장애
	public List<VO> getLegPaging(Criteria cri);
// 시각장애
	public List<VO> getEyePaging(Criteria cri);
// 청각장애
	public List<VO> getEarsPaging(Criteria cri);

}
