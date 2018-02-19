package reserve;

import java.util.List;

import reserve.MenuDataBean;

public class StoreDataBean {
	private int store_no;
	private int emp_no;
	private String cate_nm;
	private String store_nm;
	private String store_owner;
	private String store_octime;
	private String store_info;
	private String store_dinfo;
	private String store_floor;
	private String store_tel;
	private int tot_tbl_cnt;
	private int avl_tbl_cnt;
	private int cur_tbl_cnt;
	private String store_uri;
	private String simg_root;
	private String pimg_root;
	private int store_avgsal;
	private int store_score;
	private List<MenuDataBean> menuList;
//	private int menu_no;
//	private String menu_nm1;
//	private String menu_nm2;
//	private int menu_nm1_sal;
//	private int menu_nm2_sal;
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	public String getStore_nm() {
		return store_nm;
	}
	public void setStore_nm(String store_nm) {
		this.store_nm = store_nm;
	}
	public String getStore_owner() {
		return store_owner;
	}
	public void setStore_owner(String store_owner) {
		this.store_owner = store_owner;
	}
	public String getStore_octime() {
		return store_octime;
	}
	public void setStore_octime(String store_octime) {
		this.store_octime = store_octime;
	}
	public String getStore_info() {
		return store_info;
	}
	public void setStore_info(String store_info) {
		this.store_info = store_info;
	}
	public String getStore_dinfo() {
		return store_dinfo;
	}
	public void setStore_dinfo(String store_dinfo) {
		this.store_dinfo = store_dinfo;
	}
	public String getStore_floor() {
		return store_floor;
	}
	public void setStore_floor(String store_floor) {
		this.store_floor = store_floor;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public int getTot_tbl_cnt() {
		return tot_tbl_cnt;
	}
	public void setTot_tbl_cnt(int tot_tbl_cnt) {
		this.tot_tbl_cnt = tot_tbl_cnt;
	}
	public int getAvl_tbl_cnt() {
		return avl_tbl_cnt;
	}
	public void setAvl_tbl_cnt(int avl_tbl_cnt) {
		this.avl_tbl_cnt = avl_tbl_cnt;
	}
	public int getCur_tbl_cnt() {
		return cur_tbl_cnt;
	}
	public void setCur_tbl_cnt(int cur_tbl_cnt) {
		this.cur_tbl_cnt = cur_tbl_cnt;
	}
	public String getStore_uri() {
		return store_uri;
	}
	public void setStore_uri(String store_uri) {
		this.store_uri = store_uri;
	}
	public String getSimg_root() {
		return simg_root;
	}
	public void setSimg_root(String simg_root) {
		this.simg_root = simg_root;
	}
	public String getPimg_root() {
		return pimg_root;
	}
	public void setPimg_root(String pimg_root) {
		this.pimg_root = pimg_root;
	}
	public int getStore_avgsal() {
		return store_avgsal;
	}
	public void setStore_avgsal(int store_avgsal) {
		this.store_avgsal = store_avgsal;
	}
	public int getStore_score() {
		return store_score;
	}
	public void setStore_score(int store_score) {
		this.store_score = store_score;
	}
	public List<MenuDataBean> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<MenuDataBean> menuList) {
		this.menuList = menuList;
	}
	
	
	
}
