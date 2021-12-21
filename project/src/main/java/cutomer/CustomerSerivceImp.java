package cutomer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberVO;

@Service
public class CustomerSerivceImp implements CustomerService {
	
	@Autowired private CustomerDAO dao;
	@Override
	public List<MemberVO> cusotmer_list() {
		return dao.cusotmer_list();
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
