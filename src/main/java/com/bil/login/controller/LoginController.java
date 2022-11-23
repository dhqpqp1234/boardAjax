package com.bil.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.bil.common.service.CommonService;
import com.bil.login.service.LoginService;
import com.bil.user.vo.UserVO;


@Controller
public class LoginController {


	@Resource(name = "jsonView")
	private MappingJackson2JsonView jsonView;

	@Resource(name="commonService")
	private CommonService commonService;
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/login/login.do")
	public String loginview(HttpServletRequest request ) {

		return "/login/login";
	}
	
	//로그인
	@ResponseBody
	@RequestMapping(value="/login/loginPro.do", method= {RequestMethod.POST})
	public String login(@RequestBody UserVO userVo, HttpSession session) {
		System.out.println("LoginController");
		
		UserVO autherUser = loginService.login(userVo);
		
		System.out.println("컨트롤러러러러러러" + autherUser);
		
		String result = "";
		
		if(autherUser != null) {
			result = "ok";
			session.setAttribute("autherUser", autherUser);
		}else{
			result = "no";	
			
		}
		
		System.out.println("loginSuccess : " + autherUser);
		
		return result;
	}
	
	/*
	@RequestMapping(value="/login/idCkedAjax.do")
	public ModelAndView idCkedAjax(HttpServletRequest request ) throws Exception {
		Map<String, Object> inOutMap  = CommUtils.getFormParam(request);



		return new ModelAndView(jsonView, inOutMap);
	}
	*/


}// end of class
