package com.bil.account.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("accountDAO")
public class AccountDAO extends EgovAbstractMapper{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int accountInsertPro(AccountVo accountVo) {
		System.out.println("accountInsertDao" + accountVo);
		return sqlSession.insert("Common.accountInsertPro", accountVo);
	}

	public List<AccountVo> selectList(AccountVo accountVo){
		
		List<AccountVo> accountList = sqlSession.selectList("Common.selectList", accountVo);
		
		return accountList;
	}
		

	
}
