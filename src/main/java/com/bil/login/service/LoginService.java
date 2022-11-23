package com.bil.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bil.user.vo.UserVO;

@Service
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO login(UserVO userVo) {
		
		return sqlSessionTemplate.selectOne("Login.selectUserForLogin", userVo);
		
	}
	
}
