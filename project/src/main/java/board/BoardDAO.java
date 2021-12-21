package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import product.ProductPage;

	

@Repository
public class BoardDAO implements BoardService {
	
	@Autowired private SqlSession sql;

	@Override
	public void board_insert(BoardVO vo) {
		sql.insert("board.mapper.insert", vo);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		
		page.setTotalList((Integer) sql.selectOne("board.mapper.totalList"));
		page.setList(sql.selectList("board.mapper.boardlist",page));
		
		return page;
	}

	@Override
	public BoardVO board_detail(int id) {
		return sql.selectOne("board.mapper.detail", id);
	}

	@Override
	public void board_update(BoardVO vo) {
		sql.update("board.mapper.update", vo);
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
	public void board_reply_insert(BoardVO vo) {
		sql.insert("board.mapper.reply_insert", vo);
	}

	@Override
	public List<BoardVO> board_detail_list(String m_id) {
		return sql.selectList("board.mapper.detaillist", m_id);
	}

	

}
