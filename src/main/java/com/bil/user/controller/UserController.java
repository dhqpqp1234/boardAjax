package com.bil.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bil.user.service.UserService;
import com.bil.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입 폼
	@RequestMapping(value="/user/userInsert.do")
	public String userInsert() {
		return "/user/userInsert";
	}
	
	//id체크
	@ResponseBody
	@RequestMapping(value="/user/userIdCheck.do", method= {RequestMethod.POST})
	public int idCheck(@RequestBody String userId) {
		System.out.println("유저 아이디는 : " + userId);
		
		int result = userService.idCheck(userId);
		
		System.out.println("idcheck 컨트롤러" + result);
		
		return result;
	}
	
	//회원가입 
	@ResponseBody
	@RequestMapping(value="/user/userInsertPro.do")
	public int userInsertPro(@RequestBody UserVO userVo) {
		
		System.out.println("controller::::::::::::::::::::::" + userVo);
		
		return  userService.userInsert(userVo);
	}
	
	//로그인창
	@RequestMapping(value="/user/loginForm.do")
	public String userLogin() {
		return "/login/login";
	}
	
}
