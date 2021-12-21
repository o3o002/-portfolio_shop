package review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BoardVO;

@Service
public class ReviewServiceImple implements ReviewService {
	
	@Autowired ReviewDAO dao;
	@Override
	public ReviewPage review_list(ReviewPage page) {
		return dao.review_list(page);
	}

	@Override
	public void review_insert(ReviewVO vo) {
		dao.review_insert(vo);
	}

	@Override
	public void review_delete(int review_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reivew_reply(ReviewVO vo) {
		dao.reivew_reply(vo);
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
		return dao.my_review_list(m_id);
	}

}
