package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_ModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
		EmpDBBean dao = new EmpDBBean();	
		EmpDataBean dto;	
		
		String storeNo = "";
		int empNo;
		
		try {	
			String adm_id = (String)request.getSession().getAttribute("id");
			String pwd = request.getParameter("pwd");
			String id = request.getParameter("id");
			empNo = Integer.parseInt(request.getParameter("eno"));
			
			storeNo = (String)request.getSession().getAttribute("storeNo");
			boolean checkPwd = dao.checkPwd(adm_id, pwd);
			
			if(checkPwd) { 
				dto = new EmpDataBean();
				dto.setEmpNo(Integer.parseInt(request.getParameter("eno")));
				dto.setEmpNm(request.getParameter("name"));
				dto.setPosition(request.getParameter("position"));
				dao.modifyEmp(dto);
				if(adm_id.equals(id)) { 
					request.getSession().setAttribute("name",dto.getEmpNm());
				}
			} else {
				return "/jsp/admin/modifyReturn.jsp?result=0&empNo="+empNo;
				//return "/jsp/admin/management_select.do?empNo="+empNo;	
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "/jsp/admin/modifyReturn.jsp?result=1&store_no="+storeNo; 
		//return "/jsp/admin/management_list.do?store_no="+storeNo;
	}
}
