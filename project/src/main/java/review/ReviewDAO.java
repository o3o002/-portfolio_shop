package review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.BoardVO;

@Repository
public class ReviewDAO implements ReviewService {
	
	@Autowired SqlSession sql;

	@Override
	public ReviewPage review_list(ReviewPage page) {
		page.setTotalList((Integer) sql.selectOne("review.mapper.totalList") );
		page.setList(sql.selectList("review.mapper.reviewlist",page));
		return page;
	}

	@Override
	public void review_insert(ReviewVO vo) {
		sql.insert("review.mapper.insert", vo);
	}

	@Override
	public void review_delete(int review_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void reivew_reply(ReviewVO vo) {
		sql.insert("review.mapper.reply_insert",vo);
	}

	@Override
	public void reivew_reply_update(int review_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void review_reply_list(int root) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void review_detail(int review_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ReviewVO> my_review_list(String m_id) {
		return sql.selectList("review.mapper.mylist",m_id);
	}

}
