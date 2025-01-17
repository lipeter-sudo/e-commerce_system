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

<div class="gong" id="x1">
  <div class="con">
    <div class="tit">
      <ul>
        <li>username</li>
        <li class="i">&nbsp;</li>
        <li>mailbox</li>
        <li class="i">&nbsp;</li>
        <li>Cell phone</li>
        <li class="i">&nbsp;</li>
        <li>Controls</li>
      </ul>
    </div>

    <%
      List<User> users=new ArrayList<User>();
      if(request.getAttribute("allusers")!=null)
      {
        users=(List<User>)request.getAttribute("allusers");

        for(User user:users)
        {
          out.print("    <div class=\"info\">\n" +
                  "      <ul>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=finduser&uid="+user.getId()+"\">"+user.getUname()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=finduser&uid="+user.getId()+"\">"+user.getEmail()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=finduser&uid="+user.getId()+"\">"+user.getPhone()+"</a></li>\n" +
                  "        <li class=\"i\">&nbsp;</li>\n" +
                  "        <li><a href=\""+request.getContextPath()+"/BSServlet?method=deluser&uid="+user.getId()+"\">delete</a></li>\n" +
                  "      </ul>\n" +
                  "    </div>");
        }
      }


    %>
  </div>
</div>

</body>
</html>

