package com.tech.controllers.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.controllers.Controller;
import com.tech.dao.NoticeDao;
import com.tech.vo.Notice;

public class noticeController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("noticeController");

		// hidden 타입의 페이지
		int page = 1; //처음실행시 페이지는 1로 초기화됨
		String pg = request.getParameter("pg"); //pg = 페이지번호
		if (pg != null && !pg.equals(""))
			page = Integer.parseInt(pg);

		// notice에서 name=f인 제목,내용 선택 창
		String field = request.getParameter("f");
		System.out.println("field : " + field);
		if (field == null || field.equals(""))
			field = "title"; // 기본값을 title로 설정
		System.out.println("field2 : " + field);

		// notice에서 name=q인 검색 창
		String query = request.getParameter("q");
		System.out.println("query : " + query); // 검색한 내용이 콘솔창에 출력
		if (query == null)
			query = ""; // 모든 것을 검색_검색않고 그냥 내용 다 띄우는 것
		System.out.println("query2 : " + query);

		NoticeDao dao = new NoticeDao();
		List<Notice> list = dao.getNotices(page, field, query); //dao에 전달

		// 페이징 2단계
		// total 글의 갯수 구하기
		int cnt = dao.getCount(field, query);
		System.out.println("tot cnt : " + cnt);
		// start end 구하기
		int start = page - (page - 1) % 5; // 페이지 그룹에서 첫페이지 번호
		int end = cnt / 5 + (cnt % 5 == 0 ? 0 : 1); // 토탈 페이지수(끝페이지 번호)

		// 필요한 데이터를 request에 담기
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("cnt", cnt);
		request.setAttribute("page", page);
		request.setAttribute("query", query);

		// request에 list를 list라는 이름으로 적재
		request.setAttribute("list", list);
		// request를 가지고 포워드
		request.getRequestDispatcher("notice.jsp").forward(request, response);

	}

}
