package com.soluniform.view.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soluniform.biz.product.PagingVO;
import com.soluniform.biz.product.ProductService;
import com.soluniform.biz.product.ProductVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mall/shop/")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	//리그 분류 코드 -> 리그 분류 문자열 변경
	//리그 분류 처리
	String[] l_k = {"000", "100", "110", "120", "130", "140", "200"};
	String[] l_v = {"전체 상품", "프리미어리그", "분데스리가", "세리에A", "리그1","라리가","국가대표"};
	
	//상품 분류 코드 -> 상품 분류 문자열 변경
	//상품 분류 처리
	String[] p_k = {"01", "02", "03", "04"};
	String[] p_v = {"상의", "하의", "양말", "기타"};
	
	
	
	//리그분류 코드 -> 문자열 변경
	private String changeLeagueKind(String league_kind) {
		String str_league_kind = "";
		
		for(int i=0; i<l_k.length; i++) {
			if(l_k[i].equals(league_kind)) str_league_kind = l_v[i];
		}
		return str_league_kind;
	}
	
	//상품분류 코드 -> 문자열 변경
		private String changeProductKind(String product_kind) {
			String str_product_kind = "";
			
			for(int i=0; i<p_k.length; i++) {
				if(p_k[i].equals(product_kind)) str_product_kind = p_v[i];
			}
			return str_product_kind;
		}
	
		
	
	//쇼핑몰 메인
	@GetMapping("/shopMain")
	public String getProductMain(ProductVO vo, Model model, @RequestParam(defaultValue="1") String pageNum){
		log.info("{}","getProductMain");
		/*신상품 - bxSlider*/
		//신상품 목록 - 각 분류별로 최신상품 2개씩 저장(6*2=12)
		 vo.setKind_count(2); 
		 model.addAttribute("productListNew", productService.getProductListNew(vo));
		//추천 상품 bxSlider - 각 상품 분류별 할인률 순으로 3개씩 저장 (6*3=18)
		 vo.setKind_count(3);
		 model.addAttribute("productListGood", productService.getProductListGood(vo));
		 //리그 분류 처리
		String league_kind = vo.getLeague_kind();
		if(league_kind == null) league_kind = "000";
		 //상품 분류 처리
		String product_kind = vo.getProduct_kind();
		if(product_kind == null) product_kind = "000"; 	
		//리그 분류 코드 -> 문자열 변경
		String str_league_kind = changeLeagueKind(league_kind);
		vo.setLeague_kind(league_kind);
		int leagueCount = productService.getLeagueListKindCount(vo);
		//상품 분류 코드 -> 문자열 변경
		String str_product_kind = changeProductKind(product_kind);
		vo.setProduct_kind(product_kind);
		//페이징 객체
		PagingVO paging = new PagingVO(pageNum, leagueCount);
		model.addAttribute("paging", paging);
		vo.setStartRow(paging.getStartRow());
		vo.setEndRow(paging.getEndRow());
		//리그 분류목록을 변경하여 처리
		List<ProductVO> leagueListKind = productService.getLeagueListKind(vo);
		model.addAttribute("leagueListKind", leagueListKind);	
		//model
		model.addAttribute("l_k", l_k);
		model.addAttribute("l_v", l_v);
		model.addAttribute("p_k", p_k);
		model.addAttribute("p_v", p_v);
		
		model.addAttribute("league_kind", league_kind );
		model.addAttribute("str_league_kind", str_league_kind );
		model.addAttribute("str_product_kind", str_product_kind );
		return "/mall/shop/shopMain";
		}
	
	
	@GetMapping("/shopContent")
	public String getProductContent(ProductVO vo , Model model) {
		log.info("{}","getProductContent");
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product", productService.getProduct(vo));
		/*신상품 - bxSlider*/
		// 상세보기 상품과 같은 상품분류 10개
		vo.setKind_count(10); 
		System.out.println(vo);
		model.addAttribute("productListRecom", productService.getProductListRecom(vo));
		/*추천상품 - bxSlider*/
		// 상세보기 상품과 같은 리그분류 10개
		vo.setKind_count(10); 
		model.addAttribute("leagueListNew", productService.getLeagueListNew(vo));
		int buy_price = product.getProduct_price() - (product.getProduct_price()*product.getDiscount_rate()/100);
		//전체 목록 또는 상품 분류별 목록 -> 000은 전체 목록
		String product_kind = product.getProduct_kind();
		if(product_kind == null) product_kind = "000";
		String str_product_kind = changeProductKind(product_kind);
		String league_kind = product.getLeague_kind();
		if(league_kind == null) league_kind = "000";
		String str_league_kind = changeLeagueKind(league_kind);
		//model
		model.addAttribute("l_k", l_k);
		model.addAttribute("l_v", l_v);
		model.addAttribute("p_k", p_k);
		model.addAttribute("p_v", p_v);
		model.addAttribute("str_league_kind", str_league_kind );
		model.addAttribute("str_product_kind", str_product_kind );
		model.addAttribute("buy_price", buy_price);
		return "/mall/shop/shopContent";
	}
	
	//키워드 검색 - 상품명, 브랜드 명
	@GetMapping("/shopProductSearch")
	public String shopProductSearch(ProductVO vo, Model model, @RequestParam(defaultValue="1") String pageNum ) {
		log.info("{}","getProductSearch");
		//신상품 목록 - 각 분류별로 최신상품 5개씩 저장(13* 5=65)
		vo.setKind_count(5); 
		 model.addAttribute("productListNew", productService.getProductListNew(vo));
		//리그 분류 처리
		String league_kind = vo.getLeague_kind();
		if(league_kind == null) league_kind = "000";
		 //상품 분류 처리
		String product_kind = vo.getProduct_kind();
		if(product_kind == null) product_kind = "000"; 	
		//리그 분류 코드 -> 문자열 변경
		String str_league_kind = changeLeagueKind(league_kind);
		vo.setLeague_kind(league_kind);
		//상품 분류 코드 -> 문자열 변경
		String str_product_kind = changeProductKind(product_kind);
		vo.setProduct_kind(product_kind);
		//상품 목록 개수
		int leagueCount = productService.getProductSearchCount(vo);
		// 페이징 객체
		PagingVO paging = new PagingVO(pageNum, leagueCount); 
		model.addAttribute("paging", paging);
		//상품 목록 리스트
		vo.setStartRow(paging.getStartRow());
		vo.setEndRow(paging.getEndRow());
		//상품 분류목록을 변경하여 처리
		List<ProductVO> productList = productService.getProductSearch(vo);
		model.addAttribute("productList", productList);
		 System.out.println(leagueCount);
		model.addAttribute("l_k", l_k);
		model.addAttribute("l_v", l_v);
		model.addAttribute("p_k", p_k);
		model.addAttribute("p_v", p_v);
		model.addAttribute("league_kind", league_kind );
		model.addAttribute("str_league_kind", str_league_kind );
		model.addAttribute("str_product_kind", str_product_kind );
		model.addAttribute("keyword", vo.getKeyword());
		return "/mall/shop/shopProductSearch";
	}
	
	@GetMapping("/shopProductMenuGood")
	public String shopProductMenuGood(ProductVO vo, Model model, @RequestParam(defaultValue="1") String pageNum) {
		log.info("{}","getProductMenuGood");
		 //리그 분류 처리
		String league_kind = vo.getLeague_kind();
		if(league_kind == null) league_kind = "000";
		 //상품 분류 처리
		String product_kind = vo.getProduct_kind();
		if(product_kind == null) product_kind = "000"; 	
		//리그 분류 코드 -> 문자열 변경
		String str_league_kind = changeLeagueKind(league_kind);
		vo.setLeague_kind(league_kind);
		int leagueCount = productService.getLeagueListKindCount(vo);
		//상품 분류 코드 -> 문자열 변경
		String str_product_kind = changeProductKind(product_kind);
		vo.setProduct_kind(product_kind);
		int productCount = productService.getLeagueListKindCount(vo);
		//상품 분류목록을 변경하여 처리
		 List<ProductVO> leagueListKind = productService.getLeagueListKind(vo);
		 model.addAttribute("leagueListKind", leagueListKind);
		//페이징 객체
		PagingVO paging = new PagingVO(pageNum, leagueCount);
		model.addAttribute("paging", paging);
		//추천 상품 목록
		vo.setStartRow(paging.getStartRow());
		vo.setEndRow(paging.getEndRow());
		 List<ProductVO> productMenuGood = productService.getProductMenuGood(vo);
		 model.addAttribute("productMenuGood", productMenuGood);
		//model
		model.addAttribute("l_k", l_k);
		model.addAttribute("l_v", l_v);
		model.addAttribute("p_k", p_k);
		model.addAttribute("p_v", p_v);
		model.addAttribute("league_kind", league_kind );
		model.addAttribute("str_league_kind", str_league_kind );
		model.addAttribute("str_product_kind", str_product_kind );
		return "/mall/shop/shopProductMenuGood";
	}
	
	@GetMapping("/shopProductLeague")
	public String shopProductLeague(ProductVO vo, Model model, @RequestParam(defaultValue="1") String pageNum) {
		log.info("{}","getProductLeague");
		 //리그 분류 처리
		String league_kind = vo.getLeague_kind();
		if(league_kind == null) league_kind = "000";
		 //상품 분류 처리
		String product_kind = vo.getProduct_kind();
		if(product_kind == null) product_kind = "000"; 	
		//리그 분류 코드 -> 문자열 변경
		String str_league_kind = changeLeagueKind(league_kind);
		vo.setLeague_kind(league_kind);
		int leagueCount = productService.getLeagueListKindCount(vo);
		//상품 분류 코드 -> 문자열 변경
		String str_product_kind = changeProductKind(product_kind);
		vo.setProduct_kind(product_kind);
		int productCount = productService.getLeagueListKindCount(vo);
		//페이징 객체
		PagingVO paging = new PagingVO(pageNum, leagueCount);
		model.addAttribute("paging", paging);
		vo.setStartRow(paging.getStartRow());
		vo.setEndRow(paging.getEndRow());
		//상품 분류목록을 변경하여 처리
		 List<ProductVO> leagueListKind = productService.getLeagueListKind(vo);
		 model.addAttribute("leagueListKind", leagueListKind);
		//model
		model.addAttribute("l_k", l_k);
		model.addAttribute("l_v", l_v);
		model.addAttribute("p_k", p_k);
		model.addAttribute("p_v", p_v);
		model.addAttribute("league_kind", league_kind );
		model.addAttribute("str_league_kind", str_league_kind );
		model.addAttribute("str_product_kind", str_product_kind );		
		return "/mall/shop/shopProductLeague";
	}
	
}
