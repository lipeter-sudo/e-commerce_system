<%@ page import="com.tuling.domain.Fruit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tuling.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Shopping Cart</title>
  <link rel="stylesheet" href="css/showcart.css" />
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
  <script src="js/imgs.js" type="text/javascript" charset="utf-8"></script>

  <script>
    window.onload=function footer_img_non(){
      document.getElementById("footer_img").style.display="none";
    }

    function getNumberElement(fid) {
      return document.getElementById('num' + fid);
    }

    function submitOrderForm() {
      let numElement;
      var fruits = [];
      var fidList = [];
      var totalPrice = 0; // 用于存储总价

      <%
        List<Fruit> fruits = (List<Fruit>) request.getAttribute("fruits");
        if (fruits == null) {
          fruits = new ArrayList<>();
        }
        for (Fruit fruit : fruits) {
      %>
       numElement = getNumberElement('<%=fruit.getFid()%>');
      if (numElement) {
        const num = numElement.innerText;
        if (num > 0) {
          const up = <%=fruit.getUp()%>; // 获取单价
          const quantity = parseInt(num); // 将数量转换为整数
          const itemPrice = up * quantity; // 计算单项价格
          totalPrice += itemPrice; // 累加总价
          fidList.push(<%=fruit.getFid()%>);
          fruits.push({
            fid: '<%=fruit.getFid()%>',
            fname: '<%=fruit.getFname()%>',
            spec: '<%=fruit.getSpec()%>',
            up: '<%=fruit.getUp()%>',
            quantity: num
          });
        }
      }
      <%
        }
        User user2 = (User) session.getAttribute("user");
        if (user2 == null) {
          response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
          return;
        }
      %>

      // 检查表单元素是否存在
      var orderForm = document.getElementById('orderForm');
      if (!orderForm) {
        console.error('The form element orderForm does not exist');
        return;
      }

      var uidElement = orderForm.elements['uid'];
      var priceElement = orderForm.elements['price'];
      var fruitsElement = orderForm.elements['fruits'];
      var fidElement = orderForm.elements['fidList'];
      if (!uidElement || !priceElement || !fruitsElement) {
        console.error('Form element UID, Price or fruits do not exist');
        return;
      }
      // 将总价添加到表单中
      fidElement.value = fidList.join(',');
      uidElement.value = "<%=user2.getId()%>";
      priceElement.value = totalPrice.toFixed(2);
      fruitsElement.value = JSON.stringify(fruits);

      orderForm.submit();
    }
  </script>
  <%
    List<Fruit> fruits2 = (List<Fruit>) request.getAttribute("fruits");
    if (fruits2 == null || !(fruits2 instanceof List)) {
      fruits2 = new ArrayList<>();
    }
    User user = (User) session.getAttribute("user");
  %>
</head>
<body onload="money()">
<div class="con">
  <div class="head">
    <a href="index.jsp">
<%--      <img src="img/logo_login.png" alt="" />--%>
    </a>
  </div>
  <div class="shop_box">
    <div class="head_text_box">
      <span id="head_text">my cart</span>
    </div>

    <div class="shop_title">
      <div id="st1">goods</div>
      <div id="st2">specifications</div>
      <div id="st3">unit price</div>
      <div id="st4">number</div>
      <div id="st5">subtotal</div>
      <div id="st6">operate</div>
    </div>

    <%
      for (Fruit fruit : fruits2) {
        out.print("    <div class=\"shop\">\n" +
                "      <div class=\"s1\">\n" +
                "        <div class=\"s1_img\"><a href=\"/fruitServlet?method=info&uid=" + user.getId() + "&fid=" + fruit.getFid() + "\"><img src=\"img/fruits/" + fruit.getFid() + "/(1).jpg\" /></a></div>\n" +
                "        <div class=\"s1_text\"><a href=\"/fruitServlet?method=info&uid=" + user.getId() + "&fid=" + fruit.getFid() + "\">" + fruit.getFname() + "</a></div>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s2\">\n" +
                "        " + fruit.getSpec() + "\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s3\">\n" +
                "        <span id=\"up" + fruit.getFid() + "\">" + fruit.getUp() + "</span>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s4\">\n" +
                "     <div class=\"Unum\"><span id=\"numl\" class=\"numl\" onclick=\"number(1," + fruit.getFid() + ");sum(" + fruit.getFid() + ");money()\">-</span><span id=\"num" + fruit.getFid() + "\">1</span><span id=\"numr\" class=\"numr\" onclick=\"number(0," + fruit.getFid() + ");sum(" + fruit.getFid() + ");money()\">+</span></div>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s5\">\n" +
                "        <span id=\"sum" + fruit.getFid() + "\" class=\"fsum\">" + fruit.getUp() + "</span>\n" +
                "      </div>\n" +
                "\n" +
                "      <div class=\"s6\">\n" +
                "        <a href=\"/cartServlet?method=del&uid=" + user.getId() + "&fid=" + fruit.getFid() + "&str=cart\">delete</a>\n" +
                "      </div>\n" +
                "    </div>");
      }
    %>

    <div class="shop_footer">
      &nbsp;
    </div>
  </div>

  <div class="sum_mon">
    <div class="money">商品总金额：<span id="money">68 </span></div><br />
    <input type="button" name="" id="addmon" value="订单结算" onclick="submitOrderForm()" />
  </div>

  <!-- 添加表单元素 -->
  <form id="orderForm" action="/ordersServlet?method=add" method="post">
    <input type="hidden" name="uid" value="" />
    <input type="hidden" name="price" value="" />
    <input type="hidden" name="fruits" value="" />
    <input type="hidden" name="fidList" value="" />
  </form>
</div>
<jsp:include page="footer/footer.jsp"></jsp:include>
</body>
</html>
