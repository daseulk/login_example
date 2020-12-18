package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;
import com.tech.vo.Notice;

public class noticeEditProcController implements Controller{

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeEditProcController");
		String seq = request.getParameter("c");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDao dao = new NoticeDao();
		int af = dao.update2(seq,title,content);
		
		
		Notice n = dao.getNotice(seq);
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		
	}

}
