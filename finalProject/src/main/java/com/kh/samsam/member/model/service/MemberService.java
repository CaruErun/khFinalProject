package com.kh.samsam.member.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.member.model.vo.Member;
import com.kh.samsam.member.model.vo.MemberChart;

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




	

}
