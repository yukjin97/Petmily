package com.petmily.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.CartDAO;
import com.petmily.dto.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDao;

	@Override
	public void insertProdInCart(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Cart> selectCountInCart(String user_id, int Prod_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateCartProd(Cart cart) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void deleteCart(int cart_amount) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addProdInCart(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean findCartProd(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, List> myCartList(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
//	@Override
//	public void selectCountInCart(String user_id, int Prod_num) {
//		// user_id를 통해서 특정 상품이 장바구니에 존재하는지 조회
//		// ***리턴값 확인
//	}
//
//	@Override
//	public void insertProdInCart(Cart cart) { // cart테이블에 상품정보를 추가
//		cartDao.insertProdInCart(cart);
//		int cart_num = selectMaxCartNum();
//		cart.setCart_num(cart_num);
//		sqlSession.insert("mapper.cart.insertProdInCart", cart);
//	}
//
//	@Override
//	public boolean updateCartProd(Cart cart) {
//		boolean result = true;
//		cartDao.updateCartProd(cart);
//		return result;
//	} // 업데이트
//
//	@Override
//	public void deleteCart(int cart_id) {
//		cartDao.deleteCartProd(cart_id);
//	} // 장바구니 삭제
//
//	@Override
//	public void addProdInCart(Cart cart) {
//		cartDao.insertProdInCart(cart);
//	} // if문으로 추가된거. 장바구니에 추가
//
//	@Override
//	public boolean findCartProd(Cart cart) throws Exception {
//		// findCartProd메소드로 cart(dto)전달하고, selectCountInCart메소드 호출하면서 cart(dto)전달
//		return cartDao.selectCountInCart(cart);
//	} // Cart 테이블에 추가하기 전에 동일한 상품 번호의 개수를조회
//
//	@Override
//	public Map<String, List> myCartList(Cart cart) throws Exception {
//		Map<String, List> cartMap = new HashMap<String, List>();
//		List<Cart> myCartList = cartDao.selectCartList(cart); // cart테이블에서 장바구니 정보를 조회 / 장바구니 페이지에 표시할 장바구니 정보를 조회한다.
//		if (myCartList.size() == 0) { // 장바구니에 저장된 상품이없는 경우임, 0이면 장바구니에 아무것도 없다는 의미임
//			return null; // 장바구니에 상품이 없는 경우 null을 반환한다.
//		}
//		List<Product> myProdList = cartDao.selectProdList(myCartList); // cart 정보에 있는 prod_num로 상품정보를 조회하는 기능.
//		cartMap.put("myCartList", myCartList); // 장바구니 정보와 상품 정보를 cartMap에 저장하여 반환.
//		cartMap.put("myProdList", myProdList);
//		return cartMap; // 각각의 조회한 정보를 cartMap에 저장해서 컨트롤러로 반환함.
//	}
}
