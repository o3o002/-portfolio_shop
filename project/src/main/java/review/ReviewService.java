package review;

import java.util.List;

import board.BoardVO;

public interface ReviewService {
	
	ReviewPage review_list(ReviewPage page);	//리뷰 전체
	void review_insert(ReviewVO vo);	//리뷰 쓰기
	void review_delete(int review_num);	//리뷰 지우기
	
	void review_reply_list(int root);	//댓글 목록
	void review_detail(int review_num); // 리뷰 상세보
	
	List<ReviewVO> my_review_list(String m_id); 	//내가 쓴 리뷰
	
	//답글관련
	void reivew_reply(ReviewVO vo);	//답글저장
	void reivew_reply_update(int review_num);	//댓글 수정하기 

}
