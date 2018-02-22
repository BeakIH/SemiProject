package action;

import java.util.ArrayList; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_ListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int stNo = Integer.parseInt(request.getParameter("store_no"));
		EmpDBBean dao = EmpDBBean.getInstance();
		ArrayList<EmpDataBean> manageList = dao.getEmpList(stNo);
		request.getSession().setAttribute("manageList", manageList);

		return "/jsp/admin/management.jsp";
	}
}
