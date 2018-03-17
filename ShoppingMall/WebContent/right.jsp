<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.chenxi.model.*,java.util.*" %>
    
    <%
    	GoodsBeanBO gbb = new GoodsBeanBO();
        
        ArrayList<GoodsBean> al;
        String s_pageNow = (String)request.getAttribute("paegNow");
        int pageNow = 1;
        if(s_pageNow!=null){
        	pageNow = Integer.parseInt(s_pageNow);
        }
        //默认显示第一页
        al = gbb.getGoodsByPage(6,pageNow);
        //得到共有多少页
        int pageCount = gbb.getPageCount(6);
    %>
    
    
<table width="100%" border="1" align="center">
  <tbody>
    <tr>
      <td colspan="3" align="center">图片</td>
    </tr>
    
    
    <% 
        int time = 0;
    	for(int i=0;i<2;i++){
    		//打印两行，每一行里面有3个货物
    		%>
    		<tr>
    		<% 
    		//取出三个
    		for(int j=0;j<3;j++){
    			GoodsBean gb = new GoodsBean();
    			if(time>=al.size()){
    				//不能再取值
    				
    				
    				gb.setGoodsid(0);
    				gb.setGoodsinfo("no books");
    				gb.setPhoto("none.jps");
    				gb.setGoodsprice(0.0f);
    				gb.setGoodsname("no");
    				
    			}
    			gb = (GoodsBean)al.get(time);
    			time++;
    			%>
	    			<td width="33%" align="center"><table width="100%" border="1">
	                <tbody>
	                <tr>
	                <td rowspan="3"><%=gb.getPhoto() %></td>
	                 <td>&nbsp;</td>
	                </tr>
	                 <tr>
	                <td><a href="ShowGoodsServlet?type=showDetail&id=<%=gb.getGoodsid() %>"><%=gb.getGoodsname() %></a></td>
	               </tr>
	               <tr>
	                <td>价格: <%=gb.getGoodsprice() %></td>
	             </tr>
	              <tr>
	            <td colspan="2">说明: <%=gb.getGoodsinfo() %></td>
	            </tr>
	           </tbody>
	            </table></td>
    			<% 
    		}
    		
    		%>
    		</tr>
    		<% 
    		
    		//判断是不是第一行结束
    		if(i==0){
    			%>
    			<tr>
                 <td colspan="3" align="center" bgcolor="#EB8385">&nbsp;</td>
                </tr>
    			<% 
    		}
    	}
    

    %>
    
    <tr>
      <td height="21" colspan="3" align="center">
      <%
      	for(int i=1;i<=pageCount;i++){
      		%>
      		<a href="ShowGoodsServlet?type=dividePage&pageNow=<%=i %>">[ <%=i %> ]</a>
      		<% 
      	}
      %>
      
      </td>
    </tr>
  </tbody>
</table>