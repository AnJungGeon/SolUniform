package com.soluniform.view.bank;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soluniform.biz.bank.BankService;
import com.soluniform.biz.bank.BankVO;
import com.soluniform.biz.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall/bank")
public class BankController {
	@Autowired
	private BankService bankService;
	
	
	// 카드 추가
	@PostMapping("/insertBank")
	public String insertBank(BankVO vo, HttpSession session) {
		log.info("{}", "insertBank");
		//member 세션 확인 
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/shop/login";
		  
		bankService.insertBank(vo);
		return "redirect:/mall/shop/shopMain";
	}
	
	// 카드 삭제
	@GetMapping("/deleteBank")
	public String deleteBank(BankVO vo, HttpSession session) {
		log.info("{}", "deleteBank");
		//member 세션 확인 및 획득
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/shop/login";
		
		bankService.deleteBank(vo);
		return "redirect:/mall/shop/shopMain";
	}
	
	// 카드 조회

}
