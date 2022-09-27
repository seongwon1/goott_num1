package com.mycompany.project.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.project.common.model.UserDAO;


@Controller
public class UserController {
	@Inject
	BCryptPasswordEncoder pwdEncoder; // 비밀번호 암호화 ㅎ객체
	@Inject
	UserDAO userDao;

	@RequestMapping("/") // 시작 페이지
	public String home() {

		return "home";
	}

	@RequestMapping("/user/login")
	public String login() {

		return "user/login"; // 로그인 페이지로 이동
	}

	@RequestMapping("/user/join")
	public String join() {

		return "user/join"; // 회원가입 페이지로 이동
	}

	// 사용권한이 없을 경우

	@RequestMapping("/user/denied")
	public String denied(Model model, HttpServletRequest request) {

		AccessDeniedException ex = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);

		model.addAttribute("message", ex);
		return "user/denied";

	}

	@RequestMapping("/admin/*") // 관리자 메인 페이지
	public String admin_main() {

		return "admin/main";
	}

	@RequestMapping("/user/insert") //
	public String insert(String userid, String passwd, String name, String authority) {
		Map<String, Object> map = new HashMap();
		map.put("userid", userid);
		String pwd = pwdEncoder.encode(passwd);
		map.put("passwd", pwd);
		map.put("name", name);
		map.put("authority", authority);
		userDao.insert(map);
		return "user/login"; // 로그인 페이지로 이동
	}

	// 로그아웃 처리
	@RequestMapping("/user/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/home";// 시작 페이지로 이동
	}
}