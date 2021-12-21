package cutomer;

import java.util.List;

import member.MemberVO;

public interface CustomerService {
	
	List<MemberVO> cusotmer_list(); //고객목록 조회
	MemberVO customer_detail(String id);
	void customer_update(MemberVO vo);
	void customer_delete(String id);
	
}
