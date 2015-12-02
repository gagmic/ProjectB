package com.hb.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hb.model.BoardMapper;
import com.hb.vo.BoardVO;
import com.hb.vo.NaviVO;

@Service
public class BoardService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<BoardVO> getBoardList(NaviVO nvo){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getBoardList(nvo);
	}
	
	public int getTotalRecode(){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getTotalRecode();
	}
	public BoardVO getBoardDetail(BoardVO board){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getBoardDetail(board);
	}
	@Transactional
	public void getBoardDelete(BoardVO board) {
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.deleteBoard(board);
	}
	
	public void insertBoard(BoardVO board, 
			HttpServletRequest request){
		MultipartHttpServletRequest multipart = 
				(MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipart.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()){
			multipartFile = multipart.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				board.setFilename(multipartFile.getOriginalFilename());
				board.setFilepath("C:/file/upload/");
				board.setFilesize((int)multipartFile.getSize());
			}
		}
		System.out.println(board.getFilepath());
		File file = new File(board.getFilepath()+board.getFilename());
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.insertBoard(board);
	}
	
	public void modifyBoard(BoardVO vo) {
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.modifyBoard(vo);
	}
}



