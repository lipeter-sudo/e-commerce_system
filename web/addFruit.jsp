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
<%--            <div class="mm"><a href="<%=request.getContextPath()%>/BSServlet?method=hotfruit">Hot selling fruits</a></div>--%>
            <div class="mm"><a href="addFruit.jsp">Fruit storage</a></div>
        </div>
    </div>

</div>

<div class="gong" id="x5">
  <div class="con">
    <div class="form" style="margin-top: 40px;">
        <form action="<%=request.getContextPath()%>/BSServlet?method=addfruit" method="post" enctype="multipart/form-data">
            <!-- 已有文本字段 -->
            <div class="add">
                <span class="add_tit">Fruit:</span>
                <span class="add_text"><input type="text" name="fname" id="fname1" value="" /></span>
            </div>

            <div class="add">
                <span class="add_tit">Specifications:</span>
                <span class="add_text"><input type="text" name="spec" id="spec1" value="" /></span>
            </div>

            <div class="add">
                <span class="add_tit">Unit Price:</span>
                <span class="add_text"><input type="text" name="price" id="up1" value="" /></span>
            </div>

            <div class="add">
                <span class="add_tit">Product Description:</span>
                <span class="add_text"><input type="text" class="long" name="t1" id="t11" value="" /></span>
            </div>

            <div class="add">
                <span class="add_tit">Warm Reminder:</span>
                <span class="add_text"><input type="text" class="long" name="t2" id="t21" value="" /></span>
            </div>

            <div class="add">
                <span class="add_tit">Number of Pictures:</span>
                <span class="add_text"><input type="text" name="inum" id="inum1" value="" /></span>
            </div>

            <!-- 新增图片上传字段 -->
            <div class="add">
                <span class="add_tit">Image:</span>
                <span class="add_text"><input type="file" name="image" id="image" accept="image/*"/></span>
            </div>

            <div class="add_sublmit">
                <input type="submit" value="Append"/>
            </div>
        </form>
    </div>
  </div>
</div>


</body>
</html>

