package product;

import java.io.Serializable;

public class ProductVO implements Serializable{
	
	private static final long serialVersionUID = 103L;
	
	private int pno;
	private String pname;
	private int price;
	private int p_score; //평점
	private int sal_num; //판매량
	private String pcontent;
	private String pfilename;
	private String category;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getP_score() {
		return p_score;
	}
	public void setP_score(int p_score) {
		this.p_score = p_score;
	}
	public int getSal_num() {
		return sal_num;
	}
	public void setSal_num(int sal_num) {
		this.sal_num = sal_num;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPfilename() {
		return pfilename;
	}
	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}
