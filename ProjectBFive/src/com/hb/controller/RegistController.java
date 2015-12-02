package com.hb.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.service.RegistService;
import com.hb.vo.MemberVO;

@Controller
@RequestMapping("/regist")
public class RegistController {
	@Autowired
	RegistService registSvc;
	
	@RequestMapping("/registPage")
	public String setRegistForm(Model model){
		MemberVO vo = new MemberVO();
		ArrayList<String> hobbylist = new ArrayList<String>();
		hobbylist.add("����");
		hobbylist.add("����");
		hobbylist.add("���ǰ���");
		hobbylist.add("����");
		ArrayList<String> joblist = new ArrayList<String>();
		joblist.add("����");
		joblist.add("�л�");
		joblist.add("��Ÿ");
		ArrayList<String> genderlist = new ArrayList<String>();
		genderlist.add("��");
		genderlist.add("��");
		model.addAttribute("vo", vo);
		model.addAttribute("hobbylist", hobbylist);
		model.addAttribute("joblist", joblist);
		model.addAttribute("genderlist", genderlist);
		return "/regist/registPage";
	}
	@RequestMapping("/checkid")
	public void checkId(HttpServletResponse response,
			@RequestParam("v") String v){
		try{
			response.setCharacterEncoding("UTF-8");
			if(registSvc.isExistId(v)){
				response.getWriter().print("�ش� Id�� ��� �����մϴ�");
			}else{
				response.getWriter().print("�ش� Id�� �̹� �����մϴ�");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/ziplist")
	public void getZipList(HttpServletResponse response,
			@RequestParam("v")String v){
		try{
			response.setCharacterEncoding("UTF-8");
			String json = registSvc.getZipCodeByJson(v);
			response.getWriter().print(json);
		}catch(Exception e){
			e.printStackTrace();
			}
		}
	@RequestMapping("/register")
	public String insertMember(Model model, MemberVO vo, Errors error){
		new RegistValidator().validate(vo, error);
		if(error.hasErrors()){
			ArrayList<String> hobbylist = new ArrayList<String>();
			hobbylist.add("����");
			hobbylist.add("����");
			hobbylist.add("���ǰ���");
			hobbylist.add("����");
			ArrayList<String> joblist = new ArrayList<String>();
			joblist.add("����");
			joblist.add("�л�");
			joblist.add("��Ÿ");
			ArrayList<String> genderlist = new ArrayList<String>();
			genderlist.add("��");
			genderlist.add("��");
			model.addAttribute("vo", vo);
			model.addAttribute("hobbylist", hobbylist);
			model.addAttribute("joblist", joblist);
			model.addAttribute("genderlist", genderlist);
			return "/regist/registPage";
		}
		return "/regist/success";
	}
}