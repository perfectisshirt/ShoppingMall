<%@ page language="java" import="com.chenxi.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	GoodsBean gb = (GoodsBean)request.getAttribute("goodsinfo");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/my.css">
<script type="text/javascript">
//响应点击返回购物大厅
function returnHall(){
	//open是默认打开新页面
	window.open("index.jsp","_self");
}
</script>
<title>Insert title here</title>
</head>
<body>
<table width="80%" border="1" align="center">
  <tbody>
    <tr>
      <td align="center">
      <jsp:include flush="true" page="head.jsp"></jsp:include>
      </td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="1">
        <tbody>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
          <tr>
            <td rowspan="8">图片</td>
            <td align="center"><%=gb.getGoodsname() %></td>
          </tr>
          <tr>
            <td align="center"><%=gb.getGoodsprice() %></td>
          </tr>
          <tr>
            <td align="center"><%=gb.getGoodsid() %></td>
          </tr>
          <tr>
            <td align="center"><%=gb.getType() %></td>
          </tr>
          <tr>
            <td align="center"><%=gb.getPublisher() %></td>
          </tr>
          <tr>
            <td align="center"><%=gb.getGoodsinfo() %></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><input type="button" name="buttom" id="buttom" value="购买">
                 <input type="button" name="button2" id="button2" value="返回购物大厅" onclick="returnHall();"></td>
            </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td align="center">
      <jsp:include flush="true" page="tail.jsp"></jsp:include>
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>