package com.kh.samsam.board.model.service;

import java.util.ArrayList;

import com.kh.samsam.common.model.vo.PageInfo;
import com.kh.samsam.board.model.vo.NoticeFaq;
import com.kh.samsam.board.model.vo.Qna;

public interface BoardService {

	// ============ 공지사항 ============
	int selectNoticeListCount();

	ArrayList<NoticeFaq> selectNoticeList(PageInfo pi);

	int increaseNoticeCount(int nfNo);

	NoticeFaq selectNotice(int nfNo);

	int updateNotice(NoticeFaq n);

	int insertNotice(NoticeFaq n);

	int deleteNotice(int nfNo);

	// ============ FAQ ============
	int selectFaqListCount();

	ArrayList<NoticeFaq> selectFaqList(PageInfo pi);

	int increaseFaqCount(int nfNo);

	NoticeFaq selectFaq(int nfNo);

	int updateFaq(NoticeFaq f);

	int insertFaq(NoticeFaq f);

	int deleteFaq(int nfNo);


	// ============ QNA ============
	int selectQnaListCount();

	ArrayList<Qna> selectQnaList(PageInfo pi);

	Qna selectQna(int qno);

	int insertQnaAns(Qna q);

	

}








