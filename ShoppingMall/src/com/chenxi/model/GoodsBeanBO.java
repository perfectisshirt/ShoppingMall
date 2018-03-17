package com.chenxi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//deal operations related goods table
public class GoodsBeanBO {
	private ResultSet rs = null;
	private Connection ct = null;
	private PreparedStatement ps = null;
	private Statement st = null;
	
	
	/**
	 * 返回共有多少页
	 */
	public int getPageCount(int pageSize){
		int pageCount = 0;
		int rowCount = 0;
		try{
		   ct = new ConnDB().getConn();
		   ps = ct.prepareStatement("select count(*) from goods");
		   rs = ps.executeQuery();
		   if(rs.next()){
			   rowCount = rs.getInt(1);
		   }
		   if (rowCount % pageSize == 0){
			   pageCount = rowCount / pageSize;
		   }else{
			   pageCount = rowCount/ pageSize+1;
		   }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		return pageCount;
	}
	
	/**
	 * 分页显示货物的信息
	 * @param pageSize，每页显示几条记录
	 * @param pageNow，当前显示的是哪一页
	 * @return ArrayList, 就是要显示的货物集合
	 */
	public ArrayList<GoodsBean> getGoodsByPage(int pageSize,int pageNow){
		ArrayList<GoodsBean> al = new ArrayList<>();
		try{
			ct = new ConnDB().getConn();
			st = ct.createStatement();
			rs = st.executeQuery("select * from goods order by goodsid limit "+pageSize *(pageNow-1)+","+pageSize+"");
			while(rs.next()){
				GoodsBean gb = new GoodsBean();
				gb.setGoodsid(rs.getInt(1));
				gb.setGoodsname(rs.getString(2));
				gb.setGoodsinfo(rs.getString(3));
				gb.setGoodsprice(rs.getFloat(4));
				gb.setGoodsnum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));
				gb.setType(rs.getString(8));
				al.add(gb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return al;
	}
	
	
	//根据一个商品货物id，得到商品信息
	public GoodsBean getGoodsBean(int id) {
		GoodsBean gb = new GoodsBean();
		try{
			ct = new ConnDB().getConn();
			String sql = "select * from goods where goodsid = '"+id+"'";
			st = ct.createStatement();
			rs = st.executeQuery(sql);
			//ps.setInt(1, id);
			//rs = ps.executeQuery();
			if (rs.next()) {
				//放入到gb
				gb.setGoodsid(rs.getInt(1));
				gb.setGoodsname(rs.getString(2));
				gb.setGoodsinfo(rs.getString(3));
				gb.setGoodsprice(rs.getFloat(4));
				gb.setGoodsnum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));
				gb.setType(rs.getString(8));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		return gb;
	}
	
	//close resource
	public void close(){
		try{
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if (ct != null) {
				ct.close();
				ct = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
