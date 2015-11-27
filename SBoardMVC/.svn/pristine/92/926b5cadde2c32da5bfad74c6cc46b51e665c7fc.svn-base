package com.hb.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.hb.vo.MemberVO;

public class RegistValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return MemberVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors error) {
		MemberVO vo = (MemberVO)target;
		if(vo.getId()==null||vo.getId().trim().isEmpty()){
			error.rejectValue("id", "required");
		}
	}

}
