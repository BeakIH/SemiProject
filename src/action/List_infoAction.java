package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.MemSelectDBBean;
//import list.ListDBBean;
import reserve.ReserveDBBean;
import review.ReviewDBBean;

public class List_infoAction implements CommandAction {//글 목록 처리
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		
		// store_no 값을 넘겨 받음
		int storeNo = Integer.parseInt(request.getParameter("store_no"));
		
		//System.out.println("storeNo:::"+storeNo); // 값 넘어옴
		
		List articleList = null;
		
		ReserveDBBean dbPro = ReserveDBBean.getInstance();
		
		
		//System.out.println("테스트1");
		
		//store_no로 store_list테이블 셀렉트 해오는 메서드
		articleList = dbPro.getInfo(storeNo,"ones");
	
		request.setAttribute("articleList", articleList);
		
		//세션값 받아오기 id값
		String id = (String)request.getSession().getAttribute("id");
		
		//System.out.println("mem_id:::"+id); // 값 넘어옴
		
		
		List articleList2 = null;
		MemSelectDBBean dbPro2 = MemSelectDBBean.getInstance();

		List searchList2 = new ArrayList();

		//System.out.println("테스트3");
		
		//세션값 id로 member 테이블 셀렉트 해오는 메서드
		articleList2= dbPro2.MemInfo(id);

		request.setAttribute("articleList2", articleList2);
		request.setAttribute("id", id);
		
		
		//로그인 이후 그전 페이지로 돌아가는 세션값 url를 삭제하는 메서드
		request.getSession().removeAttribute("url");
		
		
		
		
		return "/jsp/storeList/list_info.jsp";//해당 뷰
	}
}
