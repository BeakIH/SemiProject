package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginDBBean;

public class LoginAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	request.setCharacterEncoding("UTF-8");
		
	String userid = request.getParameter(userid); 
	String userpw = request.getParameter(userpw);
	
	LoginDBBean logPro = LoginDBBean.getInstance1();
	
			
	int i =0;
	i = logPro.userCheck(id, pw);
			
	if(i==0) { // 0 : 아이디없음 -> 회원가입으로 
		return "../member/Signin.jsp";
	} else if(i==1) { // 1: 관리자  -> 예약현황페이지로 
		return "/admin/bookingList.jsp";
	} else if(i==2) { // 2: 일반회원 -> 매장리스트 
		return "../storeList/list_info.jsp";
	} else { // -1: 비밀번호가 다릅니당 -> 비밀번호 재입력
		return "alert('비밀번호가 다릅니다. 다시 한번 입력해주세요.')";
	}
	
			
	}
}
