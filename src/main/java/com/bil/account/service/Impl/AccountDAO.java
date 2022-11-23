package com.bil.account.service.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bil.user.vo.UserVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("accountDAO")
public class AccountDAO extends EgovAbstractMapper{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int accountInsertPro(AccountVo accountVo) {
		System.out.println("accountInsertDao" + accountVo);
		return sqlSession.insert("Common.accountInsertPro", accountVo);
	}
}
