package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.BookingDBBean;
import booking.BookingDataBean;


public class BookingListAction implements CommandAction {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		BookingDBBean dao = BookingDBBean.getInstance();
		request.setCharacterEncoding("UTF-8");
			
//		String id = (String)request.getSession().getAttribute("id");
		
	//	int store_no = Integer.parseInt((String)request.getSession().getAttribute("storeNo"));

		int store_no = Integer.parseInt(request.getParameter("store_no"));
		if(request.getParameter("bk_no")!=null){
			dao.updateConfirm(Integer.parseInt(request.getParameter("bk_no")));
			request.setAttribute("messege", "접수 되었습니다.");
		}
		
		ArrayList<BookingDataBean> confirmList = dao.bookingAdminCall(store_no);
		
		System.out.println("aaaa::"+confirmList.size());
		 
//		String[] img = {"../../img/1.png","../../img/2.png","../../img/3.png","../../img/4.png","../../img/5.png"};
//		for(int i = 0; i<50;i++){
//			int temp = (int)Math.random()*5;
//			int temp2 = (int)Math.random()*5;
//			
//			String copy=img[temp];
//			
//			img[temp] = img[temp2];
//			img[temp2] = copy;
//			
//		}
//		
//		request.setAttribute("img", img);
		request.setAttribute("confirmList", confirmList);
		request.setAttribute("errorpage", "0");
		
		return "/jsp/admin/bookingList.jsp"; 
	 
	}	
}
