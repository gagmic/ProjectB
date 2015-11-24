package com.hb.model;

import java.util.List;

import com.hb.vo.MemberVO;
import com.hb.vo.ZipcodeVO;

public interface MemberMapper {
	public int loginMember(MemberVO vo);
	public int isExistId(String id);
	public List<ZipcodeVO> getlistZip(String Dong);
}
