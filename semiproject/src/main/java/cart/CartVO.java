package cart;

import java.io.Serializable;
import java.sql.Timestamp;

public class CartVO implements Serializable{

	private static final long serialVersionUID = 120L;
	
	private int cartnum;
	private int cnt;
	private Timestamp cartDate;
	private int pno;
	private String id;
	
	
	public int getCartnum() {
		return cartnum;
	}
	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getCartDate() {
		return cartDate;
	}
	public void setCartDate(Timestamp cartDate) {
		this.cartDate = cartDate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
