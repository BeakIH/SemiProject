package bbs;
import java.sql.*; 
import java.text.SimpleDateFormat;



//매장 별 휴무일 등 이벤트 및 공지사항 매장 별 휴무일, 이벤트 및 공지사항
public class BoardDataBean {
	
	// 글번호 공지글번호



 private int bNo;

 // 게시자 게시직원번호
 private int empNo;

 // 글제목 공지글제목
 private String bTitle;

 //  게시직원명
 private String empNm;

 // 글내용 글내용
 private String bContent;

 // 게시일자 게시일자
 private String postDate;

 // 조회수 조회수
 private int bViewCnt;

 //  게시여부
/*private String postYn;
 // 패스워드*/

private String adm_pw;

 


public int getbNo() {
	return bNo;
}

public void setbNo(int bNo) {
     this.bNo = bNo;
 }

 public int getempNo() {
     return empNo;
 }

 public void setempNo(int empNo) {
     this.empNo = empNo;
 }

 public String getbTitle() {
     return bTitle;
 }

 public void setbTitle(String bTitle) {
     this.bTitle = bTitle;
 }

 public String getempNm() {
     return empNm;
 }

 public void setempNm(String empNm) {
     this.empNm = empNm;
 }

 public String getbContent() {
     return bContent;
 }

 public void setbContent(String bContent) {
     this.bContent = bContent;
 }

 public String getpostDate() {
	 
     return postDate;
 }

 public void setpostDate(String postDate) {
	 
	 this.postDate = postDate;
	 
 }

 public int getbViewCnt() {
     return bViewCnt;
 }

 public void setbViewCnt(int bViewCnt) {
     this.bViewCnt = bViewCnt;
 }


 
 public String getadm_pw() {
	 return  adm_pw;
 }
 
 public void setadm_pw(String adm_pw) {
	 this.adm_pw = adm_pw;
 }



}