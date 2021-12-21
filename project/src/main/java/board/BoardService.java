package board;

import java.util.List;

import product.ProductPage;

public interface BoardService {
	
	void board_insert(BoardVO vo);	//방명록 글쓰기
	
	BoardPage board_list(BoardPage page);	// 방명록 전체
	BoardVO board_detail(int id);	// 방명록 상세 불러오
	void board_update(BoardVO vo);	// 방명록 수정하기 
	void board_delete(int id);	//방명록 글 삭제 처
	
	List<BoardVO> board_detail_list(String m_id); //방명록불러오기
	//답글관련
	
	void board_read(int id);
	void board_reply_insert(BoardVO vo); //답글저장
	
	
	

}
