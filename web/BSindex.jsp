<%@ page import="com.tuling.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8" />
  <title></title>
  <link rel="stylesheet" type="text/css" href="css/BSindex.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/BSindex.js" type="text/javascript" charset="utf-8"></script>

</head>
<body >
<div class="mean">
  <div class="logo">
    <a href="index.jsp"><img src="img/alogo.png" alt="" /></a>
    <a style="font-size: 18px;display:block;color: #ff0000" href="<%=request.getContextPath()%>/userServlet?method=logout">logout</a>
  </div>

  <div class="mean_ul">
    <div class="mean_li" onclick="sss('u')">User Management</div>
    <div class="user_list" id="user_list">
      <div class="mm"><a href="<%=request.getContextPath()%>/BSServlet?method=alluser">All Users</a></div>
      <div class="mm"><a href="addUser.jsp">Add User</a></div>
    </div>
    <div class="mean_li" onclick="sss('f')">Commodity management</div>
    <div class="fruit_list" id="fruit_list">
      <div class="mm"><a href="<%=request.getContextPath()%>/BSServlet?method=allfruit">Inventory of fruits</a></div>
<%--      <div class="mm"><a href="<%=request.getContextPath()%>/BSServlet?method=hotfruit">Hot selling fruits</a></div>--%>
      <div class="mm"><a href="addFruit.jsp">Fruit storage</a></div>
    </div>
  </div>
</div>

<div class="gong" id="x0" >
  <div class="con">
    <div class="hello">
      <h1>Welcome to the backend management system of Tiantian Orchard</h1>
    </div>
  </div>
</div>


</body>
</html>

