package com.soluniform.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soluniform.biz.member.MemberService;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service("memberService")
public class MemberServiceImpl implements MemberService  {
 
	@Autowired 
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO vo) {
		log.info("{}", "login");
		return memberDAO.login(vo);
	}
	
	@Override
	public void insertMember(MemberVO vo) {
		log.info("{}", "insertMember");
		memberDAO.insertMember(vo);
	}
	@Override
	public void updateMember(MemberVO vo) {
		log.info("{}", "updateMember");
		memberDAO.updateMember(vo);
	}
	@Override
	public void deleteMember(MemberVO vo) {
		log.info("{}", "deletetMember");
		memberDAO.deleteMember(vo);
	}

	@Override  
	public MemberVO getMember(MemberVO vo) {
		log.info("{}", "getMember");
		return memberDAO.getMember(vo);
	} 
	@Override 
	public MemberVO getMemberIdCheck(MemberVO vo) {
		log.info("{}", "getMemberCheck");
		return memberDAO.getMemberIdCheck(vo);
	}
}


