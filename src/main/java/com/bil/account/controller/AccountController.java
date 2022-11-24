package com.bil.account.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.bil.account.service.AccountService;
import com.bil.account.service.Impl.AccountServiceImpl;
import com.bil.account.service.Impl.AccountVo;
import com.bil.common.service.CommonService;
import com.bil.login.service.LoginService;
import com.bil.user.vo.UserVO;
import com.bil.util.CommUtils;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class AccountController {


	@Resource(name = "jsonView")
	private MappingJackson2JsonView jsonView;

	@Resource(name="accountService")
	private AccountService accountService;

	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	//@Resource(name="accountServiceImp")
	private AccountServiceImpl accountServiceImp;

	/**
	 *
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/account/accountList.do")
	public String selectSampleList(HttpServletRequest request, ModelMap model,
									@ModelAttribute AccountVo accountVo,
									HttpSession session) throws Exception {

		//Map<String, Object> inOutMap  = CommUtils.getFormParam(request);
		
		
		List<AccountVo> accountList = accountService.selectList(accountVo);
		
		System.out.println("Controller ------> AccountList" + accountList);
		
		model.addAttribute("accountList",accountList);
		//model.put("inOutMap", inOutMap);
		return "/account/accountList";
	}



	/**
	 *
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/account/accountInsert.do")
	public String accountInsert(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception{
		
		UserVO autherUser = (UserVO) session.getAttribute("autherUser");
		
		
		Map<String, Object> inOutMap = new HashMap<>();


		inOutMap.put("category", "A000000");
		List<EgovMap> resultMap= commonService.selectCombo(inOutMap);

		model.put("resultMap", resultMap);
		model.put("autherUser", autherUser);
		
		return "/account/accountInsert";
	}
	
	@ResponseBody
	@RequestMapping(value="/account/accountInsertPro.do", method= {RequestMethod.POST})
	public int accountInsertPro( @RequestBody AccountVo accountVo,
								 HttpSession session, Model model) {
		
		UserVO userVO = (UserVO) session.getAttribute("autherUser");
		String userId = userVO.getUserId();
		
		
		model.addAttribute("userVO",userVO);
		
		accountVo.setWriter(userId);
		System.out.println("accountInsertCon" + accountVo);
		
		int count = accountService.accountInsertPro(accountVo);
		
		return count;
	}
	
	//업데이트폼
	@RequestMapping(value="/account/accountUpdate.do")
	public String accountUpdate(HttpServletRequest request, ModelMap model, HttpSession session) {
		
		return "/account/accountUpdate";
	}
	
	/**
	 *
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/account/selectCombo1.do", method= {RequestMethod.POST})
	public ModelAndView ajaxtest(HttpServletRequest request) throws Exception{
		System.out.println("/account/selectCombo.do");

		Map<String, Object> inOutMap  = CommUtils.getFormParam(request);
		
		System.out.println("아싸라비아콜롬비아");
		
		String category = request.getParameter("category");
		System.out.println("category" + category + "category");
		System.out.println("inOutMap" + inOutMap);
	
		commonService.selectCombo(inOutMap);
		

		return new ModelAndView(jsonView, inOutMap);
	}


	////////////////////////////////////////////////////4//로그인
	@ResponseBody
	@RequestMapping(value="/account/selectCombo.do", method= {RequestMethod.POST})
	public List<EgovMap> selectCombo(@RequestBody Map<String, Object> param, HttpSession session) throws Exception {
		
		System.out.println("아싸라비아콜롬비아");
	
		List<EgovMap> cList = commonService.selectCombo(param);
		
		System.out.println("cList"+cList);
		
		return cList;
	}




}// end of calss
