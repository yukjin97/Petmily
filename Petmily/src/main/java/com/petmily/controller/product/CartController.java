package com.petmily.controller.product;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.petmily.dto.Cart;
import com.petmily.dto.PageInfo;
import com.petmily.dto.Product;
import com.petmily.dto.Review;
import com.petmily.service.CartService;
import com.petmily.service.ProductService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;

	@Autowired
	HttpSession session;
	
	@GetMapping("")
	public String cartMain(Model model) {
		String user_id = (String) session.getAttribute("user_id");
		try {
			List<Cart> cartList = cartService.cartQueryById(user_id);
			model.addAttribute("cartList", cartList);
			
			
			List<Product> prodList = new ArrayList<Product>();
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				Product prod= cartService.prodQueryByProdNum(prod_num);
				prodList.add(i, prod);
			}
			model.addAttribute("prodList", prodList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "cart";
	}
	
	// 수량에 따른 총 금액 계산
	@ResponseBody
	@PostMapping("/gettotal")
	public int GetTotal(@RequestParam("objParams") String objParams) {
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(objParams);
		System.out.println("진입");
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = jsonParser.parse(objParams).getAsJsonObject();
		JsonArray jsonNumArr = jsonObj.getAsJsonArray("numList");
		JsonArray jsonQuanArr = jsonObj.getAsJsonArray("quanList");
		
		Gson gson = new Gson();
		ArrayList numList= gson.fromJson(jsonNumArr, ArrayList.class);	
		ArrayList quanList= gson.fromJson(jsonQuanArr, ArrayList.class);
		int total = 0;
		ArrayList priceList= new ArrayList();
		
		try {
			// 상품 번호를 통해 가격을 조회<
			for(int i=0;numList.size()>i;i++) {
				int prod_num = (int) Integer.parseInt((String) numList.get(i));
				int price = productService.selectPrice(prod_num);
				priceList.add(price);
				
				int quantity = (int) Integer.parseInt((String) quanList.get(i));
				System.out.println(quantity);
			}
			for(int j=0;priceList.size()>j;j++) {
				int a=  (int) priceList.get(j);
				int b =(int) Integer.parseInt((String) quanList.get(j));
				total += a * b;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 상품 수량을 조회
		return total; 
	}

	@ResponseBody
	@PostMapping("/deletecart")
	public String DeleteCart(@RequestParam("prod_id") String prod_id) {
		int prod_num = (int) Integer.parseInt(prod_id);
		String user_id = (String) session.getAttribute("user_id");
		try {
			cartService.deleteCart(prod_num, user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "선택하신 제품이 삭제되었습니다.";
		
	}
	
	@ResponseBody
	@PostMapping("/insertcart")
	public String InsertCart(@RequestParam("prod_num") int prod_num, @RequestParam("cart_amount") int cart_amount) {
		// prod_num : 장바구니에 담을 제품 번호
		// cart_amount : 장바구니에 담을 제품 수량
		String user_id = (String) session.getAttribute("user_id");
		// user_id : 내 아이디 
		try {
			List<Cart> cartList=cartService.cartQueryById(user_id);
			for(Cart cart:cartList) {
				// 내가 장바구니에 담아 놓은 상품 정보들
				if (cart.getProd_num() == prod_num) {
					System.out.println("장바구니에 담을 제품 수량 :" + cart_amount);
					System.out.println("지금 장바구니에 있는 수량 :" + cart.getCart_amount());
					cart_amount += cart.getCart_amount();
					System.out.println("이 수량으로 업데이트 됩니다 :" + cart_amount);
					cartService.updateCart(prod_num, cart_amount, user_id);
					return "이미 장바구니 담겨 있는 상품입니다. 장바구니에 선택하신 수량이 더해집니다";
				}
			}
			cartService.insertCart(prod_num, cart_amount, user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "장바구니에 담겼습니다.";
		
	}
}
