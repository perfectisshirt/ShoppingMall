<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用css文件 -->
<link rel="stylesheet" type="text/css" href="./css/my.css">
<title>Insert title here</title>
</head>
<body>
<table width="80%" border="1" align="center">
  <tbody>
    <tr>
      <td height="22" colspan="2" align="center">
      <!-- 引入head.jsp -->
      <jsp:include flush="true" page="head.jsp"></jsp:include>
      </td>
    </tr>
    <tr>
      <td width="19%" height="138" align="center" valign="middle">
      <jsp:include flush="true" page="left.jsp"></jsp:include>
      </td>
      <td width="81%" align="center">
      <jsp:include flush="true" page="right.jsp"></jsp:include>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      <jsp:include flush="true" page="tail.jsp"></jsp:include>
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>