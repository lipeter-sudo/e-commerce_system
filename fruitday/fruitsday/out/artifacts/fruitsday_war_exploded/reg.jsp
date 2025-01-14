
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>User login - Tiantian Orchard - Preferred brand for fruit online shopping, fruits, we only choose those with good reputation!</title>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <link rel="stylesheet" type="text/css" href="css/rl.css"/>
  <script src="js/reg.js"></script>
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
<%--        <img src="img/logo_login.png" alt="" />--%>
      </a>
    </div>

    <div class="text">
      <div class="text_head">
        <span class="h01">Register as a member</span>
        <span class="h02">Gift of 1 seasonal fresh fruit</span>
        <div class="xhr"></div>
      </div>
      <form action=<%=request.getContextPath()%>/userServlet?method=add method="post" id="regForm">
              <div class="text_box">
                  <div class="main"><div class="name">email：</div>
                  <input type="text" name="email" id="email" value="" onblur="isEmail()"/>
                  <div id="isEmail" class="iss"></div>
                  </div>
                  <div class="main"><div class="name">phone number：</div>
                  <input type="text" name="phone" id="phone" value="" onblur="isPhone()"/>
                  <div id="isPhone" class="iss"></div>
                  </div>
                  <div class="main"><div class="name">password：</div>
                  <input type="password" name="pwd1" id="pwd1" value="" onblur="isPwd1()"/>
                  <div id="isPwd1" class="iss"></div>
                  </div>
                  <div class="main"><div class="name">Confirm password：</div>
                  <input type="password" name="pwd2" id="pwd2" value="" onblur="isPwd2()"/>
                  <div id="isPwd2" class="iss"></div>
                  </div>
                  <div class="xbutton">
                  <input type="button" name="reg" id="reg" value="register" onclick="isReg()"/>
                  </div>
              </div>
      	</form>
    </div>

    <div class="jmp">
      <div class="jmpp">
        Are you already a member of Tiantian Orchard?
      </div>
      <div class="jmpa">
        <a href="login.jsp">Log in now&nbsp;></a>
      </div>
    </div>
  </div>
  <jsp:include page="footer/footer.jsp"></jsp:include>
</div>
</body>
</html>
