package reply;

import java.io.Serializable;
import java.sql.Timestamp;

public class RVReply implements Serializable{

	private static final long serialVersionUID = 167L;
	
	private int rvrno;
	private int rno;
	private String recontent;
	private String replyer;
	private Timestamp redate;
	private Timestamp reupdate;
	
	public int getRvrno() {
		return rvrno;
	}
	public void setRvrno(int rvrno) {
		this.rvrno = rvrno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Timestamp getRedate() {
		return redate;
	}
	public void setRedate(Timestamp redate) {
		this.redate = redate;
	}
	public Timestamp getReupdate() {
		return reupdate;
	}
	public void setReupdate(Timestamp reupdate) {
		this.reupdate = reupdate;
	}
}
