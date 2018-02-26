package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import booking.BookingDBBean;

public class ConfirmYnAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int bk_no = Integer.parseInt(request.getParameter("bk_no"));
		BookingDBBean dao = BookingDBBean.getInstance();
		dao.updateConfirm(bk_no);
//		ArrayList<EmpDataBean> manageList = dao.getEmpList(store_no);
	
//		request.setAttribute("manageList", manageList);
//		request.setAttribute("errorpage", "0");
		
		return "/jsp/admin/bookingList.jsp";
	}
}
