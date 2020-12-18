package com.tech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.db.DBcon;
import com.tech.vo.Notice;

public class NoticeDao {

	public int getCount(String field, String query) throws Exception {
		Connection con = DBcon.getConnection();

		String sql = "select count(*) cnt from notices where " + field + " like ?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + query + "%");
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		int cnt = rs.getInt("cnt"); // cnt = sql의 cnt

		pstmt.close();
		rs.close();
		con.close();

		return cnt;
	}

	public List<Notice> getNotices(int page, String field, String query) throws Exception {
		// noticeController에서 page,field,query를 받아옴

		int srow = 1 + (page - 1) * 5; // 1,6,11 시작번호
		int erow = 5 + (page - 1) * 5; // 5,10,15 끝페이지
		// 5는 한페이지에 보여지는 레코드갯수

		Connection con = DBcon.getConnection();

		Statement st = con.createStatement();

		// String sql = "select * from notices order by to_number(seq) desc";
		String sql = "select * from " + "(select rownum num, notices.* from " + "(select* from notices where " + field
				+ " like ? " + "order by regdate desc) notices) " + "where num between ? and ?";
		// field를 ?로 안한 이유 : 오류가 발생하기 때문? 서브쿼리 안의 내용은 물음표로 적용하면 적용 X
		// 물음표로 했을 때 실행은 되지만 검색에서 오류발생 아마 field가 충돌나는듯?

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + query + "%");
		pstmt.setInt(2, srow);
		pstmt.setInt(3, erow);

		// ResultSet과 PreparedStatement이 충돌나기 때문에 executeQuery의 괄호안을 비워줌
		ResultSet rs = pstmt.executeQuery();

		// List작업 추가
		List<Notice> list = new ArrayList<Notice>();
		while (rs.next()) {
			Notice n = new Notice();
			n.setSeq(rs.getString("seq"));
			n.setWriter(rs.getString("writer"));
			n.setTitle(rs.getString("title"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			// 리스트에 담기
			list.add(n);

		}
		rs.close();
		st.close();
		pstmt.close();
		con.close();
		return list;
	}

	public int write(Notice n) throws Exception {
		/*
		 * Class.forName("oracle.jdbc.driver.OracleDriver");
		 * 
		 * //접속 String url="jdbc:oracle:thin:@localhost:1521:orcl"; String user="green";
		 * String pw="123456"; Connection con=DriverManager.getConnection(url,user,pw);
		 */
		Connection con = DBcon.getConnection();

		// 실행
		String sql = "insert into notices(seq,title,content,writer,regdate,hit) "
				+ "values((select max(to_number(seq))+1 seqnum from notices)," + "?,?,'shin',sysdate,0)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());

		int af = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return af;

	}

	public int delete(String seq) throws Exception {

		Connection con = DBcon.getConnection();
		// 실행
		// String sql="delete from notices where seq="+seq;
		String sql = "delete from notices where seq=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, seq);

		int af = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return af;
	}

	public int update2(String seq, String t, String c) throws Exception {
		Connection con = DBcon.getConnection();
		// 실행

		/*
		 * String sql="update notices set title=?, content=?"
		 * +"where seq="+notice.getSeq();
		 */
		String sql = "update notices set title=?, content=?" + "where seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, t);
		pstmt.setString(2, c);
		pstmt.setString(3, seq);

		int af = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return af;
	}

	public int update(Notice notice) throws Exception {
		Connection con = DBcon.getConnection();
		// 실행

		/*
		 * String sql="update notices set title=?, content=?"
		 * +"where seq="+notice.getSeq();
		 */
		String sql = "update notices set title=?, content=?" + "where seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());

		int af = pstmt.executeUpdate();

		pstmt.close();
		con.close();
		return af;
	}

	public Notice getNotice(String seq) throws Exception {
		Connection con = DBcon.getConnection();

		Statement st = con.createStatement();

		String sql = "select seq,title,writer,content,regdate,hit " 
		+ "from notices " + "where seq=" + seq;
		
		ResultSet rs2 = st.executeQuery(sql);
		rs2.next();

		//hit up()
		String sql2="update notices set hit=? where seq="+seq;
		PreparedStatement pstmt=con.prepareStatement(sql2);
		pstmt.setInt(1, rs2.getInt("hit")+1);
		pstmt.executeUpdate(); //hit up실행

		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		st.close();
		con.close();
		pstmt.close();

		return n;
	}
}
