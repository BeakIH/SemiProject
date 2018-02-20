package action;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookingListAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
			
		String id = (String)session.getAttribute("id");

		return "../jsp/admin/bookingListPro.jsp";
	
	}	
}
