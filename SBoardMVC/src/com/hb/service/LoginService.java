package com.hb.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hb.model.MemberMapper;
import com.hb.vo.MemberVO;

@Service
public class LoginService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean isLoginMember(String id, String pw){
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(pw);
		MemberMapper mapper = 
				template.getMapper(MemberMapper.class);
		return mapper.loginMember(vo) > 0? true : false;
	}
}