package purchasehistory;

import java.io.Serializable;
import java.sql.Timestamp;

public class PurchaseHistoryVO implements Serializable{

	private static final long serialVersionUID = 123L;
	
	private int phno;
	private Timestamp pdate;
	private int pcnt;
	private String id;
	private int pno;
	
	
	
	public int getPhno() {
		return phno;
	}
	public void setPhno(int phno) {
		this.phno = phno;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	

}
