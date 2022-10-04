package com.mycompany.project.common.model.dao;

import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("user.insert", map);
	}

	@Override
	public Map<String, Object> detail(String userid) {
		return sqlSession.selectOne("user.detail", userid);
	}

	@Override
	public int idCheck(String user_id) {
		return sqlSession.selectOne("user.idCheck",user_id);
	}
}
