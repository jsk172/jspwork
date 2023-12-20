package voter;

import java.io.Serializable;

public class Voter implements Serializable{

	private static final long serialVersionUID = 17L;
	
	private int vno;
	private int bno;
	private String mid;
	
	
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
}
