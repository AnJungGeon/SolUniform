package com.soluniform.view.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soluniform.biz.cart.CartService;
import com.soluniform.biz.cart.CartVO;
import com.soluniform.biz.member.MemberVO;
import com.soluniform.biz.product.ProductService;
import com.soluniform.biz.product.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall/cart")
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	
	@PostMapping("/insertCart")
	public String insertCart(CartVO vo, HttpSession session) {
		log.info("{}", "insertCart");
		//member 세션 확인
		if(session.getAttribute("member") == null) return "/mall/member/login";
		
		//카트 확인 -> 카트에 없는 상품이면 추가 또는 카트에 있는 상품이면 수량 없데이트
		CartVO cart = cartService.getCart(vo);
		if(cart == null) {
			cartService.insertCart(vo);
		}else {
			vo.setCart_id(cart.getCart_id());
			vo.setBuy_count(cart.getBuy_count());
			cartService.updateCart(vo);
		}
		
		return "redirect:/mall/cart/getCartList";
	}
	
	//카트 수량 변경
	@GetMapping("/updateCart")
	public String updateCart(CartVO vo , HttpSession session) {
		log.info("{}", "updateCart");
		//member 세션 확인
		if(session.getAttribute("member") == null) return "/mall/member/login";
		
		
		vo.setCart_id(vo.getCart_id());
		vo.setBuy_count(vo.getBuy_count());
		cartService.updateCart(vo);
		
		return "redirect:/mall/cart/getCartList";
	}
	
	//카트 삭제(1개) - 각 상품의 삭제 아이콘
	@GetMapping("/deleteCartOne")
	public String deleteCartOne(CartVO vo , HttpSession session) {
		log.info("{}", "deleteCartOne");
		//member 세션 확인
		if(session.getAttribute("member") == null) return "/mall/member/login";
		
		
		vo.setCart_id(vo.getCart_id());
		cartService.deleteCartOne(vo);
		
		return "redirect:/mall/cart/getCartList";
	}
	
	//카트 삭제(여러 개 또는 전체) - 체크 박스
	@GetMapping("/deleteCartAll")
	public String deleteCartAll( @RequestParam String cart_id, HttpSession session) {
		log.info("{}", "deleteCartAll");
		
		//member 세션 확인
		if(session.getAttribute("member") == null) return "/mall/member/login";
		
		List<Integer> cartIdList = new ArrayList<Integer>();
		StringTokenizer st = new StringTokenizer(cart_id,",");
		while(st.hasMoreTokens()) {
			cartIdList.add(Integer.parseInt(st.nextToken()));
		}
			cartService.deleteCartAll(cartIdList);
		return "redirect:/mall/cart/getCartList";
		
		
	}
	
	
	
	@GetMapping("/getCartList")
	public String getCartList(CartVO vo, Model model, HttpSession session) {
		log.info("{}", "getCartList");
		//member세션 확인
		if(session.getAttribute("member")==null)return "/mall/member/login";
		
		//member 세션 획득
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setBuyer(member.getMember_id());
		
		
		List<CartVO> cartList = cartService.getCartList(vo);
		model.addAttribute("cartList", cartList);
		// 구매 수량과 재고수량 비교 체크
		// 1이면 재고수량이 많음 -> 구매 가능
		// 0이면 구매수량이 많음 -> 구매 불가(구매수량 변경 요망)
		List<Integer> check_count = new ArrayList<Integer>();
		List<Integer> p_count_list = new ArrayList<Integer>();
		for(CartVO cart : cartList) {
			ProductVO p = new ProductVO();
			p.setProduct_id(cart.getProduct_id());
			
			ProductVO p2 = productService.getProduct(p);
			int product_count = p2.getProduct_count();
			p_count_list.add(product_count);
			
			if(product_count >= cart.getBuy_count()) check_count.add(1);
			else check_count.add(0);
			
		}
		
			
		model.addAttribute("check_count", check_count);
		model.addAttribute("p_count_list", p_count_list);
		
		return "/mall/cart/getCartList";
	}
	
	
	
	
}
