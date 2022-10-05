package com.mycompany.project.common.serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class FailureHandler implements AuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		response.sendRedirect("/login");
//		request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
//		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}
}
