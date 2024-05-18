package com.soluniform.view.member; 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soluniform.biz.member.MemberService;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall/member") 
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//로그인 화면
	@GetMapping("/login")
	public String login() {
		log.info("{}", "login (GET)");
		return "/mall/member/login";
	}
	
	//로그인 DB 처리
	@PostMapping("/login")
	public String login(MemberVO vo, Model model, HttpSession session) {
		log.info("{}", "login (POST)");
		MemberVO member = memberService.login(vo);
		
		if(member != null) {
			session.setAttribute("member", member);
			return "redirect:/mall/shop/shopMain";
		}
		
		return "/mall/member/login";
	}
	
	//로그 아웃 - 모든 세션 삭제 -> 샵 메인
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("{}", "logout");
		session.invalidate();
		return "redirect:/mall/shop/shopMain";
	}
	
	//회원 등록 화면
	@GetMapping("/insertMember")
	public String insertMember() {
		log.info("{}", "insertMember(GET)");
		
		return "/mall/member/insertMember";
	}
	
	//회원 등록 DB처리
	@PostMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		log.info("{}", "insertMember(POST)");
		memberService.insertMember(vo);
		return "/mall/member/login";
	}
	//아이디 중복 체크
	@GetMapping("/getMemberIdCheck")
	public String getmemberIdCheck(MemberVO vo, Model model) {
		log.info("{}", "getMemberIdCheck");
		MemberVO member = memberService.getMember(vo);
		
		// 사용가능할 때는 아이디를 찍어줄것
		int check = -1;
		if(member == null) check = 0;//아이디가 없다면 사용 가능
		else check = 1;//아이디가 있으면 사용 불가
		
		model.addAttribute("check", check);
		return "/mall/member/insertMember";
	}
	
	//회원 상세 보기
	@GetMapping("/getMember")
	public String getMember(MemberVO vo , Model model) {
		log.info("{}", "getMember");
		model.addAttribute("member", memberService.getMember(vo)); 
		return "/mall/member/getMember";
	}
	
	//회원 수정
	@PostMapping("/updateMember")
	public String updateMember(MemberVO vo , HttpSession session) {
		log.info("{}", "updateMember");
		memberService.updateMember(vo);
		session.invalidate();
		return "/mall/member/login";
	}
	
	
	//회원 삭제(탈퇴)//폼의 정보를 받으면 Post매핑
	@PostMapping("/deleteMember")
	public String deleteMember(MemberVO vo, HttpSession session) {
		log.info("{}", "deleteMember");
		memberService.deleteMember(vo);
		session.invalidate();
		return "redirect:/mall/shop/shopMain";
	}
	
}
