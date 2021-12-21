package member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberService {
	
	@Autowired private SqlSession sql;

	@Override
	public int member_join(MemberVO vo) {
		String number = vo.getM_tel();
		vo.setM_tel( number.replace(",", "-") );
		return sql.insert("member.mapper.join", vo);
	}

	
	@Override
	public int member_update(MemberVO vo) {
		System.out.println(vo.getM_email());
		return sql.update("member.mapper.update", vo);
	}

	@Override
	public int member_delete(String m_email) {
		return sql.delete("member.mapper.delete", m_email);
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean member_id_check(String id) {
		return (Integer) sql.selectOne("member.mapper.id_check", id) == 0 ? true : false;
	}

	@Override
	public boolean member_email_check(String email) {
		return (Integer)sql.selectOne("member.mapper.email_check", email) == 0 ? true : false;
	}

	@Override
	public int authentication_email(HashMap<String, String> map) {
		return sql.insert("member.mapper.codeinsert", map);
	}

	@Override
	public int authentication_result(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.emailcodchk", map);
		
	}

	@Override
	public String find_id(String m_email) {
		return sql.selectOne("member.mapper.find_id", m_email);
	}

	@Override
	public int issue_pw(HashMap<String, String> map) {
		return (Integer)sql.selectOne("member.mapper.issue_pw", map);
	}


	@Override
	public int update_issue_pw(HashMap<String, String> update_pw) {
		System.out.println(update_pw.get("m_pw"));
		System.out.println(update_pw.get("m_email"));
		
		return (Integer)sql.update("member.mapper.update_pw", update_pw);
		
	}


	@Override
	public List<MemberVO> member_list(MemberVO vo) {
		return sql.selectList("member.mapper.list", vo);
	}


	@Override
	public MemberVO member_detail(String m_email) {
		return sql.selectOne("member.mapper.detail", m_email);
	}

}
