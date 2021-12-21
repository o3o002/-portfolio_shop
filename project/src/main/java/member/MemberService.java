package member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	List<MemberVO> member_list(MemberVO vo);	//전체회원정보
	MemberVO member_detail(String m_email); //회원정보 가져오
	int member_join(MemberVO vo); //회원가입 회원정보 저장
	
	int member_update(MemberVO vo);//내정보수정에서 회원정보수정 저장
	int member_delete(String m_email);//회원탈퇴시 회원정보 삭제
	MemberVO member_login(HashMap<String, String> map);//로그인 처리
	
	boolean member_id_check(String id);//아이디 중복확인
	boolean member_email_check(String email);//이메일 중복확인 
	
	String find_id(String m_email); //아이디 찾기
	int issue_pw(HashMap<String, String> map); //아이디와 이메일로 비밀번호 임시발급
	int update_issue_pw(HashMap<String, String> update_pw);	//임시 비밀번호로 업데이트

	int authentication_email(HashMap<String, String> map);	//인증메일 코드 저장
	int authentication_result(HashMap<String, String>map);	//인증메일 인증번호 체크
}
