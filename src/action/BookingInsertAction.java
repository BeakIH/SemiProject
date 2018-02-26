package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.BookingDBBean;
import booking.BookingDataBean;
import reserve.MemSelectDateBean;

public class BookingInsertAction implements CommandAction{
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
	/*	System.out.println(request.getParameter("bk_menu"));
		System.out.println(request.getParameter("bk_pri_sum"));
		System.out.println(request.getParameter("store_nm"));
		System.out.println(request.getParameter("bk_tbl_cnt"));
		
		System.out.println(request.getParameter("bk_date"));
		System.out.println(request.getParameter("bk_cnt"));
		System.out.println(request.getParameter("store_no"));

		
		System.out.println("mem_no:::"+request.getParameter("mem_no"));
		System.out.println("mem_nm:::"+request.getParameter("mem_nm"));
		System.out.println("mem_tel:::"+request.getParameter("mem_tel"));*/
		
		
		/*MemSelectDateBean article2 = new MemSelectDateBean();
		
		article2.setMem_no(Integer.parseInt(request.getParameter("mem_no"))); //예약확인 담당자
		article2.setMem_nm(request.getParameter("mem_nm")); //로그인 회원이름
		article2.setMem_tel(request.getParameter("mem_tel")); //회원 전화번호
*/		
		
		/*System.out.println(request.getParameter("emp_no"));*/
		
		
		BookingDataBean article = new BookingDataBean();
		article.setMemNo(Integer.parseInt(request.getParameter("mem_no")));
		article.setMemNm(request.getParameter("mem_nm"));
		article.setMemTel(request.getParameter("mem_tel"));
		article.setEmpNo(Integer.parseInt(request.getParameter("emp_no"))); //예약확인 담당자
		article.setBkMenu(request.getParameter("bk_menu")); //예약 음식메뉴
		article.setBkPriSum(request.getParameter("bk_pri_sum")); //예약음식메뉴 총가격
		article.setBkDate(request.getParameter("bk_date")); //예약일시
		article.setStoreNm(request.getParameter("store_nm")); //매장이름
		article.setBkCnt(request.getParameter("bk_cnt")); //예약인원수
		article.setBkTblCnt(Integer.parseInt(request.getParameter("bk_tbl_cnt"))); //예약테이블수
		article.setStoreNo(Integer.parseInt(request.getParameter("store_no"))); //매장 번호
		
		System.out.println("부킹메뉴::::"+article.getBkMenu());
		
		BookingDBBean dbPro = BookingDBBean.getInstance();// DBó��
		System.out.println("article::"+article);
		dbPro.insertBooking(article);

		return "../member/reserveSuccess.jsp";
	}
}



