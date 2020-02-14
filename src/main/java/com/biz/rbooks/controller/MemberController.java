package com.biz.rbooks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.rbooks.domain.MemberVO;
import com.biz.rbooks.service.MemberService;

@RequestMapping(value="/member")
@Controller
public class MemberController {

	
	
	MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	
	
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String memberInsert() {
		
		return "member_insert";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public String idCheck(@RequestParam("m_id") String m_id) {
		
		
		 String id = memberService.selectById(m_id);
		
		 
		 if(id == null) {
			 
			 return "CHECKOK";
		 }else {
			 return "CHECKFAIL";
		 }
		 
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/insertnext", method=RequestMethod.POST)
	public String insertNext(@RequestParam("m_id") String m_id, @RequestParam("m_password") String m_password, HttpSession httpSession) {

		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setM_id(m_id);
		memberVO.setM_password(m_password);
		
		int ret = memberService.insert(memberVO);
		
		
		if(ret < 1) {
			httpSession.removeAttribute("MEMBERVO");
			return "INSERTFAIL";
		}else {
			httpSession.removeAttribute("MEMBERVO");
			return "INSERTOK";
		}
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		return "include/login";
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/logincheck", method=RequestMethod.POST)
	public String loginCheck(@RequestParam("login_m_id") String login_m_id, @RequestParam("login_m_password") String login_m_password, HttpSession httpSession) {
		
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setM_id(login_m_id);
		memberVO.setM_password(login_m_password);
		
		memberVO = memberService.loginCheck(memberVO);
		
		
		
		if(memberVO == null) {
			httpSession.removeAttribute("MEMBERVO");
			return "LOGINFAIL";
		}else {
			httpSession.setAttribute("MEMBERVO", memberVO);
			return "LOGINOK";
					
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logOut(@RequestParam("dateVal") String dateVal, HttpSession httpSession) {
		
		System.out.println("로그ㅏ웃날자넘어온"+dateVal);
		
		MemberVO memberVO = (MemberVO) httpSession.getAttribute("MEMBERVO");
		
		String m_id = memberVO.getM_id();
		
		System.out.println("세션아이디온"+m_id);
		
		int ret = memberService.updateLogout(dateVal, m_id);
		
		httpSession.removeAttribute("MEMBERVO");
		
			return "dateVal";
		
		
		
		
		//return "redirect:/";
	}
	
	
}
