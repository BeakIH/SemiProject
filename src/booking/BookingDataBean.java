package booking;

import java.sql.Timestamp;

public class BookingDataBean {
	// �����ڸ���Ʈ ������Ȳ


	    // �����ȣ �����ȣ
	    private int bkNo;

	    //  ����ȣ
	    private int wtNo;

	    //  ����Ȯ�δ����
	    private int empNo;

	    // ����ȸ����ȣ ����ȸ����ȣ
	    private int memNo;

	    // ȸ���� �����ڸ�
	    private String memNm;

	    //  �����ڿ���ó
	    private String memTel;

	    // ������� ��������
	    private String storeNm;

	    // �����Ͻ� �����Ͻ�
	    private Timestamp bkDate;

	    // �����ο� �����ο�
	    private String bkCnt;

	    //  ����޴�
	    private String bkMenu;

	    // ����Ȯ�ο��� ����Ȯ�ο���
	    private String cofirmYn;

	    //  ������¸�
	    private String bkStatus;

	    //  �������̺��
	    private int bkTblCnt;

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

	    public Timestamp getBkDate() {
	        return bkDate;
	    }

	    public void setBkDate(Timestamp bkDate) {
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

	    public String getBkStatus() {
	        return bkStatus;
	    }

	    public void setBkStatus(String bkStatus) {
	        this.bkStatus = bkStatus;
	    }

	    public int getBkTblCnt() {
	        return bkTblCnt;
	    }

	    public void setBkTblCnt(int bkTblCnt) {
	        this.bkTblCnt = bkTblCnt;
	    }

	    
	
}
