package cutomer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;

@Repository
public class CustomerDAO implements CustomerService{
	
	@Autowired private SqlSession sql;

	@Override
	public List<MemberVO> cusotmer_list() {
		return sql.selectList("customer.mapper.list");
	}

	@Override
	public MemberVO customer_detail(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void customer_update(MemberVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void customer_delete(String id) {
		// TODO Auto-generated method stub
		
	}

}
