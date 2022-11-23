package com.bil.account.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bil.account.service.AccountService;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Resource(name="accountDAO")
	private AccountDAO accountDAO;

	public int accountInsertPro(AccountVo accountVo) {
		System.out.println("accountInsertImp" + accountVo);
		
		
		return accountDAO.accountInsertPro(accountVo);
	}

	
	



}
