package booking;

import java.sql.Timestamp;

public class BookingDataBean {
	
 
	    // 예약번호 예약번호
	    private int bkNo;

	    //  대기번호
	    private int wtNo;
 
	    //  예약확인담당자
	    private int empNo;

	    // 예약회원번호 예약회원번호
	    private int memNo;

	    // 회원명 예약자명
	    private String memNm;

	    //  예약자연락처
	    private String memTel;

	    // 예약매장 예약매장명
	    private String storeNm;

	    // 예약일시 예약일시
	    private String bkDate;

	    // 예약인원 예약인원
	    private String bkCnt;

	    //  예약메뉴
	    private String bkMenu;

	    // 매장확인여부 매장확인여부
	    private String cofirmYn;

	    //  예약테이블수
	    private int bkTblCnt;

	    //  매장번호
	    private int storeNo;
	    // 예약음식 총 가격
	    private String bkPriSum;
	    
	    
	    public String getBkPriSum() {
			return bkPriSum;
		}

		public void setBkPriSum(String bkPriSum) {
			this.bkPriSum = bkPriSum;
		}

		public int getBkNo() {
	        return bkNo;
	    }

	    public void setBkNo(int bkNo) {
	        this.bkNo = bkNo;
	    }

	    public int getWtNo() {
	        return wtNo;
	    }

	    public void setWtNo(int wtNo) {
	        this.wtNo = wtNo;
	    }

	    public int getEmpNo() {
	        return empNo;
	    }

	    public void setEmpNo(int empNo) {
	        this.empNo = empNo;
	    }

	    public int getMemNo() {
	        return memNo;
	    }

	    public void setMemNo(int memNo) {
	        this.memNo = memNo;
	    }

	    public String getMemNm() {
	        return memNm;
	    }

	    public void setMemNm(String memNm) {
	        this.memNm = memNm;
	    }

	    public String getMemTel() {
	        return memTel;
	    }

	    public void setMemTel(String memTel) {
	        this.memTel = memTel;
	    }

	    public String getStoreNm() {
	        return storeNm;
	    }

	    public void setStoreNm(String storeNm) {
	        this.storeNm = storeNm;
	    }

	    public String getBkDate() {
	        return bkDate;
	    }

	    public void setBkDate(String bkDate) {
	        this.bkDate = bkDate;
	    }

	    public String getBkCnt() {
	        return bkCnt;
	    }

	    public void setBkCnt(String bkCnt) {
	        this.bkCnt = bkCnt;
	    }

	    public String getBkMenu() {
	        return bkMenu;
	    }

	    public void setBkMenu(String bkMenu) {
	        this.bkMenu = bkMenu;
	    }

	    public String getCofirmYn() {
	        return cofirmYn;
	    }

	    public void setCofirmYn(String cofirmYn) {
	        this.cofirmYn = cofirmYn;
	    }

	    public int getBkTblCnt() {
	        return bkTblCnt;
	    }

	    public void setBkTblCnt(int bkTblCnt) {
	        this.bkTblCnt = bkTblCnt;
	    }

	    public int getStoreNo() {
	        return storeNo;
	    }

	    public void setStoreNo(int storeNo) {
	        this.storeNo = storeNo;
	    }
}
