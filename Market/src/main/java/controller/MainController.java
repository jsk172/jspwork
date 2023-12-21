package controller;

import java.io.IOException;
import java.util.ArrayList;
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

import lombok.Setter;
import model.Product;
import model.ProductDAO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO pdao;
       
    public MainController() {
    	pdao = new ProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		//command 패턴 경로 설정
		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		String nextPage = "";
		
		HttpSession session = request.getSession();
		
		if(command.equals("/main.do")) {
			nextPage = "/main.jsp";
		}else if(command.equals("/productlist.do")) {
			//목록 보기 매서드 호출
			List<Product> productList = pdao.getProductList();
			
			//모델 생성하기
			request.setAttribute("products", productList);
			nextPage = "/product/list.jsp";
		}else if(command.equals("/productform.do")) {
			nextPage = "/product/pform.jsp";
		}else if(command.equals("/insertproduct.do")) {
			
			String realFolder ="C:\\jspworks\\Market\\src\\main\\webapp\\upload";
			int maxSize = 10*1024*1024; //10MB
			String encType = "utf-8";   //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);
			
			
			//입력 폼의 데이터 받기
			String pid = multi.getParameter("pid");
			String pname = multi.getParameter("pname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			int pstock = Integer.parseInt(multi.getParameter("pstock"));
			String condition = multi.getParameter("condition");
			
			Enumeration<?> files = multi.getFileNames();
			String pimage = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement();
				
				//실제 파일 이름
				pimage = multi.getFilesystemName(userFilename);
			}
			
			//상품 객체 1개 생성
			Product p = new Product();
			p.setPid(pid);
			p.setPname(pname);
			p.setPrice(price);
			p.setDescription(description);
			p.setCategory(category);
			p.setPstock(pstock);
			p.setCondition(condition);
			p.setPimage(pimage);
			
			//db에 등록할 매서드 호출
			pdao.insertProduct(p);
			
			nextPage = "/productlist.do";
		}else if(command.equals("/productinfo.do")) {
			String pid = request.getParameter("pid");
			//상세보기 매서드 호출
			Product product = pdao.getProduct(pid);
			//모델 생성
			request.setAttribute("product", product);
			
			nextPage = "/product/pinfo.jsp";
		}else if(command.equals("/editproduct.do")) {
			String edit = request.getParameter("edit");
			List<Product> products = pdao.getProductList();
			
			request.setAttribute("products", products);
			request.setAttribute("edit", edit);
			
			nextPage = "/product/edit.jsp";
		}else if(command.equals("/deleteproduct.do")) {
			String pid = request.getParameter("pid");
			//상품삭제
			pdao.deleteProduct(pid);
			
			nextPage = "/editproduct.do?edit=delete";
		}else if(command.equals("/updateform.do")) {
			String pid = request.getParameter("pid");
			//해당 아이디 상품 가져옴
			Product product = pdao.getProduct(pid);
			//모댈 만들기
			request.setAttribute("product", product);
			nextPage = "/product/updateform.jsp";
		}else if(command.equals("/updateproduct.do")) {
			String realFolder ="C:\\jspworks\\Market\\src\\main\\webapp\\upload";
			int maxSize = 10*1024*1024; //10MB
			String encType = "utf-8";   //파일이름 한글 인코딩
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			//5가지 인자
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);
			
			
			//입력 폼의 데이터 받기
			String pid = multi.getParameter("pid");
			String pname = multi.getParameter("pname");
			int price = Integer.parseInt(multi.getParameter("price"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			int pstock = Integer.parseInt(multi.getParameter("pstock"));
			String condition = multi.getParameter("condition");
			
			Enumeration<?> files = multi.getFileNames();
			String pimage = "";
			while(files.hasMoreElements()) { //파일이름이 있는 동안 반복
				String userFilename = (String)files.nextElement();
				
				//실제 파일 이름
				pimage = multi.getFilesystemName(userFilename);
			}
			
			//상품 객체 1개 생성
			Product p = new Product();
			p.setPid(pid);
			p.setPname(pname);
			p.setPrice(price);
			p.setDescription(description);
			p.setCategory(category);
			p.setPstock(pstock);
			p.setCondition(condition);
			p.setPimage(pimage);
			if(pimage != null) {
				pdao.updateProduct(p);
			}else {
				pdao.updateProductNoImage(p);
			}
			
			nextPage = "/editproduct.do?edit=update";
		}else if(command.equals("/addcart.do")) {
			String pid = request.getParameter("pid");
			//상품 목록
			List<Product> goodsList = pdao.getProductList();
			Product goods = new Product();
			//목록에서 추가한 상품 찾기
			for(int i=0; i<goodsList.size(); i++) {
				goods = goodsList.get(i);
				if(goods.getPid().equals(pid)) { //추가한 상품코드와 일치하면
					break;
				}
			}
			//상품 세션 발급
			List<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
			if(list == null) {
				list = new ArrayList();
				session.setAttribute("cartlist", list);
			}
			//요청 아이디에 상품이 가존 장바구니에 있으면 추가
			int cnt = 0; //장바구니의 추가한 횟수
			Product goodsQnt = new Product();
			
			for(int i=0; i<list.size(); i++) {
				goodsQnt = list.get(i);
				if(goodsQnt.getPid().equals(pid)) {
					cnt++;
					goodsQnt.setQuantity(goodsQnt.getQuantity() + 1); //추가 주문된 상품 객체
				}
			}
			
			//기존에 장바구니에 없는 푸목은 수량을 1로 정함
			if(cnt==0) {
				goods.setQuantity(1);
				list.add(goods);
			}
			
			//nextPage = "/productinfo.do?pid=" + pid;
		}else if(command.equals("/cart.do")) {
			//상품 세션 유지
			List<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
			if(cartlist == null) {
				cartlist =  new ArrayList<>();
			}
			
			//합계
			int sum = 0; //총 합계
			int unit_sum = 0; //품목별 합계 = 가격x수량
			
			

			for(int i=0; i<cartlist.size(); i++) {
				Product product = cartlist.get(i); //장바구니에 담긴 품목
				unit_sum = product.getQuantity() * product.getPrice();
				sum += unit_sum;
			}
			//세션아이디 얻기
			String cartId = session.getId();
			
			request.setAttribute("cartId", cartId);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("sum", sum);
			
			nextPage = "/product/cart.jsp";
		}else if(command.equals("/deletecart.do")) {
			//장바구니 품목 전체 삭제(세션 삭제)
			session.invalidate();
		}else if(command.equals("/removecart.do")) {
			String pid = request.getParameter("pid");
			//상품세션 유지
			List<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
			//장바구니에서 해당품목을 찾아서 삭제 
			for(int i=0; i<cartlist.size(); i++) {
				Product product = cartlist.get(i);
				if(product.getPid().equals(pid)) {
					cartlist.remove(product); //어레이리스트 삭제 매서드
				}
			}
		}else if(command.equals("/shippingform.do")) {
			
			nextPage="/product/shippingform.jsp";
		}

		
		if(command.equals("/insertproduct.do")) {
			response.sendRedirect("/productlist.do");
		}else if(command.equals("/deletecart.do") || command.equals("/removecart.do")) {
			response.sendRedirect("/cart.do");
		}else if(command.equals("/addcart.do")) {
			String pid = request.getParameter("pid");
			response.sendRedirect("/productinfo.do?pid=" + pid);
		}
		else {
			//페이지 이동
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}

}
