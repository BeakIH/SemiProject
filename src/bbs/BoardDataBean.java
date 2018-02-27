package bbs;

import java.sql.*;
import java.text.SimpleDateFormat;

//매장 별 휴무일 등 이벤트 및 공지사항 매장 별 휴무일, 이벤트 및 공지사항
public class BoardDataBean {

	// 글번호 공지글번호
	private int b_no;

	// 게시자 게시직원번호
	private int emp_no;

	// 글제목 공지글제목
	private String b_title;

	// 게시직원명
	private String emp_nm;

	// 글내용 글내용
	private String b_content;

	// 게시일자 게시일자
	private String post_date;

	// 조회수 조회수
	private int b_view_cnt;

	private int store_no;
	// 게시여부

	private String board_pw;
	
	private String store_nm;
	
	public String getStore_nm() {
		return store_nm;
	}

	public void setStore_nm(String store_nm) {
		this.store_nm = store_nm;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getEmp_nm() {
		return emp_nm;
	}

	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public int getB_view_cnt() {
		return b_view_cnt;
	}

	public void setB_view_cnt(int b_view_cnt) {
		this.b_view_cnt = b_view_cnt;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getBoard_pw() {
		return board_pw;
	}

	public void setBoard_pw(String board_pw) {
		this.board_pw = board_pw;
	}





	
}