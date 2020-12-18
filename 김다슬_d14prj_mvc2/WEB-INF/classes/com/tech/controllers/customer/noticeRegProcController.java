package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;
import com.tech.vo.Notice;

public class noticeRegProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeRegProcController");

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		NoticeDao dao = new NoticeDao();

		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);

		int af = dao.write(n);

		if (af > 0) {
			// 화면전환 list로 보내기
			response.sendRedirect("notice.do");
		} else {
			response.sendRedirect("error.jsp");

		}

	}

}
