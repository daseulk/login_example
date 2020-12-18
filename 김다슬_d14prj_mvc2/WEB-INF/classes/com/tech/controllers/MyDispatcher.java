package com.tech.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.customer.NoticeDetailController;
import com.tech.controllers.customer.noticeController;
import com.tech.controllers.customer.noticeDelProcController;
import com.tech.controllers.customer.noticeEditController;
import com.tech.controllers.customer.noticeEditProcController;
import com.tech.controllers.customer.noticeRegController;
import com.tech.controllers.customer.noticeRegProcController;

public class MyDispatcher extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service");

		String requestUri = request.getRequestURI();
		System.out.println("uri : " + requestUri);
		String conPtah = request.getContextPath();
		System.out.println("path : " + conPtah);
		String com = requestUri.substring(conPtah.length());
		System.out.println("com : " + com);

		Controller controller = null;
		try {
			if (com.equals("/customer/noticeDetail.do")) {
				controller = new NoticeDetailController();

			} else if (com.equals("/customer/noticeEdit.do")) {
				controller = new noticeEditController();

			} else if (com.equals("/customer/noticeEditProc.do")) {
				controller = new noticeEditProcController();

			} else if (com.equals("/customer/noticeDelProc.do")) {
				controller = new noticeDelProcController();

			} else if (com.equals("/customer/noticeRegProc.do")) {
				controller = new noticeRegProcController();

			} else if (com.equals("/customer/notice.do")) {
				controller = new noticeController();

			} else if (com.equals("/customer/noticeReg.do")) {
				controller = new noticeRegController();
			}

			controller.execute(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
		System.out.println("post method");
		service(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		System.out.println("get method");
		service(request, response);
	}

}
