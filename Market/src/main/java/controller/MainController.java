package controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		}

		
		if(command.equals("/insertproduct.do")) {
			response.sendRedirect("/productlist.do");
		}else {
			//페이지 이동
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}

}
