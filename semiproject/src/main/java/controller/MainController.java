package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cart.CartDAO;
import cart.CartVO;
import member.MemberDAO;
import member.MemberVO;
import notice.NBoard;
import notice.NoticeBoardDAO;
import product.ProductDAO;
import product.ProductVO;
import purchasehistory.PurchaseHistoryDAO;
import purchasehistory.PurchaseHistoryDTO;
import purchasehistory.PurchaseHistoryVO;
import qa.QABoard;
import qa.QABoardDAO;
import reply.QAReply;
import reply.QAReplyDAO;
import review.RBoard;
import review.ReviewBoardDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//필드
	MemberDAO mDAO;
	ProductDAO pDAO;
	CartDAO cDAO;
	PurchaseHistoryDAO phDAO;
	NoticeBoardDAO nDAO;
	QABoardDAO qDAO;
	QAReplyDAO qrDAO;
	ReviewBoardDAO rDAO;

	public MainController() {
		mDAO = new MemberDAO();
		pDAO = new ProductDAO();
		cDAO = new CartDAO();
		phDAO = new PurchaseHistoryDAO();
		nDAO = new NoticeBoardDAO();
		qDAO = new QABoardDAO();
		rDAO = new ReviewBoardDAO();
		qrDAO = new QAReplyDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		//응답할 컨텐츠 유형
		response.setContentType("text/html; charset=utf-8");

		//경로 설정
		//uri - 컨텍스트(/) 파일(.do)
		String uri = request.getRequestURI();
		System.out.println(uri);
		//command 패턴
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);

		String nextPage = "";
		//세션 객체 생성
		HttpSession session = request.getSession();

		//view에 출력 객체 생성
		PrintWriter out = response.getWriter();

		//회원
		if(command.equals("/joinform.do")) {
			nextPage = "/member/joinform.jsp";
		}else if(command.equals("/insertmember.do")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String zip_code = request.getParameter("zip_code");
			String address = request.getParameter("address");
			String detailaddress = request.getParameter("detailaddress");

			MemberVO m = new MemberVO();
			m.setId(id);
			m.setPasswd(passwd);
			m.setName(name);
			m.setEmail(email);
			m.setPhone(phone);
			m.setZip_code(zip_code);
			m.setAddress(address);
			m.setDetailaddress(detailaddress);
			mDAO.insertMember(m);
			
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", name);

			nextPage = "/member/join3.jsp";
		}else if(command.equals("/loginform.do")){
			nextPage = "/member/loginform.jsp";
		}else if(command.equals("/login.do")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");

			MemberVO m = new MemberVO();
			m.setId(id);
			m.setPasswd(passwd);

			MemberVO member = mDAO.checkLogin(m);
			String name = member.getName();

			if(name != null) {
				session.setAttribute("sessionId", id);
				session.setAttribute("sessionName", name);

				nextPage = "/main.jsp";
			}else {
				String error = "아이디나 비밀번호를 확인해주세요.";
				request.setAttribute("error", error);
				//에러 발생 후 페이지 이동
				nextPage = "/member/loginform.jsp";
			}
		}else if(command.equals("/logout.do")) {
			session.invalidate(); //세션삭제
			nextPage = "/main.jsp";
		}else if (command.equals("/memberview.do")) {
			String id =request.getParameter("id");

			MemberVO member = mDAO.getMember(id);

			request.setAttribute("member", member);

			nextPage = "/member/memberview.jsp";
		}else if (command.equals("/memberlist.do")) {

			List<MemberVO> memberList = mDAO.getMemberList();

			request.setAttribute("memberList", memberList);

			nextPage = "/member/memberlist.jsp";
		}else if(command.equals("/updatemember.do")) {
		//회원 정보 수정 데이터 받기
		MemberVO m = new MemberVO();		
		
		String id = (String)session.getAttribute("sessionId");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zip_code = request.getParameter("zip_code");
		String address = request.getParameter("address");
		String detailaddress = request.getParameter("detailaddress");
		
		m.setPasswd(passwd);
		m.setEmail(email);
		m.setPhone(phone);
		m.setZip_code(zip_code);
		m.setAddress(address);
		m.setDetailaddress(detailaddress);
		
		mDAO.updateMember(id, m);
		
		nextPage="/main.jsp";

		}
		else if (command.equals("/deletemember.do")) {
			String id = request.getParameter("id");
			mDAO.deletemember(id);

			nextPage = "/main.jsp";
		} else if (command.equals("/join1.do")) {
			nextPage = "/member/join1.jsp";
		} else if (command.equals("/join2.do")) {
			nextPage = "/member/join2.jsp";
		}

		//상품
		else if(command.equals("/productlist.do")) {
//			List<ProductVO> productList = pDAO.getProductList();
			List<ProductVO> dList = pDAO.getCategoryList("강아지");
			List<ProductVO> cList = pDAO.getCategoryList("고양이");
			List<ProductVO> hList = pDAO.getCategoryList("햄스터");
			List<ProductVO> eList = pDAO.getCategoryList("이벤트");
			
			request.setAttribute("dList", dList);
			request.setAttribute("cList", cList);
			request.setAttribute("hList", hList);
			request.setAttribute("eList", eList);
			
			nextPage = "/product/productlist.jsp";
		}else if(command.equals("/productview.do")) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			ProductVO productList = pDAO.getProductVO(pno);
			request.setAttribute("productlist", productList);

			nextPage = "/product/productview.jsp";
		}else if(command.equals("/productmanagement.do")) {
			List<ProductVO> productList = pDAO.getProductList();
			request.setAttribute("productList", productList);
			nextPage = "/product/productmanagement.jsp";

		}else if(command.equals("/deleteproduct.do")) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			pDAO.deleteproduct(pno);

			nextPage = "/productmanagement.do";

		}else if(command.equals("/updateform.do")) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			ProductVO product = pDAO.getProductVO(pno);
			request.setAttribute("product", product);

			nextPage = "/product/updateform.jsp";
		}else if(command.equals("/update.do")) {
			String realFolder ="C:\\jspworks\\semiproject\\src\\main\\webapp\\fileupload";
			int maxSize = 10*1024*1024; //10MB
			String encType = "utf-8";   //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);

			//폼 일반 속성 데이터 받기
			int pno = Integer.parseInt(multi.getParameter("pno"));
			String pname = multi.getParameter("pname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String pcontent = multi.getParameter("pcontent");
			String category = multi.getParameter("category");

			//file 속성
			Enumeration<?> files = multi.getFileNames();
			String pfilename = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement();

				//실제 파일 이름
				pfilename = multi.getFilesystemName(userFilename);
			}

			//db에 저장
			ProductVO p = new ProductVO();
			p.setPno(pno);
			p.setPname(pname);
			p.setPrice(price);
			p.setPcontent(pcontent);
			p.setCategory(category);
			p.setPfilename(pfilename);

			pDAO.updateproduct(p);

			nextPage = "/productmanagement.do";
		}else if(command.equals("/categorylist.do")) {
			System.out.println(request.getParameter("category"));
			List<ProductVO> p = pDAO.getCategoryList(request.getParameter("category"));

			request.setAttribute("categoryList", p);

			nextPage = "/product/categorylist.jsp";
		}else if(command.equals("/insertproduct.do")) {
			String realFolder ="C:\\jspworks\\semiproject\\src\\main\\webapp\\fileupload";
			int maxSize = 10*1024*1024; //10MB
			String encType = "utf-8";   //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);

			//폼 일반 속성 데이터 받기
			String pname = multi.getParameter("pname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String pcontent = multi.getParameter("pcontent");
			String category = multi.getParameter("category");

			//file 속성
			Enumeration<?> files = multi.getFileNames();
			String pfilename = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement();

				//실제 파일 이름
				pfilename = multi.getFilesystemName(userFilename);
			}

			//db에 저장
			ProductVO p = new ProductVO();
			p.setPname(pname);
			p.setPrice(price);
			p.setPcontent(pcontent);
			p.setCategory(category);
			p.setPfilename(pfilename);

			//write매서드 실행
			pDAO.insertProduct(p);

			nextPage = "/productmanagement.do";
		}

		//주문&장바구니
		else if(command.equals("/orders.do")) {
			request.setAttribute("member", mDAO.getMember(String.valueOf(session.getAttribute("sessionId"))));
			if (request.getParameter("pno") != null) {
				request.setAttribute("product", pDAO.getProductVO(Integer.parseInt(request.getParameter("pno"))));
			} else {
				List<ProductVO> cartList = cDAO.getCartList(String.valueOf(session.getAttribute("sessionId")));
				request.setAttribute("cartlist", cartList);
			}
			
			nextPage = "/orders/orders.jsp";
		}else if(command.equals("/cart.do")) {
			List<ProductVO> cartList = cDAO.getCartList(String.valueOf(session.getAttribute("sessionId")));
			request.setAttribute("cartlist", cartList);
			request.setAttribute("member", mDAO.getMember(String.valueOf(session.getAttribute("sessionId"))));
			request.setAttribute("product", pDAO.getProductVO(Integer.parseInt(request.getParameter("pno"))));

			int cnt = Integer.parseInt(request.getParameter("cnt"));
			int pno = Integer.parseInt(request.getParameter("pno"));
			String id = String.valueOf(session.getAttribute("sessionId"));

			CartVO c = new CartVO();
			c.setCnt(cnt);
			c.setPno(pno);
			c.setId(id);

			cDAO.insertCart(c);

			nextPage = "/orders/cart.jsp";
		}else if(command.equals("/basket.do")) {
			List<ProductVO> cartList = cDAO.getCartList(String.valueOf(session.getAttribute("sessionId")));
			
			request.setAttribute("member", mDAO.getMember(String.valueOf(session.getAttribute("sessionId"))));
			request.setAttribute("cartlist", cartList);
			nextPage = "/orders/cart.jsp";
		}

		//구매내역
		else if(command.equals("/purchasehistory.do")) {
			List<PurchaseHistoryDTO> historyList = phDAO.getHistoryList2(String.valueOf(session.getAttribute("sessionId")));
			String id = String.valueOf(session.getAttribute("sessionId"));
			
			request.setAttribute("purchasehistorylist", historyList);
			nextPage = "/orders/purchasehistory.jsp";
		}
		//구매완료
		else if(command.equals("/purchaseconfirm.do")) {
			String id = String.valueOf(session.getAttribute("sessionId"));
			
			if (request.getParameter("pno") != null) {
				request.setAttribute("product", pDAO.getProductVO(Integer.parseInt(request.getParameter("pno"))));

				PurchaseHistoryVO ph = new PurchaseHistoryVO();
				ph.setId(id);
				ph.setPcnt(1);
				ph.setPno(Integer.parseInt(request.getParameter("pno")));
				
				phDAO.insertPurchaseHistory(ph);
			} else {
				List<CartVO> cartList2 = cDAO.getCartList2(String.valueOf(session.getAttribute("sessionId")));

				for(int i=0; i<cartList2.size(); i++) {
					CartVO cart = cartList2.get(i);
					
					PurchaseHistoryVO ph = new PurchaseHistoryVO();
					ph.setId(id);
					ph.setPcnt(cart.getCnt());
					ph.setPno(cart.getPno());
					
					phDAO.insertPurchaseHistory(ph);
				}
				
				cDAO.deletecart(id);
			}
			
			nextPage = "/orders/purchaseconfirm.jsp";
		}



		//게시판
				if(command.equals("/boardlist.do")) {				//전체 게시판 페이지
					List<NBoard> nb = nDAO.getNBoardList();
					List<QABoard> qab = qDAO.getQABoardList();
					List<RBoard> rb = rDAO.getRBoardList();
					request.setAttribute("nboardList", nb);
					request.setAttribute("qabboardList", qab); 
					request.setAttribute("rboardList", rb);
					
					if(nb.size() >= 4) {
						NBoard[] newNBoard = {nb.get(0), nb.get(1), nb.get(2), nb.get(3)};
						request.setAttribute("nboardList", newNBoard);
					}
					if(qab.size() >= 4) {
						QABoard[] newQABoard = {qab.get(0), qab.get(1), qab.get(2), qab.get(3)};
						request.setAttribute("qaboardList", newQABoard);
					}
					if(rb.size() >= 4) {
						RBoard[] newRBoard = {rb.get(0), rb.get(1), rb.get(2), rb.get(3)};
						request.setAttribute("rboardList", newRBoard);
					}
					nextPage = "/board/boardlist.jsp";
				}else if(command.equals("/noticeboardlist.do")) {	//공지사항 게시판 목록
					String pageNum = request.getParameter("pageNum");
					if(pageNum == null) {
						pageNum = "1";
					}
					
					int currentPage = Integer.parseInt(pageNum);
					int pageSize = 10;
					int startRow = (currentPage - 1) * pageSize + 1;
					
					int startPage = startRow / pageSize + 1;
					int totalRow = nDAO.getNBoardCount();
					int endPage = totalRow / pageSize;
					
					endPage = (totalRow % pageSize == 0) ? endPage : endPage + 1;
					
					List<NBoard> nb = nDAO.getNBoardList(currentPage);
					
					request.setAttribute("nboardList", nb);
					request.setAttribute("endPage", endPage);
					
					nextPage = "/board/noticeboardlist.jsp";
				}else if(command.equals("/qaboardlist.do")) {		//Q&A 게시판 목록
					String pageNum = request.getParameter("pageNum");
					if(pageNum == null) {
						pageNum = "1";
					}
					
					int currentPage = Integer.parseInt(pageNum);
					int pageSize = 20;
					int startRow = (currentPage - 1) * pageSize + 1;
					
					int startPage = startRow / pageSize + 1;
					int totalRow = qDAO.getQABoardCount();
					int endPage = totalRow / pageSize;
					
					endPage = (totalRow % pageSize == 0) ? endPage : endPage + 1;
					
					//검색 처리
					String _field = request.getParameter("field");
					String _kw = request.getParameter("kw");
					
					String field = "";
					String kw = "";
					
					//null 처리
					if(_field != null) { //필드값이 있는 경우
						field = _field;
					}else {	//필드값이 없는 경우(디폴트)
						field = "qtitle";
					}
					
					if(_kw != null) { //검색어가 있는 경우
						kw = _kw;
					}else { //검색어가 없는 경우
						kw = ""; 
					}
					
					//페이지 처리 메서드 호출
					//List<RBoard> rb = rDAO.getRBoardList(currentPage);
					List<QABoard> qaboardList = qDAO.getQABoardList(field, kw, currentPage);
					
					//모델로 생성
					request.setAttribute("qaboardList", qaboardList);
					request.setAttribute("page", currentPage);	  //현재 페이지
					request.setAttribute("startPage", startPage); //시작 페이지
					request.setAttribute("endPage", endPage);	  //종료 페이지
					request.setAttribute("field", field);		//필드
					request.setAttribute("kw", kw);
					
					
					
					nextPage = "/board/qaboardlist.jsp";
				}else if(command.equals("/reviewboardlist.do")) {	//리뷰 게시판 목록
					String pageNum = request.getParameter("pageNum");
					if(pageNum == null) {
						pageNum = "1";
					}
					
					int currentPage = Integer.parseInt(pageNum);
					int pageSize = 20;
					int startRow = (currentPage - 1) * pageSize + 1;
					
					int startPage = startRow / pageSize + 1;
					int totalRow = rDAO.getRBoardCount();
					int endPage = totalRow / pageSize;
					
					endPage = (totalRow % pageSize == 0) ? endPage : endPage + 1;
					
					//검색 처리
					String _field = request.getParameter("field");
					String _kw = request.getParameter("kw");
					
					String field = "";
					String kw = "";
					
					//null 처리
					if(_field != null) { //필드값이 있는 경우
						field = _field;
					}else {	//필드값이 없는 경우(디폴트)
						field = "rtitle";
					}
					
					if(_kw != null) { //검색어가 있는 경우
						kw = _kw;
					}else { //검색어가 없는 경우
						kw = ""; 
					}
					
					//페이지 처리 메서드 호출
					//List<RBoard> rb = rDAO.getRBoardList(currentPage);
					List<RBoard> rboardList = rDAO.getRBoardList(field, kw, currentPage);
					
					//모델로 생성
					request.setAttribute("rboardList", rboardList);
					request.setAttribute("page", currentPage);	  //현재 페이지
					request.setAttribute("startPage", startPage); //시작 페이지
					request.setAttribute("endPage", endPage);	  //종료 페이지
					request.setAttribute("field", field);		//필드
					request.setAttribute("kw", kw);
					
					nextPage = "/board/reviewboardlist.jsp";
				}else if(command.equals("/noticewriteform.do")) {	//공지사항 글쓰기 페이지
					
					nextPage = "/board/noticewriteform.jsp";
				}else if(command.equals("/noticewrite.do")) {		//공지사항 글쓰기 처리영역
					String ntitle = request.getParameter("ntitle");
					String ncontent = request.getParameter("ncontent");
					//세션 가져오기
					//String id = (String)session.getAttribute("sessionId");

					//db에 저장
					NBoard nb = new NBoard();
					nb.setNtitle(ntitle);
					nb.setNcontent(ncontent);

					nDAO.nWrite(nb);

					nextPage = "/noticeboardlist.do";
				}else if(command.equals("/noticeboardview.do")) {		//공지사항 글 상세보기
					int nno = Integer.parseInt(request.getParameter("nno"));
					
					NBoard nboard = nDAO.getNBoard(nno);
					
					request.setAttribute("nboard", nboard);
					
					//nextPage = "/board/noticeboardview.jsp";
				}else if(command.equals("/qawriteform.do")) {			//Q&A 글쓰기 페이지
					
					nextPage = "/board/qawriteform.jsp";
				}else if(command.equals("/qaboardwrite.do")) {			//Q&A 글쓰기 처리영역
					String realFolder = "C:\\jspworks\\semiproject\\src\\main\\webapp\\fileupload";
					int maxSize = 10*1024*1024;	//10MB
					String encType = "UTF-8";	//파일이름 한글 인코딩
					DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
					
					//5가지 인자
					MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);
					
					String qtitle = multi.getParameter("qtitle");
					String qcontent = multi.getParameter("qcontent");
					//세션 가져오기
					String id = (String)session.getAttribute("sessionId");
					String qfilename = "";
					Enumeration<?> files = multi.getFileNames();
					
					while(files.hasMoreElements()) {	//파일이름이 있는동안 반복
						String userFilename =  (String)files.nextElement();
			
						//실제 저장될 이름
						qfilename = multi.getFilesystemName(userFilename);
					}
					
					//db에 저장
					QABoard qab = new QABoard();
					qab.setQtitle(qtitle);
					qab.setQcontent(qcontent);
					qab.setQfilename(qfilename);
					qab.setId(id);

					qDAO.qaWrite(qab);
					
					nextPage = "/qaboardlist.do";
				}else if(command.equals("/qaboardview.do")) {			//Q&A 글 상세보기
					//글 제목에서 글 번호 받기
					int qno = Integer.parseInt(request.getParameter("qno"));
					//글 상세보기 처리
					QABoard qab = qDAO.getQABoard(qno);
					
					List<QAReply> qareplyList = qrDAO.getQAReplyList(qno);
					
					//모델 생성후 뷰페이지로 보내기
					request.setAttribute("qab", qab);
					request.setAttribute("qareplyList", qareplyList);
					
					nextPage = "/board/qaboardview.jsp";
				}else if(command.equals("/deleteqaboard.do")) {
					int qno = Integer.parseInt(request.getParameter("qno"));
					
					//삭제 처리 메서드 실행
					qDAO.deleteQABoard(qno);
					
					nextPage = "/qaboardlist.do";
				}else if(command.equals("/updateqaboardform.do")) {
					int qno = Integer.parseInt(request.getParameter("qno"));
					//글 상세보기 처리
					QABoard qab = qDAO.getQABoard(qno);
					//모델 생성후 뷰페이지로 보내기
					request.setAttribute("qab", qab);
					
					nextPage = "/board/updateqaboardform.jsp";
				}else if(command.equals("/updateqaboard.do")) {
					String qtitle = request.getParameter("qtitle");
					String qcontent = request.getParameter("qcontent");
					int qno = Integer.parseInt(request.getParameter("qno"));
					
					QABoard qab = new QABoard();
					qab.setQtitle(qtitle);
					qab.setQcontent(qcontent);
					qab.setQno(qno);
					
					qDAO.updateQABoard(qab);
					
					//nextPage = "/qaboardlist.do";
				}else if(command.equals("/reviewwriteform.do")) {
					
					nextPage = "/board/reviewwriteform.jsp";
				}else if(command.equals("/reviewwrite.do")) {
					String realFolder = "C:\\jspworks\\semiproject\\src\\main\\webapp\\fileupload";
					int maxSize = 10*1024*1024;	//10MB
					String encType = "UTF-8";	//파일이름 한글 인코딩
					DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
					
					//5가지 인자
					MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);
					
					String rtitle = multi.getParameter("rtitle");
					String rcontent = multi.getParameter("rcontent");
					
					String id = (String)session.getAttribute("sessionId");
					String rfilename = "";
					Enumeration<?> files = multi.getFileNames();
					
					while(files.hasMoreElements()) {	//파일이름이 있는동안 반복
						String userFilename =  (String)files.nextElement();
			
						//실제 저장될 이름
						rfilename = multi.getFilesystemName(userFilename);
					}
					
					RBoard rb = new RBoard();
					rb.setRtitle(rtitle);
					rb.setRcontent(rcontent);
					rb.setRfilename(rfilename);
					rb.setId(id);
					
					rDAO.rWrite(rb);
					
					nextPage = "/reviewboardlist.do";
				}else if(command.equals("/reviewboardview.do")) {
					int rno = Integer.parseInt(request.getParameter("rno"));
					RBoard rb = rDAO.getRBoard(rno);
					
					request.setAttribute("rboardList", rb);
					
					nextPage = "/board/reviewboardview.jsp";
				}else if(command.equals("/updatereviewboardform.do")) {
					int rno = Integer.parseInt(request.getParameter("rno"));
					RBoard rb = rDAO.getRBoard(rno);
					
					request.setAttribute("rboardList", rb);
					
					nextPage = "/board/updatereviewboardform.jsp";
				}else if(command.equals("/updatereviewboard.do")) {
					String rtitle = request.getParameter("rtitle");
					String rcontent = request.getParameter("rcontent");
					int rno = Integer.parseInt(request.getParameter("rno"));
					
					RBoard rb = new RBoard();
					rb.setRtitle(rtitle);
					rb.setRcontent(rcontent);
					rb.setRno(rno);
					
					rDAO.updateRBoard(rb);
					
					nextPage = "/reviewboardlist.do";
				}else if(command.equals("/deletereviewboard.do")) {
					
					int rno = Integer.parseInt(request.getParameter("rno"));
					
					rDAO.deleteRBoard(rno);
					
					nextPage = "/reviewboardlist.do";
				}
				
				//댓글
				if(command.equals("/insertqareply.do")) {
					int qno = Integer.parseInt(request.getParameter("qno"));
					String recontent = request.getParameter("recontent");
					String replyer = request.getParameter("replyer");
					
					QAReply qr = new QAReply();
					qr.setQno(qno);
					qr.setRecontent(recontent);
					qr.setReplyer(replyer);
					
					qrDAO.insertQAReply(qr);
				}else if(command.equals("/deleteqareply.do")) {
					int qreno = Integer.parseInt(request.getParameter("qreno"));
					
					qrDAO.deleteQAReply(qreno);
				}
				


		//redirect와 forward 구분하기
		if (command.equals("/insertproduct.do") || command.equals("/deleteproduct.do") || command.equals("/update.do")) {
			response.sendRedirect("/productmanagement.do");
		}else if(command.equals("/cart.do")) {
			String pno = request.getParameter("pno");
			response.sendRedirect("/orders.do?pno=" + pno);
		}
		else {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}

	}

}