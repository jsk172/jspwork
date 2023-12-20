package notice;
import java.io.Serializable;
import java.sql.Timestamp;

public class NBoard implements Serializable{

	private static final long serialVersionUID = 123L;
	
	   private int nno;
	   private String ntitle;
	   private String ncontent;
	   private String nfilename;
	   private Timestamp ndate;
	   private Timestamp nupdate;
	   private int nhit;
	   private String id;
	   
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNfilename() {
		return nfilename;
	}
	public void setNfilename(String nfilename) {
		this.nfilename = nfilename;
	}
	public Timestamp getNdate() {
		return ndate;
	}
	public void setNdate(Timestamp ndate) {
		this.ndate = ndate;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getNupdate() {
		return nupdate;
	}
	public void setNupdate(Timestamp nupdate) {
		this.nupdate = nupdate;
	}
}