package com.hb.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hb.model.BoardMapper;
import com.hb.vo.ReplyVO;

@Service
public class ReplyService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<ReplyVO> getReplyList(ReplyVO reply){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getReplyList(reply);
	}
	
	public void removeReply(ReplyVO reply){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.deleteReply(reply);
	}
	public void insertReply(ReplyVO reply){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.insertReply(reply);
	}
}