package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;
import com.tech.vo.Notice;

public class noticeEditController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeEditController");
		
		String seq=request.getParameter("c");

		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(seq);
		
		//request에 n을 셋팅해서 전달
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);
		
	}

}
