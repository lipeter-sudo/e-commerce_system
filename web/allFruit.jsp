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


<div class="gong" id="x4">
  <div class="con">
    <div class="tit">
      <ul>
        <li>fruit</li>
        <li class="i">&nbsp;</li>
        <li>specification</li>
        <li class="i">&nbsp;</li>
        <li>Unit price</li>
        <li class="i">&nbsp;</li>
        <li>Controls</li>
      </ul>
    </div>
    <%
      List<Fruit> fruits=new ArrayList<Fruit>();
      if(request.getAttribute("allfruit")!=null) {

        fruits = (List<Fruit>) request.getAttribute("allfruit");

        for(Fruit fruit:fruits) {
          out.print("    <div class=\"info\">\n" +
                  "      <ul>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=findfruit&fid="+fruit.getFid()+"\">"+fruit.getFname()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=findfruit&fid="+fruit.getFid()+"\">"+fruit.getSpec()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=findfruit&fid="+fruit.getFid()+"\">"+fruit.getUp()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=delfruit&fid="+fruit.getFid()+"\">delete</a></li>\n" +
                  "      </ul>\n" +
                  "    </div>");
        }
      }
    %>


  </div>
</div>


</body>
</html>

