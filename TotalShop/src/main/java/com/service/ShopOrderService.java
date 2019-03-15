package com.service;

import com.entity.ShopOrder;

public interface ShopOrderService {

	Integer vipPay(ShopOrder shopOrder);

	Integer setPayStatus(String orderSn, Integer status);

	Integer selectVipMoney();

}
