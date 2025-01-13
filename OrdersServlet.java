package com.tuling.controller;


import com.tuling.domain.Cart;
import com.tuling.domain.Orders;
import com.tuling.service.CartService;
import com.tuling.service.OrdersService;
import com.tuling.service.impl.CartServiceImpl;
import com.tuling.service.impl.OrdersServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/ordersServlet")
public class OrdersServlet extends BaseServlet{
    private OrdersService ordersService = new OrdersServiceImpl();
    private CartService cartService = new CartServiceImpl();
    public String add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        double price = Double.parseDouble(req.getParameter("price"));
        String fruitsStr = req.getParameter("fruits");
        int uid = Integer.parseInt(req.getParameter("uid"));
        String fidList = req.getParameter("fidList");
        Date date = new Date();
        Orders orders = new Orders(fruitsStr,uid,price,date);
        String[] parts = fidList.split(",");
        int add = ordersService.add(orders);
        if(add > 0){
            for (String part : parts) {
                int fid = Integer.parseInt(part.trim());
                Cart resultCart = cartService.find(uid, fid);
                Cart cart=new Cart();
                cart.setFid(fid);
                cart.setIsCart(false);
                cart.setIsStar(resultCart.isStar());
                cartService.update(uid,cart);
            }
            return "forward:/orderSuccess.jsp";
        }else{
            return "forward:/orderFail.jsp";
        }
//        if(loginUser!=null)
//        {
//            HttpSession session=req.getSession();
//            session.setAttribute("user",user);
//            return "forward:/index.jsp";
//        }
//        else{
//        }
    }
}
