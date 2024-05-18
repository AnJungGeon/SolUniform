package com.soluniform.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("memberDAO") 
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO login(MemberVO vo) { 
		log.info("{}", "login");
		return mybatis.selectOne("MemberDAO.login", vo);
		
	}
	
	public void insertMember(MemberVO vo) {
		log.info("{}", "insertMember");
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	public void updateMember(MemberVO vo) { 
		log.info("{}", "updateMember");
		mybatis.insert("MemberDAO.updateMember", vo);
	}
	
	public void deleteMember(MemberVO vo) {
		log.info("{}", "deleteMember");
		mybatis.insert("MemberDAO.deleteMember", vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		log.info("{}", "getMember");
		return mybatis.selectOne("MemberDAO.getMember", vo);
		
	}
	public MemberVO getMemberIdCheck(MemberVO vo) {
		log.info("{}", "getMemberIdCheck");
		return mybatis.selectOne("MemberDAO.getMemberIdCheck", vo);
		
	}
	
}



