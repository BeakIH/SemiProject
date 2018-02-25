package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.BookingDBBean;
import booking.BookingDataBean;


public class BookingListAction implements CommandAction {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
			
//		String id = (String)request.getSession().getAttribute("id");
		
	//	int store_no = Integer.parseInt((String)request.getSession().getAttribute("storeNo"));

		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		BookingDBBean dao = BookingDBBean.getInstance();
		ArrayList<BookingDataBean> confirmList = dao.bookingAdminCall(store_no);
		
		System.out.println("aaaa::"+confirmList.size());
		
		request.setAttribute("confirmList", confirmList);
		request.setAttribute("errorpage", "0");
		
		return "/jsp/admin/bookingList.jsp";
	
	}	
}
