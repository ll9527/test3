package com.serviceImp;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminProfitMapper;
import com.dao.ShopOrderMapper;
import com.dao.UserMapper;
import com.entity.AdminProfit;
import com.entity.ShopOrder;
import com.entity.User;
import com.service.ShopOrderService;

@Service
public class ShopOrderServiceImple implements ShopOrderService{
	@Autowired(required = false)
	private ShopOrderMapper shopOrderMapper;
	@Autowired(required = false)
	private UserMapper userMapper;
	@Autowired(required = false)
	private AdminProfitMapper adminPM;
	
	@Override
	public Integer vipPay(ShopOrder shopOrder) {
		// TODO Auto-generated method stub
		if(shopOrderMapper.insertSelective(shopOrder)>0) {
			return 1;
		}
		return null;
	}

	@Override
	public Integer setPayStatus(String orderSn, Integer status) {
		ShopOrder so = shopOrderMapper.selectByOrderSn(orderSn);
		so.setOrderStatus(status);
		User user = userMapper.selectByPrimaryKey(so.getUserId());
		user.setIsVip(1);
		Integer code = shopOrderMapper.updateByPrimaryKeySelective(so);
		Integer code1 = userMapper.updateByPrimaryKeySelective(user);
		if(code==1 && code==1) {
			return 1;
		}
		return 0;
	}

	@Override
	public Integer selectVipMoney() {
		AdminProfit adminProfit = adminPM.selectAdminByVipMoney();
		Integer vipMoney = adminProfit.getVipMoney().multiply(new BigDecimal(100)).intValue();
		return vipMoney;
	}

}
