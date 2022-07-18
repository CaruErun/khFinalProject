package com.kh.samsam.member.model.service;

import com.kh.samsam.member.model.vo.MemberChart;

public interface MemberService {

	int selectNewMember(MemberChart c);

	int selectRemoveMember(MemberChart c);

}
