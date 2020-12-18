package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;

public class noticeRegController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeRegController");
		response.sendRedirect("noticeReg.jsp");
	}

}
