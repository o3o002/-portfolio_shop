package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.ProductPage;

@Service
public class BoardServiceImple implements BoardService {
	
	@Autowired BoardDAO dao;
	
	

	@Override
	public BoardVO board_detail(int id) {
		return dao.board_detail(id);
	}

	@Override
	public void board_update(BoardVO vo) {
			dao.board_update(vo);
	}

	@Override
	public void board_delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void board_read(int id) {
		// TODO Auto-generated method stub

	}


	@Override
	public void board_insert(BoardVO vo) {
		dao.board_insert(vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public void board_reply_insert(BoardVO vo) {
		dao.board_reply_insert(vo);
	}

	@Override
	public List<BoardVO> board_detail_list(String m_id) {
		return dao.board_detail_list(m_id);
	}

}
