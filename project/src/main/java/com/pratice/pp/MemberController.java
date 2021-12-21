package com.pratice.pp;

import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardServiceImple;
import common.CommonService;
import member.AuthenticationCodeVO;
import member.MemberServiceImpl;
import member.MemberVO;
import order.OrderServiceImpl;
import order.OrderdetailVO;
import review.ReviewServiceImple;
import review.ReviewVO;


@Controller
public class MemberController {
	
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private BoardServiceImple board;
	@Autowired private ReviewServiceImple reivew;
	@Autowired private OrderServiceImpl order;
	
	private String naver_clientid = "idIbCXLLmsaKZpj9cQ3T";
	@RequestMapping("/reviewlist.me")
	public String my_reviewlist(HttpSession session, Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("loginInfo");
		
		model.addAttribute("review", reivew.my_review_list(vo.getM_id()));
		return "mypage/reviewlist";
	}
	
	//내가 쓴 Q&A리스트 보기
	@RequestMapping("/qalist.me")
	public String my_qalist(Model model,HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		model.addAttribute("list", board.board_detail_list(member.getM_id()));
		return "mypage/boardlist";
	}
	
	@ResponseBody @RequestMapping(value = "/find_pw", produces = "text/html; charset= utf-8")
	public String find_pw(HttpSession session, HttpServletRequest request, String m_id, String email) {
		String msg = "<script type='text/javascript'>";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_email", email);
		
		int success = service.issue_pw(map);
		String temporary_pw = UUID.randomUUID().toString();
		temporary_pw = temporary_pw.toString().substring(0,6);
		
		if( success > 0) {
			sendemail_updatepw(m_id, email, temporary_pw, session);
			update_pw(email, temporary_pw);
			
			msg += "alert('입력하신 메일로 임시비밀번호가 발급되었습니다.');";
			msg += "location='" + request.getContextPath() + "/login';";
		} else {
			msg += "alert('가입된 회원정보가 없습니다. 아이디와 이메일을 확인해주세요. ');";
			msg += "history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
	//임시비밀번호 메일로 보내기 
	public void sendemail_updatepw(String m_id, String email, String temporary_pw, HttpSession session) {
		common.sendemailpw(m_id, email, temporary_pw, session);
	}
	
	//임시비밀번호 db에 저장 
	public void update_pw(String email, String temporary_pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_email", email);
		map.put("m_pw", temporary_pw);
		
		int success = service.update_issue_pw(map);
		
	}
	
	//아이디 찾기
	@ResponseBody @RequestMapping(value = "/find_id", produces = "text/html; charset= utf-8")
	public String find_id(HttpServletRequest request, String email) {
		String msg = "<script type='text/javascript'>";
		
		String success = service.find_id(email);
		
		if( success == null ) {
			msg += "alert('입력하신 정보로 가입된 아이디는 없습니다.');";
			msg += "history.go(-1)";
		} else {
			msg += "alert('아이디는 " + success + " 입니다.');";
			msg += "location='" + request.getContextPath() + "/login';";
		}
		msg += "</script>";
		return msg;
	}
	
	//비번찾기 페이지로 이동
	@RequestMapping("/find_pw_form")
	public String find_pw_form() {
		
		return "member/findpwformjsp";
	}
	//아이디찾기 페이지로 이동
	@RequestMapping("/find_id_form")
	public String find_id_form() {
		
		return "member/findidformjsp";
	}
	
	//회원정보 수정하기
	@RequestMapping("/update.me")
	public String modifyupdate(MemberVO vo) {
		String email = vo.getM_email();
		vo.setM_email(email.replace(",", ""));
		
		service.member_update(vo);
		
		
		
		return "redirect:/mypage";
	}
	
	//회원정보 수정 화면으로 이동
	@RequestMapping("/modify.me")
	public String modify(HttpSession session, Model model) {
		MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
		String number = loginInfo.getM_tel();
		String email = loginInfo.getM_email();
		
		String[] tel = number.split(",");
		
		for(int i =0; i < tel.length; i++) {
			model.addAttribute("tel" + i, tel[i]);
		}
		
		String[] mail = email.split("@");
 		model.addAttribute("email_id", mail[0]);
 		model.addAttribute("email_domain", mail[1]);
 		
		model.addAttribute("loginInfo", loginInfo);
		
		return "mypage/modify";
	}
	
	//내정보 화면으로 이동
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		List<OrderdetailVO> orderlist = order.my_order_list(member.getM_id());
		
		int ordercount = 0;
		int cancelcount = 0;
		
		for(int i = 0; i < orderlist.size(); i++) {
			if(orderlist.get(i).getOrder_status().equals("입금취소")) {
				cancelcount += 1;
			} else if (orderlist.get(i).getOrder_status().equals("입금대기")) {
				ordercount += 1;
			}
		}
		
		model.addAttribute("ordercount", ordercount);
		model.addAttribute("cancelcount", cancelcount);
		model.addAttribute("order", model);
		return "mypage/mypage";
	}
	
	
	@RequestMapping("/navercallback")
	public String naverCallback(HttpSession session, String state,
		@RequestParam(required = false) String code, @RequestParam(required = false) String error) {
		
		System.out.println("들어왔는지만 확인해주세요....");
		
		//상태토큰이 불일치하거나, 콜백실패로 에러발생시 토큰발급 불가
		String token = (String)session.getAttribute("state");
		if( !token.equals(state) || error!=null ) {
			return "redirect:/";
		}//if 
		
		//접근 토큰 발급
		// https://nid.naver.com/oauth2.0/token?grant_type=authorization_code
		//&client_id=jyvqXeaVOVmV
		//&client_secret=527300A0_COq1_XV33cf
		//&code=EIc5bFrl4RibFls1
		//&state=9kgsGTfH4j7IyAkg  
		
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
		url.append("&client_id=").append(naver_clientid);
		url.append("&client_secret=").append("wf9hhe0i0O");
		url.append("&code=").append(code);
		url.append("&state=").append(state);
		JSONObject json = new JSONObject( common.requestAPI(url) );
		
		String access_token = json.getString("access_token");
		String token_type = json.getString("token_type");
		//접근 토큰을 이용하여 프로필 API 호출하기
		//https://openapi.naver.com/v1/nid/me	
		url = new StringBuffer("https://openapi.naver.com/v1/nid/me");
		json = new JSONObject(common.requestAPI(url, token_type + " " + access_token));
		if( json.getString("resultcode").equals("00")) {
		
			//프로필정보는 responser에 있음
			json = json.getJSONObject("response");
			MemberVO vo = new MemberVO();
			vo.setSocialType("naver");
			vo.setM_id(json.getString("id"));
			
			vo.setM_name( json.getString("name"));
			vo.setM_gender( json.getString("gender").equals("F") ? "여" : "남");
			vo.setM_email( json.getString("email"));
		
			//네이버 아이디로 처음 로그인한 경우는 회원정보를 insert
			//			  이전에 로그인한 경우는 회원정보를 update
			//해당 네이버 아이디가 존재하는지 여부를 판단

			session.setAttribute("loginInfo", vo);
		}
		return "redirect:/";
	}
	

	//네이버 아이디로 로그인처리 요청
	@RequestMapping("/naverLogin")
	public String naverlogin(HttpSession session) {
		// https://nid.naver.com/oauth2.0/authorize?
		//response_type=code
		//&client_id=CLIENT_ID
		//&state=STATE_STRING
		//&redirect_uri=CALLBACK_URL
		
		//토큰으로 사용할 문자열을 랜덤하게 생성
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		StringBuffer url = new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("&client_id=").append(naver_clientid);
		url.append("&state=").append(state);
		url.append("&redirect_uri=").append("http://localhost/pp/navercallback");
		return "redirect:" + url.toString();
	}
	
	
	@RequestMapping("/kakaocallback")
	public String kakaocallback(HttpSession session, String state, @RequestParam(required = false) String code, @RequestParam(required = false)String error) {
		String token = (String)session.getAttribute("state");
		if(!token.equals(state) || error != null) {
			return "redirect:/";
		}	
		
	//	curl -v -X POST "https://kauth.kakao.com/oauth/token" \
	//	 -d "grant_type=authorization_code" \
	//	 -d "client_id={REST_API_KEY}" \
	//	 -d "redirect_uri={REDIRECT_URI}" \
	//	 -d "code={AUTHORIZATION_CODE}"
		StringBuffer url = new StringBuffer(
				"https://kauth.kakao.com/oauth/token?grant_type=authorization_code"
				); 
		url.append("&client_id=").append("");
		url.append("&code=").append(code);
		 
		JSONObject json = new JSONObject( common.requestAPI(url));
		String token_type = json.getString("token_type");
		String access_token = json.getString("access_token");
		//사용자정보 가져오기
		//curl -v -X GET "https://kapi.kakao.com/v2/user/me" \
		//  -H "Authorization: Bearer {ACCESS_TOKEN}"
		
		url = new StringBuffer("https://kapi.kakao.com/v2/user/me");
		json = new JSONObject(common.requestAPI(url, token_type + " " + access_token));
		
		
			
			
		
		
		return "redirect:/";
	}
	
	
	
	//이메일 인증코드 확인
	@ResponseBody @RequestMapping("/emailCodeChk")
	public int emailCodeChk(String code, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("m_email", email);
		
		int success = service.authentication_result(map);
		return success;
	}
	
	//로그아웃 요청
	@RequestMapping("/logout")
	public String smartLogout(HttpSession session) {
		session.removeAttribute("loginInfo");
		
		return "redirect:/";
	}
	
	//로그인 요청
	@ResponseBody @RequestMapping("/smartLogin")
	public boolean smartLoign(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		
	
		map.put("m_id", id);
		map.put("m_pw", pw); 
		MemberVO vo = service.member_login(map);
		session.setAttribute("loginInfo", vo);
		
		
		return vo == null ? false : true ;
	}
	
	//로그인하면페이지
	@RequestMapping("/login")
	public String login(HttpSession session) {
	
		return "member/login";
	}	
	
	//가입페이지
	@RequestMapping("/member")
	public String member(HttpSession session) {
		
		return "member/join";
	}
	
	//인증코드 숫자 6자리 생성
	public String createAuthenticationCode() {
		Random random = new Random();
		String AuthenticationCode = "";
		
		for(int i = 0; i < 4; i++) {
			String randomnum = Integer.toString(random.nextInt(10));
			AuthenticationCode += randomnum;
		}
		
		return AuthenticationCode;
	}
	
	//이메일 인증
	@ResponseBody @RequestMapping(value="/email_Authentication")
	public boolean email_Authentication(Model model, String chk_email, HttpSession session, HttpServletRequest request) {
		String AuthenticationCode = createAuthenticationCode();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_email", chk_email);
		map.put("code", AuthenticationCode);
		
		if ( service.member_email_check(chk_email) ) {
			common.sendEmail(chk_email, "인증메일",AuthenticationCode, session);
			service.authentication_email(map);
			
			return true;
		} else {
			return false;
		}
		
	};
	
	//이메일 중복확인
	@ResponseBody @RequestMapping("/email_check")
	public boolean email_check(String chk_email, HttpSession session) {
		
		return service.member_email_check(chk_email);
	}
	
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_chkec(String chk_id) {
		
		return service.member_id_check(chk_id);
	}
	
	//회원가입
	@ResponseBody @RequestMapping(value = "/join", produces = "text/html; charset=utf-8")
	public String member_join(HttpSession session, HttpServletRequest request, Model modelm, MemberVO vo) {
		StringBuffer msg = new StringBuffer("<script type='text/javascript'>");
		if(!vo.getM_tel().isEmpty()) {
			vo.getM_tel().replace(",", "-");
		}

		if( service.member_join(vo) == 1 ) {
			msg.append("alert('회원가입을 축하합니다^^'); location='"
					+ request.getContextPath() + "'; ");
		} else {
			msg.append("alert('회원가입이 실패되었습니다' + '\n 다시 시도해주세요'); "
					+ "location='member");
		}
		
		msg.append("</script>");
		return msg.toString();
	}
}
