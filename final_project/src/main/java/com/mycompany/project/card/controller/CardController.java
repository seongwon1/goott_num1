package com.mycompany.project.card.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.card.model.CardDTO;
import com.mycompany.project.card.service.CardService;


@RequestMapping("/board")
@Controller // ���� Ŭ������ ������ �ö�� �� ��Ʈ�ѷ� bean���� ����� �ϴ� ��.
public class CardController {
	
	@Autowired
	CardService service;
	// Model : �ڷ�(������)�� �����ϴ� ����� ����
	// modelAndview : �����Ϳ� �̵��ϰ��� �ϴ� viewpage�� ���� �����ϴ� ��ü(Ŭ����)
	// ó�� create �������� ���� ���� ���� ����

	@RequestMapping(value = "/card") // url�� method ���� ���� �ش�.(http://localhost/list)�� ���� �ؿ� �޼��尡 ���۵ȴٴ� ��.
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = service.list(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list); // (key, value)
		mv.setViewName("/card/card");
		return mv; // ModelAndView�� object Ÿ���̴ϱ� object�� �����Ѵ�. (list.jsp�� ������ �϶�� ��)
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	public List<CardDTO> getList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword, @RequestParam("category_select") String category_select, Model model) throws Exception {
		CardDTO testDto= new CardDTO();
		testDto.setType(type);
		testDto.setKeyword(keyword);
		testDto.setCategory_select(category_select);
		return service.detail(testDto);
	}

}
