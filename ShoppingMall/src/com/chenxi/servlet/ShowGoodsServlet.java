package com.chenxi.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.chenxi.model.*;
/**
 * Servlet implementation class ShowGoodsServlet
 */
@WebServlet("/ShowGoodsServlet")
public class ShowGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		//得到type,用户是要分页还是要显示具体信息
	    String type = request.getParameter("type");
		if(type.equals("showDetail")){
			String goodsId = request.getParameter("id");
			int goodsid = Integer.parseInt(goodsId);
			GoodsBeanBO gbb = new GoodsBeanBO();
			GoodsBean gb = new GoodsBean();
			gb = gbb.getGoodsBean(goodsid);
			//put gb into request
			request.setAttribute("goodsinfo",gb);
			request.getRequestDispatcher("showdetail.jsp").forward(request, response);
		}else if(type.equals("dividePage")){
			//得到pageNow
			String pageNow = request.getParameter("pageNow");
			//调回购物大厅，把pageNow放入request
			request.setAttribute("pageNow", pageNow);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
