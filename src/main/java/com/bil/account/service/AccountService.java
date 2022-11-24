package com.bil.account.service;

import java.util.List;

import com.bil.account.service.Impl.AccountVo;

public interface AccountService {
	
	//저장
	public int accountInsertPro(AccountVo accountVo);
	
	//전체리스트
	public List<AccountVo> selectList(AccountVo accountVo);
	
	//정보 가져오기
	//public AccountVo read(int no);

}
