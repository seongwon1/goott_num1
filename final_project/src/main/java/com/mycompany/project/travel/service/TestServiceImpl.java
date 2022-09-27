package com.mycompany.project.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.travel.mapper.Mapper;
import com.mycompany.project.travel.model.Criteria;
import com.mycompany.project.travel.model.VO;


@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private Mapper mapper;
	@Override
	public List<VO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	@Override
	public List<VO> getListPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListPaging(cri);
	}
	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}
	@Override
	public VO getPage(int travel_num) {
		// TODO Auto-generated method stub
		return mapper.getpage(travel_num);
	}
	@Override
	public List<VO> getLegPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getLegPaging(cri);
	}
	@Override
	public List<VO> getEyePaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getEyePaging(cri);
	}
	@Override
	public List<VO> getEarsPaing(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getEarsPaging(cri);
	}

}
