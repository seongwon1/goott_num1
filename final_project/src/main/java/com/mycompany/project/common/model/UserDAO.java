package com.mycompany.project.common.model;

import java.util.Map;

public interface UserDAO{
	
	int insert(Map<String, Object> map);
	
	Map<String,Object> detail(String userid);
}
