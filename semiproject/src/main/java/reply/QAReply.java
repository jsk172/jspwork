package reply;

import java.io.Serializable;
import java.sql.Timestamp;

public class QAReply implements Serializable{

	private static final long serialVersionUID = 155L;
	
	private int qreno;
	private int qno;
	private String recontent;
	private String replyer;
	private Timestamp redate;
	private Timestamp reupdate;
	
	public int getQreno() {
		return qreno;
	}
	public void setQreno(int qreno) {
		this.qreno = qreno;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
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
