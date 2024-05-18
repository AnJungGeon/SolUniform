package com.soluniform.biz.bank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soluniform.biz.bank.BankVO;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("bankDAO")
public class BankDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	 
	public void insertBank(BankVO vo) {
		log.info("{}", "insertBank");
		mybatis.insert("BankDAO.insertBank", vo);
	}
	public void deleteBank(BankVO vo) {
		log.info("{}", "deleteBank");
		mybatis.delete("BankDAO.deleteBank", vo);
	}
	public List<BankVO> getBankList(MemberVO vo) {
		log.info("{}", "getBankList");
		return mybatis.selectList("BankDAO.getBankList", vo);
	}
	
}
