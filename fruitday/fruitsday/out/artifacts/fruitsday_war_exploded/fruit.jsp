<%@ page import="com.tuling.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tuling.domain.Fruit" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8" />
  <title></title>
  <link rel="stylesheet" type="text/css" href="css/BSindex.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/BSindex.js" type="text/javascript" charset="utf-8"></script>
  <%
    String show="x0";
    if(request.getAttribute("sky")!=null)
      show=(String)request.getAttribute("sky");
  %>
</head>
<body >
<div class="mean">
  <div class="logo">
    <a href="index.jsp"><img src="img/alogo.png" alt="" /></a>
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
      <div class="mm"><a href="<%=request.getContextPath()%>/BSServlet?method=hotfruit">Hot selling fruits</a></div>
      <div class="mm"><a href="addFruit.jsp">Fruit storage</a></div>
    </div>
  </div>


</div>
<%
  Fruit fruit=new Fruit("","",0,"","",0);
  if(request.getAttribute("fruit")!=null)
    fruit=(Fruit)request.getAttribute("fruit");
%>
<div class="gong" id="x6">
  <div class="con">
    <div class="form">
      <form action=<%=request.getContextPath()%>/BSServlet?method=upfruit&fid=<%=fruit.getFid()%> method="post">
        <div class="add">
          <span class="add_tit">fruit ：</span>
          <span class="add_text"><input type="text" name="fname" id="fname2" value=<%=fruit.getFname()%> /></span>
        </div>

        <div class="add">
          <span class="add_tit">specification ：</span>
          <span class="add_text"><input type="text" name="spec" id="spec2" value=<%=fruit.getSpec()%> /></span>
        </div>

        <div class="add">
          <span class="add_tit">Unit price ：</span>
          <span class="add_text"><input type="text" name="up" id="up2" value=<%=fruit.getUp()%> /></span>
        </div>

        <div class="add">
          <span class="add_tit">Product profile ：</span>
          <span class="add_text"><input type="text" class="long" name="t1" id="t12" value=<%=fruit.getT1()%> /></span>
        </div>

        <div class="add">
          <span class="add_tit">Warm reminder ：</span>
          <span class="add_text"><input type="text" class="long" name="t2" id="t22" value=<%=fruit.getT2()%> class="long"/></span>
        </div>

        <div class="add">
          <span class="add_tit">Number of pictures ：</span>
          <span class="add_text"><input type="text" name="inum" id="inum2" value=<%=fruit.getInum()%> /></span>
        </div>

        <div class="add_sublmit">
          <input type="submit" value="save"/>
        </div>
      </form>
    </div>
  </div>
</div>




</body>
</html>

