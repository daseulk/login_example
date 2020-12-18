package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;
import com.tech.vo.Notice;

public class NoticeDetailController_bak implements Controller {

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String seq = request.getParameter("c");

		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq); //dao에 getnotice를 호출
		
		//추가 jsp로 전달
		//n을 request에 담기
		request.setAttribute("n", n);
		//response.sendRedirect("noticeDetail.jsp");
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		
		
	}

}
