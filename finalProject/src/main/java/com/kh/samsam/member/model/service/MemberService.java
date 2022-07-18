package com.kh.samsam.member.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.Bid;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;
import com.kh.samsam.member.model.vo.Postbox;
import com.kh.samsam.member.model.vo.Product;

public interface MemberService {

	int selectNewMember(MemberChart c);

	int selectRemoveMember(MemberChart c);

	//로그인 서비스 (select)
	Member loginMember(Member m);

	//회원가입 서비스 (insert)
		int insertMember(Member m);
		
	//이메일 @ 앞
	String emailFirst(String email);
	
	//이메일 @ 뒤
	String emailBack(String email);

	//폰 앞
	String phoneFirst(String phone);

	//폰 중간
	String phoneMiddle(String phone);

	//폰 뒤
	String phoneBack(String phone);

	//비밀번호 변경
	int pwdChange(Member m);

	static void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		// TODO Auto-generated method stub
		
	}

	//마이페이지 정보 수정 
	int updateMember(Member m);

	//마이페이지 탈퇴
	int deleteMember(String userId);

	//페이징 처리
	int selectListCount();

//	//리스트 조회 해오기
	ArrayList<Product> selectList(String userId, PageInfo pi);

	//운송장 등록
	int postInsert(Postbox p);
	
	//리스트 조회 해오기
	ArrayList<Postbox> selectListPost(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListAttend(String userId, PageInfo pi);

	//리스트 조회 해오기
	ArrayList<Bid> selectListBid(String userId, PageInfo pi);
	
//	//리스트 조회 해오기
//	ArrayList<Product> selectList(PageInfo pi);
}
