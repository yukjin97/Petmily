package com.petmily.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petmily.dao.MembershipDAO;
import com.petmily.dao.OrderDAO;
import com.petmily.dao.UserDAO;
import com.petmily.dto.Membership;
import com.petmily.dto.Order;
import com.petmily.dto.PageInfo;
import com.petmily.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	UserDAO userDAO;
	@Autowired
	MembershipDAO membershipDAO;
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public User myPageInfo(String user_id) throws Exception {
		User user = userDAO.queryUser(user_id);
		return user;
	}

	@Override
	public void userModify(User user) throws Exception {	
		User ruser = userDAO.queryUser(user.getUser_id());	
		if (user.getUser_pwd().equals(ruser.getUser_pwd())) { //현재 비밀번호 맞는지 체크
			userDAO.updateUser(user);// 업데이트 된 db
		} else {
			throw new Exception("수정권한 없음");
		}
	}
	
	@Override
	public void userAddressModify(User user) throws Exception {	
		userDAO.updateUserAddress(user);
	}

	@Override
	public Membership myMemberShipInfo(String user_id) throws Exception {
		Membership mem = membershipDAO.queryUserMemberShip(user_id);
		return mem;
	}

	@Override
	   public List<Order> orderDetail(String user_id, int page, PageInfo pageInfo) throws Exception {
		int listCount=orderDAO.orderdetailCount(user_id);
		//table에 있는 모든 row 개수
		
		int maxPage=(int)Math.ceil((double)listCount/10);
		//그 개수를 10으로 나누고 올림처리하여 페이지 수 계산
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 10개 보여주고
		//아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		
		int endPage=startPage+10-1;
		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		//컨트롤러가 생성한 pageInfo 객체를 해당 메서드의 매개변수로 넘겨준다,
		//메서드는 해당 객체의 값을 setter로 초기화하면 컨트롤러에서 초기화된 값을
		//getter로 받을 수 있다.
		//즉, getBoardList를 호출한 컨트롤러에 생성된(new) pageInfo 객체에 초기화하는 것이다.
		
		int startrow=(page-1)*10+1;
		
		return orderDAO.orderdetailList(startrow,user_id);
	   }

}
