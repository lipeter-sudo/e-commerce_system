package com.tuling.dao.impl;

import com.tuling.dao.OrdersDao;
import com.tuling.domain.Orders;
import com.tuling.util.DruidUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;
import java.util.Date;

public class OrdersDaoImpl implements OrdersDao {
    private QueryRunner queryRunner = new QueryRunner(DruidUtils.getDataSource());
    @Override
    public int add(Orders orders) {
        String sql = "insert into orders(data,userid,price,created)values(?,?,?,?)";
        Object[] params = {orders.getData(),orders.getUserid(),orders.getPrice(),orders.getCreated()};
        try {
            return queryRunner.update(sql,params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
}
