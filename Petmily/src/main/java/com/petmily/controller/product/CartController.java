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
	
	@GetMapping("/payment")    // ?????? ?????? ????????????
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
	
	// ????????? ?????? ??? ?????? ??????
	@ResponseBody
	@PostMapping("/gettotal")
	public int GetTotal(@RequestParam("objParams") String objParams,Model model) {
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(objParams);
		System.out.println("??????");
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
			// ?????? ????????? ?????? ????????? ??????<
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
		
		// ?????? ????????? ??????
		return total; 
	}

	@ResponseBody    // ???????????? ?????? ??????
	@PostMapping("/deletecart")
	public String DeleteCart(@RequestParam("prod_id") String prod_id) {
		int prod_num = (int) Integer.parseInt(prod_id);
		String user_id = (String) session.getAttribute("user_id");
		try {
			cartService.deleteCart(prod_num, user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "???????????? ????????? ?????????????????????.";
		
	}
	
	@ResponseBody
	@PostMapping("/insertcart")  //??????????????? ??????????????? ?????? ??????
	public String InsertCart(@RequestParam("prod_num") int prod_num, @RequestParam("cart_amount") int cart_amount) {
		// prod_num : ??????????????? ?????? ?????? ??????
		// cart_amount : ??????????????? ?????? ?????? ??????
		String user_id = (String) session.getAttribute("user_id");
		// user_id : ??? ????????? 
		try {
			List<Cart> cartList=cartService.cartQueryById(user_id);
			for(Cart cart:cartList) {
				// ?????? ??????????????? ?????? ?????? ?????? ?????????
				if (cart.getProd_num() == prod_num) {
					System.out.println("??????????????? ?????? ?????? ?????? :" + cart_amount);
					System.out.println("?????? ??????????????? ?????? ?????? :" + cart.getCart_amount());
					cart_amount += cart.getCart_amount();
					System.out.println("??? ???????????? ???????????? ????????? :" + cart_amount);
					cartService.updateCart(prod_num, cart_amount, user_id);
					return "?????? ???????????? ?????? ?????? ???????????????. ??????????????? ???????????? ????????? ???????????????";
				}
			}
			cartService.insertCart(prod_num, cart_amount, user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "??????????????? ???????????????.";
		
	}
	
	@PostMapping("")  //?????? ??? ???????????? ?????? ?????????
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
