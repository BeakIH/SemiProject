package emp;

//직원관리 직원현황
public class EmpDataBean {

	    private int empNo; // 사원번호 직원번호
	    private String empNm; // 사원명 직원명
	    private int storeNo; // 소속 소속매장번호
	    private String position; // 직위 직위
	    private String admYn; // 관리자권한 관리자권한유무
	    private String empStatus; //  재직상태
	    private String admId; //  관리자계정ID
	    private String admPw; //  관리자계정PW
		
	    public int getEmpNo() {
			return empNo;
		}
		public void setEmpNo(int empNo) {
			this.empNo = empNo;
		}
		public String getEmpNm() {
			return empNm;
		}
		public void setEmpNm(String empNm) {
			this.empNm = empNm;
		}
		public int getStoreNo() {
			return storeNo;
		}
		public void setStoreNo(int storeNo) {
			this.storeNo = storeNo;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public String getAdmYn() {
			return admYn;
		}
		public void setAdmYn(String admYn) {
			this.admYn = admYn;
		}
		public String getEmpStatus() {
			return empStatus;
		}
		public void setEmpStatus(String empStatus) {
			this.empStatus = empStatus;
		}
		public String getAdmId() {
			return admId;
		}
		public void setAdmId(String admId) {
			this.admId = admId;
		}
		public String getAdmPw() {
			return admPw;
		}
		public void setAdmPw(String admPw) {
			this.admPw = admPw;
		}

}
