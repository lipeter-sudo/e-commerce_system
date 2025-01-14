<%@ page import="com.tuling.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <link rel="stylesheet" type="text/css" href="head/css/head.css"/>
  <jsp:include page="/cartServlet?method=num"></jsp:include>
  <%
    User user=new User(0,"","","","");
    int num=0;
    if(session.getAttribute("user")!=null)
      user=(User)session.getAttribute("user");
    if(request.getAttribute("num")!=null)
     num=(Integer)request.getAttribute("num");
  %>
</head>

<body>
  <div class="top">
    <div class="con">

      <div class="head_left">Hello, welcome to Tiantian Orchard!</div>

      <%
        if(user.getId()==0)
          out.print("        <div class=\"head_right noLink\" >\n" +
                  "            <a href=\"login.jsp\">[ login ]</a>&nbsp;&nbsp;\n" +
                  "            <a href=\"reg.jsp\">[ register<span style=\"color: red;font-size: 12px;\">There's a surprise</span> ]</a>\n" +
                  "        </div>");
        else {
          out.print("      <div class=\"head_right\" >\n" +
                  "        <div class=\"username\"><a href=\"#\">"+user.getUname()+"</a></div>\n" +
                  "        <div class=\"star\">\n" +
                  "          <div class=\"star_img\">\n" +
                  "          </div>\n" +
                  "          <div class=\"toStar\"><a href=\""+request.getContextPath()+"/cartServlet?method=show&uid="+user.getId()+"&boob=star\">My attention</a>\n" +
                  "          </div>\n" +
                  "        </div>\n" +
                  "      </div>");
        }
      %>

    </div>
  </div>

  <%--网站图标、搜索框、购物车--%>
  <div class="head">
    <div class="con">

      <div class="logo">
        <a href="<%=request.getContextPath()%>/BSServlet?method=toAdmin">
          <img style="width: 114px;height: 114px;margin-top: -22px;" src="head/imgs/fdaylogo.png" alt="Tiantian Orchard - the preferred brand for fruit online shopping. We only choose fruits with good reputation!"  />
        </a>
      </div>

      <div class="ser">
        <form action=<%=request.getContextPath()%>/searchServlet?method=search method="post" >
          <input type="text" name="keyword" id="ser_border" value="grapes" />
          <input type="submit" name="ser_button" id="ser_button" value="search" />
        </form>
      </div>

      <div class="shopcart">
        <div class="cart_img"></div>
        <div class="cart">
          <a href=<%=request.getContextPath()%>/cartServlet?method=show&uid=<%=user.getId()%>&boob=cart>my cart</a>
          <div class="cart_num" id="cart_num"><%=num%></div>
        </div>
        <div class="cart_to">></div>
      </div>

    </div>
  </div>

  <%--网站菜单--%>
  <div class="head_menu">
    <div class="con">
      <ul class="hmenu_ul">
        <li><a href="index.jsp">home page</a></li>
        <li><a href=<%=request.getContextPath()%>/searchServlet?method=all>All products</a></li>
        <li><a href="">Imported fruits</a></li>
        <li><a href="">domestic products</a></li>
      </ul>
    </div>
  </div>

</body>
</html>
