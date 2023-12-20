package qa;

import java.io.Serializable;
import java.sql.Timestamp;

public class QABoard implements Serializable{

	private static final long serialVersionUID = 124L;

	private int qno;
	private String qtitle;
	private String qcontent;
	private String qname;
	private String qfilename;
	private Timestamp qdate;
	private Timestamp qupdate;
	private int qhit;
	private String id;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public String getQfilename() {
		return qfilename;
	}
	public void setQfilename(String qfilename) {
		this.qfilename = qfilename;
	}
	public Timestamp getQdate() {
		return qdate;
	}
	public void setQdate(Timestamp qdate) {
		this.qdate = qdate;
	}
	public int getQhit() {
		return qhit;
	}
	public void setQhit(int qhit) {
		this.qhit = qhit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getQupdate() {
		return qupdate;
	}
	public void setQupdate(Timestamp qupdate) {
		this.qupdate = qupdate;
	}
}
