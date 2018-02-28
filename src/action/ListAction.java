package action;

import java.util.ArrayList; 
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import list.ListDBBean;

public class ListAction implements CommandAction {//글 목록 처리
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
	/*	int pageSize = 10;//하나의 페이지에서 보여줄 행의 수
*/		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");*/
		
		// 파라미터 값 저장
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		String sortValue = request.getParameter("sortValue");
		String cateName = request.getParameter("cate_nm");
		String minSal = request.getParameter("minSal");
		String maxSal = request.getParameter("maxSal");
		String floorNo = request.getParameter("floor_no");
		
		System.out.println("floorNo::"+floorNo);
		// 정렬옵션 사용하지 않는경우 null 에러 나지않도록 값 초기화
		if (sortValue == null){// 빈값이면
			sortValue = "-1"; //초기화
		}
		
		if (cateName == null){
			cateName ="-1"; 
		}
		
		if (minSal == null){
			minSal ="-1"; 
		}
		
		if (maxSal == null){
			maxSal ="-1"; 
		}
		
		if (floorNo == null) {
			floorNo ="-1";
		}
		
		// int 값으로 형변환
		int iSortValue = Integer.parseInt(sortValue);
		int iCateName = Integer.parseInt(cateName);
		int iminSal = Integer.parseInt(minSal);
		int imaxSal = Integer.parseInt(maxSal);
		int floor_no = Integer.parseInt(floorNo);
		int searchn = 0;

		// 검색 옵션 선택안한경우 
		if (search == null) { // 키워드 입력 x 
			search = "";
		} else {
			searchn = Integer.parseInt(request.getParameter("searchn"));
		}
		
		int count = 0; // 전체 글의 개수
		List articleList = null;
		ListDBBean dbPro = ListDBBean.getInstance();

		if (search.equals("") || search == null) { // 검색이 아닌경우
			count = dbPro.getArticleCount();
		} else { // 검색인 경우
			count = dbPro.getArticleCount(searchn, search, iSortValue, iCateName, iminSal, imaxSal, floor_no); // 						모든파라미터를 받아야함
		}

		System.out.println("count::"+count);
		
		if (count>0) {
			System.out.println("1차확인");
			if (search.equals("") || search == null) { // 검색어에 값이 없는경우 ( 검색 x : 기본페이지 )
				if (iSortValue >= 0){// 셀렉트 박스 선택한 경우
					if(iCateName>=0) {
						articleList = dbPro.getTotalArticles2(iSortValue, iCateName);
					}else {
						articleList = dbPro.getArticles(1, 10, iSortValue);
					}
				} else if (iCateName >=0){ // 이부분 문제
					if(iminSal >0 && imaxSal >0) {// 항목(o), 금액(o), 검색(x)
						articleList = dbPro.getArticlesCateSal(iCateName,iminSal,imaxSal);
					}else {// 항목(o), 금액(x), 검색(x)
						articleList = dbPro.getArticles(iCateName); // 여기도 startRow, endRow 받아야함
					}
				} else if (iminSal >=0 && imaxSal >=0) { // 가격 정렬
					articleList = dbPro.getSortSal(1, 10, iminSal, imaxSal);
				} else if (floor_no >=0) {
					articleList = dbPro.getFloor(floor_no);
				} else {// 정렬옵션 선택 x ( = 초기화면 )
					articleList = dbPro.getArticles(1, 10); // 검색어가 없으므로 매개변수가 둘
				}
			}else { // 검색한 경우에 뿌려줄 리스트를 저장
				System.out.println("2차확인(검색한 경우)");
				if(iSortValue != -1 && iCateName != -1 && iminSal != -1 && imaxSal != -1 && floor_no != -1) { // 검색(2) + 음식(1) + 정렬(1) + 가격(2)
					System.out.println("이루어져라 얍");
					articleList=dbPro.getAllArticles(search, searchn, iSortValue, iCateName, iminSal, imaxSal, floor_no);
				}else if(!(search.equals("")) && searchn != 0 && iCateName != -1 && iminSal != -1 && imaxSal != -1) {// 검색+ 가격 + 항목 
				}else if(iCateName != -1 && iminSal != -1 && imaxSal != -1) { // 가격검색 + 음식종류 + 검색어 
					if(floor_no!= -1) {
						articleList=dbPro.getSearchFoodSal(search, searchn, iCateName,iminSal, imaxSal, floor_no);
					}else {
						articleList=dbPro.getSearchFoodSal(search, searchn, iCateName,iminSal, imaxSal, floor_no);
					}
				}else if(iminSal != -1 && imaxSal != -1) {// 가격검색 + 검색어
					articleList=dbPro.getSearchSal(search, searchn, iminSal, imaxSal);
				}else if(iCateName != -1) {// 음식종류 + 검색어
					articleList=dbPro.getSearchFood(search, searchn, iCateName);
				}else if(iSortValue != -1) {
					articleList=dbPro.getSearchSort(search, searchn, iSortValue);
				}else {// 검색어만 입력한 경우
					System.out.println("여기돌아야함~~~~~~~~~~~~");
					articleList = dbPro.getArticles(1, 10, searchn, search);
				}
			}
		}

		request.setAttribute("count", new Integer(count));
		request.setAttribute("iSortValue", new Integer(iSortValue));
		request.setAttribute("iCateName", new Integer(iCateName));
		request.setAttribute("iminSal", new Integer(iminSal));
		request.setAttribute("imaxValue", new Integer(imaxSal));
		request.setAttribute("cateName", cateName);
		request.setAttribute("search", search);
		request.setAttribute("searchn", searchn);
		
		request.setAttribute("articleList", articleList);
		return "/jsp/storeList/list.jsp";//해당 뷰
	}
}
