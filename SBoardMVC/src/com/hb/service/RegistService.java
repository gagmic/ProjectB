package com.hb.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hb.model.MemberMapper;
import com.hb.vo.ZipcodeVO;

@Service
public class RegistService {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean isExistId(String id){
		MemberMapper mapper = 
				template.getMapper(MemberMapper.class);
		return mapper.isExistId(id)>0 ? false : true;
	}
	
	public String getZipCodeByJson(String dong){
		MemberMapper mapper = 
				template.getMapper(MemberMapper.class);
		System.out.println(dong);
		List<ZipcodeVO> list = mapper.getlistZip("%"+dong+"%");
		String zipJson = "";
		for(ZipcodeVO vo : list){
			zipJson += "<tr><td>"+vo.getZipcode()+"</td><td>"+
					"<a href='#' onclick=\"insert_address('"+vo.getZipcode()+"','"+
					vo.getSido()+" "+vo.getGugun()+" "+vo.getDong()+" "+
					vo.getBunji()+"')\">"+
					vo.getSido()+" "+vo.getGugun()+" "+vo.getDong()+" "+
					vo.getBunji()+"</a></td></tr>";
		}
		return zipJson;
		}
	}
