//package com.petmily.service;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.petmily.dao.CartDAO;
//import com.petmily.dto.Cart;
//import com.petmily.dto.Product;
//
//@Service
//public class CartServiceImpl implements CartService {
//	
//	@Autowired
//	CartDAO cartDao;
//
//	@Override
//	public void insertProdInCart(Cart cart) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public List<Cart> selectCountInCart(String user_id, int Prod_num) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public boolean updateCartProd(Cart cart) {
//		boolean result=true;
//		cartDao.updateCartProd(cart);
//		return result;
//	}	//업데이트
//	
//	@Override
//	public void deleteCart(int cart_id) {
//		cartDao.deleteCartProd(cart_id);
//	}	//장바구니 삭제
//
//	@Override
//	public void addProdInCart(Cart cart) {
//		cartDao.insertProdInCart(cart);
//	}	//장바구니에 추가	
//	
//	@Override
//	public boolean findCartProd(Cart cart) throws Exception {
//		return cartDao.selectCountInCart(cart);
//	}	// Cart 테이블에 추가하기 전에 동일한 상품 번호의 개수를 조회  
//
//	@Override
//	public Map<String, List> myCartList(Cart cart) throws Exception {
//		Map<String,List> cartMap=new HashMap<String,List>();
//		List<Cart> myCartList=cartDao.selectCartList(cart);
//		if(myCartList.size()==0){ //장바구니에 저장된 상품이없는 경우임
//			return null;
//		}
//		List<Product> myProdList=cartDao.selectProdList(myCartList);
//		cartMap.put("myCartList", myCartList);
//		cartMap.put("myProdList", myProdList);
//		return cartMap;
//	}
//}