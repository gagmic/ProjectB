package com.hb.controller;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hb.service.BoardService;
import com.hb.vo.BoardVO;
import com.hb.vo.NaviVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardSvc;
	
	@RequestMapping("/BoardList")
	public String requestBoardPage(Model model,
				@RequestParam(value="nowPage", 
				defaultValue="1") int nowPage
			){
		NaviVO nvo = new NaviVO(boardSvc.getTotalRecode(),
				nowPage);
		List<BoardVO> list = boardSvc.getBoardList(nvo);
		model.addAttribute("list",list);
		model.addAttribute("navi",nvo);
		return "/board/BoardList";
	}
			
	@RequestMapping("/newContent")
	public void setNewContent(Model model){
		BoardVO vo = new BoardVO();
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/insertContent")
	public void insertContent(@RequestParam("content") String text,
			HttpServletRequest request){
		
		MultipartHttpServletRequest mhlr = 
				(MultipartHttpServletRequest)request;
		Iterator<String> it = mhlr.getFileNames();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		Enumeration<String> en = mhlr.getParameterNames();
		if(en.hasMoreElements()){
			System.out.println(en.nextElement());
		}
	}
		
	@RequestMapping("/boardDetail")
	public ModelAndView getBoardDetail(
			@RequestParam("no") int no){
		ModelAndView model = new ModelAndView("/board/boardDetail");
		BoardVO board = new BoardVO();
		board.setNo(no);
		board = boardSvc.getBoardDetail(board);
		model.addObject("vo", board);
		return model;
	}
		
	@RequestMapping("/deleteBoard")
	public String deleteBoard(
			@RequestParam("no") int no){
		BoardVO board = new BoardVO();
		board.setNo(no);
		boardSvc.getBoardDelete(board);
		return "redirect:/board/BoardList";
	}
	
	@RequestMapping("/prepareInsertBoard")
	public void prepareInsertBoard(Model model){
		BoardVO vo = new BoardVO();
		vo.setWriter("hong");
		vo.setPassword("1234");
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardVO vo, 
			HttpServletRequest request){
		boardSvc.insertBoard(vo, request);
		return "redirect:/board/BoardList";
	}
	
	@RequestMapping("/modifyBoard")
	public String modifyBoard(Model model,
			@RequestParam("no") int no){
		BoardVO vo = new BoardVO();
		vo.setNo(no);
		vo = boardSvc.getBoardDetail(vo);
		model.addAttribute("vo", vo);
		return "/board/modifyBoard";
	}
	@RequestMapping("/modifyPrc")
	public String modifyBoard(BoardVO vo){
		boardSvc.modifyBoard(vo);
		return "redirect:/board/boardDetail?no="+vo.getNo();
	}
}



