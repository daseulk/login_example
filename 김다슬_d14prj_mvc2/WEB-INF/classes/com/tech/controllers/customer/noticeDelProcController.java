package com.tech.controllers.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;

public class noticeDelProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("noticeDelProcController");
			String seq=request.getParameter("c");

			NoticeDao dao=new NoticeDao();
			int af=dao.delete(seq);
			if(af>0){
				//화면전환 list로 보내기
				response.sendRedirect("notice.do");	
				}else {
					response.sendRedirect("error.jsp");
				}
	}

}
