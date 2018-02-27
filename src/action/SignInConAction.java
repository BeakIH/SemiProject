package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import store.list.StoreListDBBean;
import store.list.StoreListDataBean;

public class SignInConAction implements CommandAction {

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {
    	
    	
    	//메뉴 상세페이지에서 로그인 이후 이전화면으로 돌아가기위해 갖고 온 url주소 값 넘겨받음
    	String url = request.getParameter("url");
    	if(url != null) {
    		request.getSession().setAttribute("url", url);
    		//System.out.println(url);
    	}
    	// 한글 인코딩 처리 
        request.setCharacterEncoding("UTF-8");

        return "/jsp/member/SigninCon.jsp";
    }
}