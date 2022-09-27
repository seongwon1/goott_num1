package com.mycompany.project.travel.service;

import java.util.List;

import com.mycompany.project.travel.model.Criteria;
import com.mycompany.project.travel.model.VO;


public interface TravelService {
	
	public List<VO> getList();
	public List<VO> getListPaging(Criteria cri);
	public int getTotal();
	public VO getPage(int travel_num);
	public List<VO> getLegPaging(Criteria cri);
	public List<VO> getEyePaging(Criteria cri);
	public List<VO> getEarsPaing(Criteria cri);
}
