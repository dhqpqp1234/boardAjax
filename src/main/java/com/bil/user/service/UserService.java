package com.bil.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bil.user.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//
	//id체크
	public int idCheck(String userId) {
		
		int result = sqlSessionTemplate.selectOne("Login.selectUserById", userId);
		
		System.out.println("서비스 카운트" + result);
		
		return result;
	}
	
	//회원가입
	public int userInsert(UserVO userVo) {
		
		System.out.println("service" + userVo);
		
		return sqlSessionTemplate.insert("Login.userInsert", userVo);
	}
	
}
