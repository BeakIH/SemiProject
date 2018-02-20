package action;

import java.util.List;
import list.ListDBBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements CommandAction{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		List articleList = null;
		ListDBBean dbPro = ListDBBean.getInstance();
		
		articleList = dbPro.getAllData();
		
		request.setAttribute("articleList", articleList);
		
		return "/jsp/storeList/main.jsp";
	}
}
