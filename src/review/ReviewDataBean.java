package review;

public class ReviewDataBean {
	// ���� �� �� �� �̿��ı���� �̿���� ���� �� �� �̿��ı�

	    // 리뷰글 번호
	    private int rvno;

	    //  매장 번호
	    private int storeno;

	    // 회원명
	    private String memnm;

	    // 매장명
	    private String storenm;

	    // 방문일자
	    private String visitdate;

	    // 리뷰글 제목
	    private String rvtitle;
	    // 리뷰 내용
	    
	    private String rvcontent;

	    // 좋아요
	    private int likecnt;

	    // 조회수
	    private int rviewcnt;

		public int getRvno() {
			return rvno;
		}

		public void setRvno(int rvno) {
			this.rvno = rvno;
		}

		public int getStoreno() {
			return storeno;
		}

		public void setStoreno(int storeno) {
			this.storeno = storeno;
		}

		public String getMemnm() {
			return memnm;
		}

		public void setMemnm(String memnm) {
			this.memnm = memnm;
		}

		public String getStorenm() {
			return storenm;
		}

		public void setStorenm(String storenm) {
			this.storenm = storenm;
		}

		public String getVisitdate() {
			return visitdate;
		}

		public void setVisitdate(String visitdate) {
			this.visitdate = visitdate;
		}

		public String getRvtitle() {
			return rvtitle;
		}

		public void setRvtitle(String rvtitle) {
			this.rvtitle = rvtitle;
		}

		public String getRvcontent() {
			return rvcontent;
		}

		public void setRvcontent(String rvcontent) {
			this.rvcontent = rvcontent;
		}

		public int getLikecnt() {
			return likecnt;
		}

		public void setLikecnt(int likecnt) {
			this.likecnt = likecnt;
		}

		public int getRviewcnt() {
			return rviewcnt;
		}

		public void setRviewcnt(int rviewcnt) {
			this.rviewcnt = rviewcnt;
		}

	    


}
