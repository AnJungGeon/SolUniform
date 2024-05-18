package com.soluniform.biz.buy.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soluniform.biz.buy.BuyVO;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j; 

@Slf4j
@Repository("buyDAO")
public class BuyDAO { 
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBuy(List<BuyVO> buyList) {
		log.info("{}", "insertBuy");
		mybatis.insert("BuyDAO.insertBuy", buyList);
	}
	
	public List<BuyVO> getBuyList(MemberVO vo) { 
		log.info("{}", "getBuyList");
		return mybatis.selectList("BuyDAO.getBuyList", vo);
	}
	public List<BuyVO> getBuyDetail(BuyVO vo) { 
		log.info("{}", "getBuyDetail");
		return mybatis.selectList("BuyDAO.getBuyDetail", vo);
	}
	
	public List<BuyVO> getBuyListSearch(BuyVO vo){
		log.info("{}", "getBuyListSearch");
		return mybatis.selectList("BuyDAO.getBuyListSearch", vo);
	}
	
	public int getBuyIdCount(BuyVO vo) {
		log.info("{}", "getBuyIdCount");
		return mybatis.selectOne("BuyDAO.getBuyIdCount", vo);
	}
	public int getBuyIdSum(BuyVO vo) {
		log.info("{}", "getBuyIdSum");
		return mybatis.selectOne("BuyDAO.getBuyIdSum", vo);
	}
}
