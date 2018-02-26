package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import store.list.StoreListDBBean;
import store.list.StoreListDataBean;

public class SignInConAction implements CommandAction {

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {
    	
    	String url = request.getParameter("url");
    	if(url != null) {
    		request.getSession().setAttribute("url", url);
    		System.out.println(url);
    	}
    	// 한글 인코딩 처리 
        request.setCharacterEncoding("UTF-8");

        return "/jsp/member/SigninCon.jsp";
    }
}