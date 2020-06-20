package com.product.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.product.model.Product_DAO;
import com.product.model.Product_Service;
import com.product.model.Product_VO;

@MultipartConfig
@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.addHeader("Access-Control-Allow-Origin", "*");
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");

		PrintWriter out = res.getWriter();
		String id=  req.getParameter("product_id");
		
		
		
		
		String action = req.getParameter("action");

		Gson gson = new Gson();
		Product_DAO product_DAO = new Product_DAO();

		switch (action) {
		
		case "NewDate":
			out.print(gson.toJson(product_DAO.getAll()));
			break;
		case "HighPrice":
			out.print(gson.toJson(product_DAO.highPrice()));
			break;
		case "LowPrice":
			out.print(gson.toJson(product_DAO.lowPrice()));
			break;
		case "HighScore":
			out.print(gson.toJson(product_DAO.highScore()));
			break;
		}
		

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("product_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/product_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String product_id = null;
				try {
					product_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號不對");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/product_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				Product_Service product_Svc = new Product_Service();
				Product_VO product_VO = product_Svc.getOneProduct(product_id);
				if (product_VO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/product_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("product_VO", product_VO); // 資料庫取出的empVO物件,存入req
				String url = "/pro/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String product_id = req.getParameter("product_id");
				/*************************** 2.開始查詢資料 ****************************************/
				Product_Service product_Svc = new Product_Service();
				Product_VO product_VO = product_Svc.getOneProduct(product_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("product_VO", product_VO); // 資料庫取出的empVO物件,存入req
				String url = "/pro/updateProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/pro/listAllProduct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String product_id = req.getParameter("product_id");
				String name = req.getParameter("name");
				// 與Member串通之後才可使用
//				HttpSession session = req.getSession();
//				String member_id = ((MemberVO) session.getAttribute("member_id")).getMember_id();

				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,6}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("產品名字: 請勿空白");
				} else if (!name.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("產品名字: 只能是中、英文字母、數字和_ , 且長度必需在2到6之間");
				}

				String product_class = req.getParameter("product_class").trim();
				if (product_class == null || product_class.trim().length() == 0) {
					errorMsgs.add("類別請勿空白");
				}

				Integer product_state = null;
				try {
					product_state = new Integer(req.getParameter("product_state").trim());
				} catch (NumberFormatException e) {
					product_state = 0;
					errorMsgs.add("請輸入上下架狀態");
				}

				byte[] description = null;
				Part part = req.getPart("description");
				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);

				byte[] image1 = null;
				Part part1 = req.getPart("image1");
				InputStream in1 = part1.getInputStream();
				byte[] buf1 = new byte[in1.available()];
				in1.read(buf1);

				byte[] image2 = null;
				Part part2 = req.getPart("image2");
				InputStream in2 = part2.getInputStream();
				byte[] buf2 = new byte[in1.available()];
				in2.read(buf2);

				byte[] image3 = null;
				Part part3 = req.getPart("image3");
				InputStream in3 = part3.getInputStream();
				byte[] buf3 = new byte[in3.available()];
				in3.read(buf3);

				byte[] image4 = null;
				Part part4 = req.getPart("image4");
				InputStream in4 = part4.getInputStream();
				byte[] buf4 = new byte[in4.available()];
				in4.read(buf4);
				in4.close();
				in2.close();
				in3.close();
				in1.close();
				in.close();

				Product_VO product_VO = new Product_VO();
				// 與Member串通之後才可使用
				product_VO.setProduct_id(product_id);
				product_VO.setName(name);
				product_VO.setProduct_class(product_class);
				product_VO.setDescription(buf);
				product_VO.setImage1(buf1);
				product_VO.setImage2(buf2);
				product_VO.setImage3(buf3);
				product_VO.setImage4(buf4);
				product_VO.setProduct_state(product_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("product_VO", product_VO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/pro/updateProduct.jsp");
					failureView.forward(req, res);

					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				Product_Service product_Svc = new Product_Service();
				product_VO = product_Svc.updateProduct(product_VO);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("product_VO", product_VO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/pro/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/pro/updateProduct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String name = req.getParameter("name");
				// 與Member串通之後才可使用
//					HttpSession session = req.getSession();
//					String member_id = ((MemberVO) session.getAttribute("member_id")).getMember_id();

				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,6}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("產品名字: 請勿空白");
				} else if (!name.trim().matches(enameReg)) {
					errorMsgs.add("產品名字: 只能是中、英文字母、數字和_ , 且長度必需在2到6之間");
				}

				String product_class = req.getParameter("product_class").trim();

				if (product_class == null || product_class.trim().length() == 0) {
					errorMsgs.add("商品類別請勿空白");
				}

				Integer product_state = null;
				try {
					product_state = new Integer(req.getParameter("product_state").trim());
				} catch (NumberFormatException e) {
					product_state = 0;
					errorMsgs.add("請輸入上下架狀態");
				}

				byte[] description = null;
				Part part = req.getPart("description");
				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);

				byte[] image1 = null;
				Part part1 = req.getPart("image1");
				InputStream in1 = part1.getInputStream();
				byte[] buf1 = new byte[in1.available()];
				in1.read(buf1);

				byte[] image2 = null;
				Part part2 = req.getPart("image2");
				InputStream in2 = part2.getInputStream();
				byte[] buf2 = new byte[in2.available()];
				in2.read(buf2);

				byte[] image3 = null;
				Part part3 = req.getPart("image3");
				InputStream in3 = part3.getInputStream();
				byte[] buf3 = new byte[in3.available()];
				in3.read(buf3);

				byte[] image4 = null;
				Part part4 = req.getPart("image4");
				InputStream in4 = part4.getInputStream();
				byte[] buf4 = new byte[in4.available()];
				in4.read(buf4);

				in4.close();
				in3.close();
				in2.close();
				in1.close();
				in.close();

				String member_id = new String(req.getParameter("member_id").trim());

				Product_VO product_VO = new Product_VO();
				// 與Member串通之後才可使用

				product_VO.setMember_id(member_id);
				product_VO.setName(name);
				product_VO.setProduct_class(product_class);
				product_VO.setDescription(buf);
				product_VO.setImage1(buf1);
				product_VO.setImage2(buf2);
				product_VO.setImage3(buf3);
				product_VO.setImage4(buf4);
				product_VO.setProduct_state(product_state);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("product_VO", product_VO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/pro/addProduct.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				Product_Service product_Svc = new Product_Service();
				product_VO = product_Svc.addProduct(product_VO);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/pro/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/pro/addProduct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs1 = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs1);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String product_id = new String(req.getParameter("product_id"));

				/*************************** 2.開始刪除資料 ***************************************/
				Product_Service product_Svc = new Product_Service();
				product_Svc.deleteProduct(product_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs1.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/pro/listAllProduct.jsp");
				failureView.forward(req, res);
			}
		}
		// 萬用查詢
		if ("listProduct_ByName".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.將輸入資料轉為Map **********************************/
				// 採用Map<String,String[]> getParameterMap()的方法
				// 注意:an immutable java.util.Map
				Map<String, String[]> map = req.getParameterMap();

				/*************************** 2.開始複合查詢 ***************************************/
				Product_Service product_Svc = new Product_Service();
				List<Product_VO> list = product_Svc.getAll(map);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("listProduct_ByName", list); // 資料庫取出的list物件,存入request
//				RequestDispatcher successView = req.getRequestDispatcher("/pro/listProduct_ByName.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				RequestDispatcher successView = req.getRequestDispatcher("Test.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product_page.jsp");
				failureView.forward(req, res);
			}
		}
	}



	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}
}
