package jsp.member.model;
 
/*import java.sql.Timestamp;*/
 
 
// 데이터의 전달을 담당하는 클래스 - DTO
public class MemberBean 
{
	
	private int mem_no;
	private String mem_nm;
	private String mem_id;            
    private String mem_pw;    
    private String mem_tel;       
    private String address;       
    private String email;       
    private String email_yn;        
    private String fvrt_str_1;      
    private String fvrt_str_2;
    
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_yn() {
		return email_yn;
	}
	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}
	public String getFvrt_str_1() {
		return fvrt_str_1;
	}
	public void setFvrt_str_1(String fvrt_str_1) {
		this.fvrt_str_1 = fvrt_str_1;
	}
	public String getFvrt_str_2() {
		return fvrt_str_2;
	}
	public void setFvrt_str_2(String fvrt_str_2) {
		this.fvrt_str_2 = fvrt_str_2;
	}
    
    
}
 
