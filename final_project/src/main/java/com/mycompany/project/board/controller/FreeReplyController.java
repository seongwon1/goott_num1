package com.mycompany.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.FreeReplyPageDTO;
import com.mycompany.project.board.service.FreeBoardService;
import com.mycompany.project.board.service.FreeReplyService;


@Controller
public class FreeReplyController {

		@Autowired
		FreeReplyService replyService;
		@Autowired
		FreeBoardService boardService;
		
		@ResponseBody
		@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
		public void replyInsert(FreeReplyDTO dto) {
			
			replyService.insertReply(dto);
			
		}
		
		@ResponseBody
		@RequestMapping(value = "/replyList", method = RequestMethod.GET)
		public FreeReplyPageDTO replyList(Criteria cri) {
			
			return  replyService.replyList(cri);
			
			
		}
		@ResponseBody
		@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
		public void replyDelete(FreeReplyDTO dto) {
			
			 replyService.deleteReply(dto);
			 
		}
		

		@ResponseBody
		@RequestMapping("/reply/detail/{replyId}")
		public ModelAndView detail(@PathVariable("replyId") int replyId, ModelAndView mv) {
			FreeReplyDTO dto = replyService.detail(replyId);	
			mv.setViewName("freeBoard/freeReplyDetail");
			mv.addObject("dto",dto);
			System.out.println(dto);
			return mv;
		}
		
		@ResponseBody
		@RequestMapping("/reply/update/{replyId}")
		public ResponseEntity<String> updateRply(@PathVariable("replyId") int replyId, @RequestBody FreeReplyDTO dto){
			ResponseEntity<String> entity = null;
			try {
				dto.setReplyId(replyId);
				replyService.updateReply(dto);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				System.out.println(entity);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				
			}
			
			return entity;
		}
}
