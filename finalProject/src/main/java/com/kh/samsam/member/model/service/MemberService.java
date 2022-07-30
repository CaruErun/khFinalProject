package com.kh.samsam.member.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;
import com.kh.samsam.product.model.vo.Product;

public interface MemberService {

	int selectNewMember(MemberChart c);

	int selectRemoveMember(MemberChart c);

	//로그인 서비스 (select)
	Member loginMember(Member m);

	//회원가입 서비스 (insert)
		int insertMember(Member m);
		

	//비밀번호 변경
	int pwdChange(Member m);

	static void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		// TODO Auto-generated method stub
		
	}

	//마이페이지 정보 수정 
	int updateMember(Member m);

	//마이페이지 탈퇴
	int deleteMember(String userId);

	// 신고 당한 회원 정지 - banCount 조회
		int selectBanCount(String reportedId);
		
		// 신고 당한 회원 정지
		int banMember(Member m);

		// 신고 status N으로
		int deleteReport(int reportNo);

		int nobanMember(int reportNo);
		
		
	//페이징 처리 게시글 count
	int selectPListCount(String userId);

	//찜리스트 출력
	ArrayList<Product> pickList(String userId, PageInfo pi);




	

}
