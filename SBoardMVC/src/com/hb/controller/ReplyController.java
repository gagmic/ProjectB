package com.hb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hb.service.ReplyService;
import com.hb.vo.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	ReplyService replySvc;
	
	@RequestMapping("/replyList")
	public String getReplyList(
			@RequestParam("no") int no,
			Model model){
		ReplyVO vo = new ReplyVO();
		vo.setParentid(no);
		List<ReplyVO> list = replySvc.getReplyList(vo);
		model.addAttribute("list", list);
		return "/reply/replyList";
	}
	@RequestMapping("/deleteReply")
	public String deleteReply(@RequestParam("id") int id,
							@RequestParam("no")int no){
		ReplyVO reply = new ReplyVO();
		reply.setId(id);
		replySvc.removeReply(reply);
		return "redirect:/reply/replyList?no="+no;
	}
	@RequestMapping("/insertReply")
	public String insertReply(@RequestParam("no")int no,
			@RequestParam("content")String content){
		ReplyVO reply = new ReplyVO();
		reply.setParentid(no);
		reply.setContent(content);
		reply.setWriter("hong");
		replySvc.insertReply(reply);
		return "redirect:/reply/replyList?no="+no;
	}
}
