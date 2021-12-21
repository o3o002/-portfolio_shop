package member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDAO dao;
	@Override
	public int member_join(MemberVO vo) {
		return dao.member_join(vo);
	}



	@Override
	public int member_update(MemberVO vo) {
		return dao.member_update(vo);
	}

	@Override
	public int member_delete(String m_email) {
		return dao.member_delete(m_email);
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public boolean member_id_check(String id) {
		return dao.member_id_check(id);
	}

	@Override
	public boolean member_email_check(String email) {
		return dao.member_email_check(email);
	}

	@Override
	public int authentication_email(HashMap<String, String> map) {
		return dao.authentication_email(map);
	}

	@Override
	public int authentication_result(HashMap<String, String> map) {
		return dao.authentication_result(map);
	}

	@Override
	public String find_id(String m_email) {
		return dao.find_id(m_email);
	}

	@Override
	public int issue_pw(HashMap<String, String> map) {
		return dao.issue_pw(map);
	}



	@Override
	public int update_issue_pw(HashMap<String, String> update_pw) {
		return dao.update_issue_pw(update_pw);
	}



	@Override
	public List<MemberVO> member_list(MemberVO vo) {
		return dao.member_list(vo);
	}



	@Override
	public MemberVO member_detail(String m_email) {
		return dao.member_detail(m_email);
	}

}
