package com.petmily.controller.product;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.petmily.dto.Order;
import com.petmily.dto.Product;
import com.petmily.dto.User;
import com.petmily.service.CartService;
import com.petmily.service.OrderService;
import com.petmily.service.ProductService;
import com.petmily.service.UserService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;

	@Autowired
	OrderService orderService;
	
	@Autowired
	UserService userService;	
	
	@GetMapping("/mypageinfo")
	public String orderComplete() {
		String user_id = (String) session.getAttribute("user_id");
		try {
			List<Cart> cartList = cartService.cartQueryById(user_id);
			User user = userService.queryUser(user_id);
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				Product prod= cartService.prodQueryByProdNum(prod_num);
				Order order = new Order(prod.getProd_num(), cartList.get(i).getCart_amount(), 0, user_id, null, null,user.getUser_totaddress(), prod.getProd_title(), prod.getProd_price());
				orderService.insertCartList(order);
				orderService.cartPayment(order, order.getProd_num());
				orderService.cartPayment2(order.getProd_num());
			}
			
			
			cartService.deleteCartAll(user_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/mypageinfo";
	}
	
	@GetMapping("/payment")    // 유저 정보 가져오기
	public String pay(Model model) {
		String user_id = (String) session.getAttribute("user_id");
		try {
			List<Cart> cartList = cartService.cartQueryById(user_id);
			model.addAttribute("cartList", cartList);

			List<Product> prodList = new ArrayList<Product>();
			int totalPrice = 0; 
			
			for (int i = 0; i < cartList.size(); i++) {
				int prod_num = cartList.get(i).getProd_num();
				Product prod= cartService.prodQueryByProdNum(prod_num);
				prodList.add(i, prod);
				totalPrice += cartList.get(i).getCart_amount() * prod.getProd_price();
			}
			model.addAttribute("prodList", prodList);
			
			User user = userService.queryUser(user_id);
			model.addAttribute("user", user);
			model.addAttribute("totalPrice", totalPrice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "payment";
	}
	
	
	
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
	public int GetTotal(@RequestParam("objParams") String objParams,Model model) {
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

	@ResponseBody    // 목록에서 상품 삭제
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
	@PostMapping("/insertcart")  //스토어에서 장바구니로 상품 담기
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
	
	@PostMapping("")  //결제 후 장바구니 자동 비우기
	public ModelAndView cartPayment() {

		ModelAndView mav = new ModelAndView("redirect:/mypageinfo");
		String user_id = (String) session.getAttribute("user_id");
		try {
			List<Cart> cartList = cartService.cartQueryById(user_id);
			List<Order> orderList = new ArrayList<Order>();
			for(Cart cart: cartList) {
				Order order = new Order();
				order.setProd_num(cart.getProd_num());
				order.setOrder_count(cart.getCart_amount());
				order.setUser_id(user_id);
				orderList.add(order);
			}
			for(Order order: orderList) {
				orderService.insertCartList(order);
				orderService.cartPayment(order, order.getProd_num());
				orderService.cartPayment2(order.getProd_num());
			}
			cartService.deleteCartAll(user_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
}
