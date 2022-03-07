package com.petmily.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/cart")

public class CartController {
//	@Autowired
//	CartService cartService;
//
//	@Autowired
//	Cart cart;
//	
//	@Autowired
//	Product product;
//
//	@Autowired
//	User user;
//
//
//	@PostMapping(value = "/addProdInCart")
//	public @ResponseBody String addProdInCart(@RequestParam("prod_num") int prod_num, HttpServletRequest request,      // <--전송된 상품번호를 받는다!
//			HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		user = (User) session.getAttribute("userInfo");
//		String user_id = user.getUser_id();
//		
//		cart.setUser_id(user_id);    //장바구니에 등록하기 전, 이미 등록되어있는 상품인지를 확인한다.
//		cart.setProd_num(prod_num);
//		boolean isAreadyExisted=cartService.findCartProd(cart);  //상품 번호가 Cart 테이블에 있는지를 조회...
//	// 얘가 xml에 id문을 받음 -^-
//		
//		if(isAreadyExisted==true){     // 상품 번호가 이미 Cart 테이블에 있으면 메세지를 브라우저로 전송, 없으면 Cart테이블에 추가!
//			return "already_existed";
//		}else{
//			cartService.addProdInCart(cart);
//			return "add_success";          //    test.jsp 에이쟉스로 전달
//		}
//	}
	}       

