package com.soluniform.biz.member;

public interface MemberService {
	
	MemberVO login(MemberVO vo);
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo);
	void deleteMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	MemberVO getMemberIdCheck(MemberVO vo);
}




