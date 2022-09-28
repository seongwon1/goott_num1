package com.mycompany.project.card.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // root-context�� ����

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		// sqlSessionTemplate.selectList <---- ����� ���� ��� ��ü�� ����.
		// �׷��� ��� ������ Ÿ���� Map�� ����� LIST�� �ҷ��;��Ѵ�.
		return this.sqlSessionTemplate.selectList("card.select_list", map);
	}

	
	 public List<CardDTO> selectDetail(CardDTO testDto)  throws Exception{ 
		 return this.sqlSessionTemplate.selectList("card.select_list", testDto); 
		 }

	
}
