package com.tuling.service.impl;

import com.tuling.dao.OrdersDao;
import com.tuling.dao.impl.OrdersDaoImpl;
import com.tuling.domain.Orders;
import com.tuling.service.OrdersService;

public class OrdersServiceImpl implements OrdersService {
    private OrdersDao ordersDao  = new OrdersDaoImpl();
    @Override
    public int add(Orders orders) {
        int num=ordersDao.add(orders);
        if(num==1) {
            return 1;
        }else {
            return 0;
        }
    }
}
