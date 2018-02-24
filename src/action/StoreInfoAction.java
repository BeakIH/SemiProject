package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;
import store.list.StoreListDBBean;
import store.list.StoreListDataBean;

public class StoreInfoAction implements CommandAction {

/*    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {
    	
    	// 한글 인코딩 처리 
        request.setCharacterEncoding("UTF-8");

        String pageNum = request.getParameter("pageNum");

        StoreListDataBean article = new StoreListDataBean();
        article.setStoreNm(request.getParameter("storeNm"));
        article.setCateNm(request.getParameter("cateNm"));
        article.setStoreExp(request.getParameter("storeExp"));
        article.setStoreTel(request.getParameter("storeTel"));
        article.setStoreUrl(request.getParameter("storeUrl"));
   
        StoreListDBBean dbPro = StoreListDBBean.getInstance();
        int check = dbPro.updateArticle(article);

        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));

        return "/jsp/storeInfoPro.jsp";
    } */
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		StoreListDBBean dao = StoreListDBBean.getInstance();
		ArrayList<StoreListDBBean> manageList = dao.getEmpList(store_no);
		
		request.setAttribute("manageList", manageList);
		request.setAttribute("errorpage", "0");
		
		return "/jsp/admin/management.jsp";
	}
}
