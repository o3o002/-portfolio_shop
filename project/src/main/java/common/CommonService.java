package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	//첨부 파일 다운로드
	public File download(String filename, String filepath, HttpSession session, HttpServletResponse response) {
		File file = new File(session.getServletContext().getRealPath("resources") + filepath);
		
		String mime = session.getServletContext().getMimeType(filename);
		
		try {
			filename = URLEncoder.encode(filename, "utf-8").replace("\\+", "%20");
			
			response.setHeader("content-disposition", "attachment; filename=" + filename);
			
			try {
				ServletOutputStream out = response.getOutputStream();
				FileCopyUtils.copy(new FileInputStream(file), out);
				out.flush();
			} catch (IOException e) {
				System.out.println("servletOutputStream exception : " + e.getMessage());
			}
		
			
		} catch (UnsupportedEncodingException e) {
			System.out.println("filedownload : " + e.getMessage());
		}
		return file;
		
	}
	
	//첨부 파일 업로드 처리
	public String upload(String category, MultipartFile file, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		
		System.out.println(resources);
		
		
	
		String folder = upload + "/"  + category + "/" + new SimpleDateFormat("yyyy/mm/dd").format(new Date());
		File f = new File(folder);
		if( !f.exists() ) {f.mkdirs(); }//폴더가 존재하지 않으면 경로를 생성한다.
		
		//동시 다발적 동일명의 파일 업로드를 위한 고유 ID 부여
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo( new File(folder, uuid) );
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		 
		return folder.substring( resources.length() ) + "/" + uuid;
	}
	
	//token 요청하는 api
	public String requestAPI(StringBuffer url, String property) {
		String result = url.toString();
		
    try {
	        HttpURLConnection con = (HttpURLConnection)new URL(result).openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Content-type", "application/json");	//Content-type 설정이유와 의미
	        con.setRequestProperty("Authorization", property);
	        
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        
	        if( responseCode>=200 && responseCode<=300) { // 정상 호출
	          br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        con.disconnect();
	        result = res.toString();
	        
      } catch (Exception e) {
        System.out.println(e.getMessage());
        System.out.println("CommonService requestAPI(property) Excepion!!");
      }
	    
	    return result;
	}
	
	//requestAPI
	public String requestAPI(StringBuffer url) {
		String result = url.toString();
		
    try {
	        HttpURLConnection con = (HttpURLConnection)new URL(result).openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Content-type", "application/json");	//Content-type 설정이유와 의미
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        
	        if( responseCode>=200 && responseCode<=300) { // 정상 호출
	          br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        con.disconnect();
	        result = res.toString();
	        
      } catch (Exception e) {
        System.out.println(e.getMessage());
        System.out.println("CommonService requestAPI() Excepion!!");
      }
	    
	    return result;
	}
	
	//이메일 보내기
	public void sendEmail(String email, String name, String code, HttpSession session) {
		//1. 기본이메일 - simpleSend(email, name);
		
		htmlSend(email, name, code, session);
	}
	
	//비밀번호 임시발급 이메일 보내기
	public void sendemailpw(String m_id, String email, String code, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
	
		
		mail.setAuthentication("dufflazjaxj", "yakchun124");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom(email, "포볼 JIEUN 관리자");
			mail.addTo(email, m_id);
			
			mail.setSubject("JIEUN페이지 비밀번호 임시발급");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<h3>JIEUN페이지 비밀번호 임시발급</h3>");
			msg.append("<hr/>");
			msg.append("<p>이 메일은 JIEUN페이지 임시발급한 비밀번호 입니다.</p>");
			msg.append("<p>로그인후 마이페이지>회원정보 에서 비밀번호를 수정해주세요</p>");
			msg.append("<p style='font-weight:bold;'>" +  code + "</p>");
			msg.append("</body>");
			msg.append("</html");
			  
			mail.setHtmlMsg(msg.toString());
			
			mail.send();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
	}
	
	//회원축하 메일
	public void htmlSend(String email, String name, String code, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
	
		
		mail.setAuthentication("dufflazjaxj", "yakchun124");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom(email, "포볼 JIEUN 관리자");
			mail.addTo(email, name);
			
			mail.setSubject("JIEUN페이지 회원가입 인증메일");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<h3>JIEUN페이지 회원가입 인증메일</h3>");
			msg.append("<hr/>");
			msg.append("<p>이 메일은 JIEUN페이지 회원 인증 메일입니다. 아래코드를 홈페이지에 입력해주세요.</p>");
			msg.append("<p style='font-weight:bold;'>" +  code + "</p>");
			msg.append("</body>");
			msg.append("</html");
			  
			mail.setHtmlMsg(msg.toString());
			
			mail.send();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
