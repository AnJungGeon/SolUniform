package com.soluniform.view.buy;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soluniform.biz.bank.BankService;
import com.soluniform.biz.buy.BuyService;
import com.soluniform.biz.buy.BuyVO;
import com.soluniform.biz.cart.CartService;
import com.soluniform.biz.cart.CartVO;
import com.soluniform.biz.member.MemberVO;
import com.soluniform.biz.product.ProductService;
import com.soluniform.biz.product.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall/buy")
public class BuyController {
	@Autowired
	private BuyService buyService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private ProductService productService;
	
	private String getDelivery_date() {
		//배송 예정 일자
		Calendar cal = Calendar.getInstance();
		String[] weekday = {"", "월", "화", "수", "목", "금", "토", "일"};
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DATE);
		int w = cal.get(Calendar.DAY_OF_WEEK);
		String week = weekday[w];
		String delivery_date = year + "년" + month + "월" + day + "일(" + week + ")";
		return delivery_date;
	};
	
	
	
	//결제폼 이동 -> getCartList.jsp에서 넘어옴
	@GetMapping("/getBuyForm")
	public String buyForm(Model model, HttpSession session, @RequestParam String cart_id) {
		log.info("{}", "buyForm - GET");
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/member/login"; 

		
		
		String s_cart_id = cart_id;
		List<Integer> cartIdList = new ArrayList<Integer>();
		StringTokenizer st = new StringTokenizer(s_cart_id, ",");
		while(st.hasMoreTokens()){
			cartIdList.add(Integer.parseInt(st.nextToken()));
		}
		List<CartVO> cartList = cartService.getCartIdList(cartIdList);
		

		
		model.addAttribute("cartList",cartList);
		session.setAttribute("cartListSession", cartList);
		
		//뱅크 리스트
		model.addAttribute("bankList", bankService.getBankList(member));
		model.addAttribute("delivery_date", getDelivery_date());
		return "/mall/buy/getBuyForm";
	}

	//결제폼 ->shopContent.jsp 에서 넘어옴
	@PostMapping("/getBuyForm")
	public String buyForm(CartVO vo, Model model, HttpSession session) {
		log.info("{}", "buyForm - POST");
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/member/login"; 
		
		List<CartVO> cartList = new ArrayList<CartVO>();
		cartList.add(vo);
		model.addAttribute("cartList",cartList);
		session.setAttribute("cartListSession", cartList);
		
		//뱅크 리스트
		model.addAttribute("bankList", bankService.getBankList(member));
		
		model.addAttribute("delivery_date", getDelivery_date());
		return "/mall/buy/getBuyForm";
	}
	
	//구매 목록 추가 -> 트랜잭션 처리
	@PostMapping("/insertBuy")
	public String insertBuy(BuyVO vo, HttpSession session) {
		log.info("{}", "insertBuy");
		
		
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/member/login"; 
		
		//카트리스트 세션 획득
		List<CartVO> cartList = (List<CartVO>)session.getAttribute("cartListSession");
		
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String year = now.toString().substring(0, 4);
		String month = now.toString().substring(5, 7);
		String date = now.toString().substring(8, 10);
		String str1 = year + month + date;
		//고유한 키값 12자리
		UUID uuid = UUID.randomUUID();
		String str2 = uuid.toString().replace("-","").substring(0, 12);
		String buy_id = str1 + str2;
		vo.setBuy_id(buy_id);
		//구매 리스트를 생성
		List<BuyVO> buyList = new ArrayList<BuyVO>();
		BuyVO buy = null;
		// buy_date, delivery_state는 기본값을 사용
		for(CartVO cart : cartList){
			buy = new BuyVO();
			buy.setBuy_id(buy_id); 
			buy.setBuyer(cart.getBuyer());
			buy.setProduct_id(cart.getProduct_id());
			buy.setProduct_name(cart.getProduct_name());
			buy.setProduct_imageF(cart.getProduct_imageF()); 
			buy.setBuy_price(cart.getBuy_price());
			buy.setBuy_count(cart.getBuy_count());
			buy.setAccount(vo.getAccount());
			buy.setDelivery_name(vo.getDelivery_name());
			buy.setDelivery_tel(vo.getDelivery_tel());
			buy.setDelivery_address1(vo.getDelivery_address1());
			buy.setDelivery_address2(vo.getDelivery_address2());
			buyList.add(buy);
		}
		
		//구매 목록 추가, 카트목록에서 삭제
		buyService.insertBuy(buyList, cartList);
		session.removeAttribute("cartListSession");
		//카트 리스트에서 
		return "redirect:/mall/buy/getBuyList";
	}
		
	//구매 목록 조회
	@GetMapping("/getBuyList")
	public String getBuyList( Model model, HttpSession session) {
		log.info("{}", "getBuyList");
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/shop/login"; 
		
		List<BuyVO> buyList = buyService.getBuyList(member);
		
		for(BuyVO buy : buyList) {
			 buy.setBuy_id_count(buyService.getBuyIdCount(buy));
			 buy.setBuy_id_sum(buyService.getBuyIdSum(buy));
		}
		
		model.addAttribute("buyList", buyList);
		return "/mall/buy/getBuyList";
	}
	//구매 상세 조회
	@GetMapping("/getBuyDetail")
	public String getBuyDetail(BuyVO vo, Model model, HttpSession session) {
		log.info("{}", "getBuyDetail");
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/shop/login";
		
		model.addAttribute("buyList", buyService.getBuyDetail(vo));
		model.addAttribute("buy_id", vo.getBuy_id());
		
		 
		return "/mall/buy/getBuyDetail";
	}
	
	// 구매 검색 조회
	@GetMapping("/getBuyListSearch")
	public String getBuyListSearch(BuyVO vo, Model model, HttpSession session) {
		log.info("{}", "getBuyListSearch");
		//member 세션 확인
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) return "/mall/shop/login";
		
		
		vo.setBuyer(member.getMember_id());
		List<BuyVO> buyList = buyService.getBuyListSearch(vo);
		
		for(BuyVO buy : buyList) {
			 buy.setBuy_id_count(buyService.getBuyIdCount(buy));
			 buy.setBuy_id_sum(buyService.getBuyIdSum(buy));
		}
		
		model.addAttribute("buyList", buyList);
		return "/mall/buy/getBuyList";
	}
	
}
