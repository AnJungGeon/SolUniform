package com.soluniform.biz.bank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soluniform.biz.bank.BankService;
import com.soluniform.biz.bank.BankVO;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("bankService")
public class BankServiceImpl implements BankService{
	@Autowired
	private BankDAO bankDAO;

	@Override
	public void insertBank(BankVO vo) { 
		log.info("{}", "insertBank");
		bankDAO.insertBank(vo);
		
	}

	@Override
	public void deleteBank(BankVO vo) {
		log.info("{}", "deleteBank");
		bankDAO.deleteBank(vo);
		
	}

	@Override
	public List<BankVO> getBankList(MemberVO vo) {
		log.info("{}", "getBankList");
		return bankDAO.getBankList(vo);
	}
	
}
