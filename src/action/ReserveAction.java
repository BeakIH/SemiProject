package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.MemSelectDBBean;
import reserve.ReserveDBBean;

public class ReserveAction implements CommandAction {

public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		  
		int storeNo = Integer.parseInt(request.getParameter("store_no"));
		//System.out.println("storeNo:::"+storeNo); // 값 넘어옴
		
		List articleList = null;
		ReserveDBBean dbPro = ReserveDBBean.getInstance();

		

		articleList = dbPro.getInfo(storeNo, "ones");

		request.setAttribute("articleList", articleList);
		request.setAttribute("storeNo", storeNo);
		///////////////////////////////////////////////////////////////
		
		//세션값 id를 받아옴
		String id = (String)request.getSession().getAttribute("id");
		//System.out.println("mem_id:::"+id); // 값 넘어옴
		
		List articleList2 = null;
		MemSelectDBBean dbPro2 = MemSelectDBBean.getInstance();

		
		//System.out.println("테스트2");
		
		//세션값 id로 member테이블 셀렉트해오는 메서드
		articleList2= dbPro2.MemInfo(id);

		request.setAttribute("articleList2", articleList2);
		request.setAttribute("id", id);
		

		
		
		return "/jsp/storeList/reserve.jsp";//해당 뷰
	}
}

