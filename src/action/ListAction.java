package action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import list.ListDBBean;

public class ListAction implements CommandAction {//글 목록 처리
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pageSize = 10;//하나의 페이지에서 보여줄 행의 수
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");*/
		
		// 파라미터 값 저장
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		String sortValue = request.getParameter("sortValue");
		String cateName = request.getParameter("cate_nm");
		String minSal = request.getParameter("minSal");
		String maxSal = request.getParameter("maxSal");
		
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
		
		
		// int 값으로 형변환
		int iSortValue = Integer.parseInt(sortValue);
		int iCateName = Integer.parseInt(cateName);
		int iminSal = Integer.parseInt(minSal);
		int imaxSal = Integer.parseInt(maxSal);
		
		int searchn = 0;

		// 검색한 페이지가 아닌경우 ( 넘겨받은 파라미터가 없을때의 페이지 )
		if (pageNum == null) {// 초기값을 그냥받을경우 nullPointException 이 발생하기때문에 "1" 같은 값으로 초기화
			pageNum = "1";
		}

		// 검색 옵션 선택안한경우 
		if (search == null) { // 키워드 입력 x 
			search = "";
		} else {
			searchn = Integer.parseInt(request.getParameter("searchn"));
		}
		

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - (pageSize-1); // 1page = (1*10)-(10-9)
		int endRow = currentPage * pageSize;
		int count = 0; // 전체 글의 개수
		int number = 0; // 

		List articleList = null;
		ListDBBean dbPro = ListDBBean.getInstance();

		if (search.equals("") || search == null) { // 검색이 아닌경우
			count = dbPro.getArticleCount();
		} else { // 검색인 경우
			count = dbPro.getArticleCount(searchn, search); // 검색할 카테고리를 파라미터로 받아감
		}

		// 모든 검색에 사용하는 데이터를 searchList에 저장
		List searchList = new ArrayList();
		
/*		searchList.add(0, iSortValue);
		searchList.add(1, iCateName);
		searchList.add(2, iminSal);
		searchList.add(3, imaxSal);
		searchList.add(4, searchn);
		searchList.add(5, search);
		searchList.add(6, pageNum);
		searchList.add(7, startRow);
		searchList.add(8, endRow);
		searchList.add(9, count);
		searchList.add(10, number);
		*/
		// 코멘트부분 주석처리 1
		/* CommentDBBean cdb = CommentDBBean.getInstance(); */

		/* count 가 0보다 크다면 값을 select 해와서 articleList 에 저장해야하므로 dao 클래스의 메서드를 실행함 */
		if (count > 0) {
			if (search.equals("") || search == null) { // 검색어에 값이 없는경우 ( 검색 x : 기본페이지 )
				if (iSortValue >= 0){// 셀렉트 박스 선택한 경우
					/* System.out.println("iSortValue:::"+iSortValue); // 값 확인 */
					articleList = dbPro.getArticles(startRow, endRow, iSortValue);
				} else if (iCateName >=0){ // 이부분 문제
					/* System.out.println("iCateName:::"+iCateName); // 값 확인  */
					articleList = dbPro.getArticles(iCateName); // 여기도 startRow, endRow 받아야함
				} else if (iminSal >=0 && imaxSal >=0) { // 가격 정렬
					System.out.println("iminValue:::"+iminSal); // 값 확인
					System.out.println("imaxValue:::"+imaxSal); // 값 확인
					articleList = dbPro.getSortSal(startRow, endRow, iminSal, imaxSal);
				} else {// 정렬옵션 선택 x ( = 초기화면 )
				//System.out.println("start:"+startRow+"  end:"+endRow);
				articleList = dbPro.getArticles(startRow, endRow); // 검색어가 없으므로 매개변수가 둘
				}
			}else { // 검색한 경우에 뿌려줄 리스트를 저장
				articleList = dbPro.getArticles(startRow, endRow, searchn, search);
			}
		}


	/* 	BoardDataBean article = (BoardDataBean) articleList.get(0);
		System.out.println("article 확인 ::"+article.getStore_nm()); */
		
		// number - 글 번호
		number = count - (currentPage - 1) * pageSize;
					//11 -	(2 - 1)	* 	3   	= 8
		//해당 뷰에서 사용할 속성
		// request.setAttribute(스트링 타입 key 값, 오브젝트타입 value값);
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("iSortValue", new Integer(iSortValue));
		request.setAttribute("iCateName", new Integer(iCateName));
		request.setAttribute("iminSal", new Integer(iminSal));
		request.setAttribute("imaxValue", new Integer(imaxSal));
		request.setAttribute("cateName", cateName);
		request.setAttribute("search", search);
		
		request.setAttribute("articleList", articleList);
		
		return "/jsp/storeList/list.jsp";//해당 뷰
	}
}
