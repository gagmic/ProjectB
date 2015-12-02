package com.hb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.service.LoginService;
import com.hb.vo.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	LoginService loginSvc;
	
	@RequestMapping("/welcomePage")
	public String welcomePage(
			@RequestParam("id")String id,
			@RequestParam("pw")String pw, HttpSession session){
		if(loginSvc.isLoginMember(id, pw)){
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPassword(pw);
			session.setAttribute("vo", vo);
			return "redirect:/board/BoardList";
		}else{
			return "/login";
		}
	}
}