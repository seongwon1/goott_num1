package com.mycompany.project.board.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeBoardDTO;
import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.service.FreeBoardService;
import com.mycompany.project.board.service.FreeReplyService;



@Controller
public class FreeBoardController {
	
	@Autowired
	FreeBoardService boardService;
	@Autowired
	FreeReplyService replyService;  
	
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) {
		model.addAttribute("boardList",boardService.listPaging(cri));
		int total = boardService.total();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
		
		return "freeBoard/freeList";
	}
		
	@RequestMapping(value = "/freeInsert", method = RequestMethod.GET)
	public String insert() {
		
		return "freeBoard/freeInsert";
	}
	@RequestMapping(value = "/freeInsert", method = RequestMethod.POST)
	public ModelAndView insert(FreeBoardDTO dto) {
		
		boardService.insert(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/freeList");
		
		return mv;
	}
	
	@RequestMapping(value="/freeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map, FreeBoardDTO dto, Criteria cri) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("freeBoard/freeDetail");
		mv.addObject("data", boardService.detail(map));
		
		return mv;
	}
	
	@RequestMapping(value="/freeUpdate", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> list = boardService.detail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);
		mv.setViewName("freeBoard/freeUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="/freeUpdate", method = RequestMethod.POST)
	public ModelAndView update(FreeBoardDTO dto) {
		
		ModelAndView mv = new ModelAndView();
		int free_board_id = boardService.update(dto);
		mv.setViewName("redirect:/freeList");
		
		return mv;
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("free_board_id") int free_board_id ) {
		boardService.delete(free_board_id);
		
		return "redirect:/freeList";
	}
	

}


