
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>User login - Daily orchard - Fruit online shopping preferred brand, fruit, we only pick the origin!</title>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <link rel="stylesheet" type="text/css" href="css/rl.css"/>

  <script>
    window.onload=function footer_img_non(){
      document.getElementById("footer_img").style.display="none";
    }
  </script>
</head>
<body>
  <div class="con">
    <div class="box">
      <div class="head">
        <a href="index.jsp">
<%--          <img src="img/logo_login.png" alt="" />--%>
        </a>
      </div>

      <div class="text">
        <%
          Object obj = request.getAttribute("showError");
          if(obj!=null){
            boolean showError = (Boolean)obj;
            if(showError){
        %>
        <span><font color="red">You are not logged in yet, please log in first!!</font></span>
        <%}
        }
        %>
        <div class="text_head">
          <span class="h01">Member login</span>
          <div class="xhr"></div>
        </div>
        <form action=<%=request.getContextPath()%>/userServlet?method=login  method="post">
          <div class="text_box">
            <div class="main"><div class="name">Email/Mobile Phone：</div>
              <input type="text" name="str" id="str" value="" />
            </div>
            <div class="main"><div class="name">password：</div>
              <input type="password" name="pwd" id="pwd" value="" />
            </div>
            <div class="xbutton">
              <input type="submit" name="login" id="login" value="login" />
            </div>
            <div class="fpwd">
              <a href="">forgot password >></a>
            </div>
          </div>

        </form>
      </div>

      <div class="jmp">
        <div class="jmpp">
          <p>Don't have a Tiantian Orchard account yet?</p>
          <p>Register to receive 1 seasonal fresh fruit as a gift</p>
        </div>
        <div class="jmpa_l">
          <a href="reg.jsp">Register Now&nbsp;></a>
        </div>
      </div>
    </div>

    <jsp:include page="footer/footer.jsp"></jsp:include>
  </div>
</body>
</html>
