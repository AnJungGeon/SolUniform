package com.soluniform.biz.bank;

import java.util.List;

import com.soluniform.biz.member.MemberVO;

public interface BankService {
	void insertBank(BankVO vo); 
	void deleteBank(BankVO vo);
	List<BankVO> getBankList(MemberVO vo);
}
