package action;

import java.util.ArrayList; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;
import mvc.controller.ControllerUsingURI;

public class Management_CreateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		try {
			request.setCharacterEncoding("UTF-8");
			
			EmpDataBean dto = new EmpDataBean();
			EmpDBBean dao = new EmpDBBean();
			
			String name = request.getParameter("name");
			int sNo = Integer.parseInt(request.getParameter("sNo"));
			String pos = request.getParameter("position");
			
			dto.setEmpNm(name);
			dto.setStoreNo(sNo);
			dto.setPosition(pos);
			
			dao.insertEmp(dto);
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "/jsp/admin/management_list.do?store_no=1001";
	}
}
