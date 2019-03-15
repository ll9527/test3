package com.service;

import com.entity.SellerVisit;

import java.util.List;
import java.util.Map;

public interface SellerVisitService {

    int deleteByPrimaryKey(Integer id);

    int insert(SellerVisit record);

    int insertSelective(SellerVisit record);

    SellerVisit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SellerVisit record);

    int updateByPrimaryKey(SellerVisit record);

    //增加访问人数
    int insertVistNum(Map<String, Integer> map);

    //通过sellerid查询
    SellerVisit selectBySellerid(Integer sellerid);

    //查询所有
    List<SellerVisit> selectAll();
    
    /**
     * 定时清除每日访问商家的人数
     */
	void clearSellerVisit();
}
