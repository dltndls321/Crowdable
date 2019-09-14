package com.sooin.crowdable.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.sooin.crowdable.service.MemberService;
import com.sooin.crowdable.vo.MemberVO;
import com.sooin.crowdable.vo.PhotoVO;



@Controller
@RequestMapping(value="member")
public class Member_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Member_Controller.class);
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value = "insertmember.do",method = RequestMethod.POST)
		public void insertMember(@RequestParam() String name,@RequestParam() String email,@RequestParam() String passwd,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberVO memberVO = new MemberVO();
		memberVO.setName(name);
		memberVO.setPasswd(passwd);
		memberVO.setEmail(email);
		memberService.insertMember(memberVO);
		out.append("1");
		System.out.println(email);
		session.setAttribute("sessionId",email);
		session.setAttribute("sessionName",name);
		session.setAttribute("sessionNum", memberService.getMemberInfo(email).getNum());
		System.out.println("세션아이디 : " + email);
		out.flush();
		out.close();
		}
	@RequestMapping(value = "loginmember.do",method = RequestMethod.POST)
	public void selectlogin(@RequestParam() String email,@RequestParam() String passwd,HttpServletResponse response,HttpSession session)throws Exception{
		System.out.println("val email :"  + email);
		System.out.println("val passwd :" +passwd);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("설정되는 passwd : " + memberService.getMemberPasswd(email));
		System.out.println("설정 되는 sessionNum : " + memberService.getMemberInfo(email).getNum());
		if(memberService.getMemberInfo(email)==null) {//넘겨 받은 이메일 정보가 있는지
			out.append("emailfail");
			System.out.println("emailfail");
			out.flush();
		}else if(!memberService.getMemberPasswd(email).equals(passwd)){
			out.append("passwdfail");
			System.out.println("passwdfail");
			out.flush();
		}else {
			String name = memberService.getMemberInfo(email).getName();
			out.append("ok");
			System.out.println("ok");
			session.setAttribute("sessionId",email);
			session.setAttribute("sessionName", name);
			session.setAttribute("sessionNum", memberService.getMemberInfo(email).getNum());
			System.out.println("회원 번호"+session.getAttribute("sessionNum"));
			out.flush();
		}
		out.close();
		
	}
	
	@RequestMapping(value = "checkemail.do",method = RequestMethod.POST)
	public void selectCheckEmail(@RequestParam() String email, HttpServletResponse response)throws Exception{
		System.out.println(email);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(memberService.getMemberInfo(email) !=null) {//넘겨 받은 이메일 정보가 있는지
			out.append("fail");
			out.flush();
		}else {
			out.append("ok");
			out.flush();
		}
		out.close();
		
	}
	@RequestMapping(value = "logout.do",method = RequestMethod.GET)
	public String logoutMember(HttpSession session)throws Exception{
		session.invalidate();
	
		return "/viewTot/View_Main"; 
	}
	@RequestMapping(value = "onloadidentity.do",method = RequestMethod.GET)
	public ModelAndView onloadIdentity(HttpSession session,@RequestParam Map<String, Object> paramMap, HttpServletResponse response)throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO=memberService.getMemberInfo((String)session.getAttribute("sessionId"));
		System.out.println(memberVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Identity_a");
		model.addObject("Identity_Items",memberVO);
		return model;
	}
	
	@RequestMapping(value="whatviewIdentity.do")
	public ModelAndView whatviewIdentity(HttpSession session ) throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO=memberService.getMemberInfo((String)session.getAttribute("sessionId"));
		ModelAndView model = new ModelAndView();
		//넘겨 받은 이메일 정보가 있는지
			model.setViewName("/viewTot/View_Identity_a");
			model.addObject("Identity_Items",memberVO);
		
		return model;
	}
	
	@RequestMapping(value = "updateMember.do")
	public ModelAndView updateMember(@RequestParam() String name,@RequestParam() String address,@RequestParam() String passwd,@RequestParam() String phone,@RequestParam() String content,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail((String)session.getAttribute("sessionId"));
		memberVO.setName(name);
		memberVO.setPasswd(passwd);
		memberVO.setAddress(address);
		memberVO.setPhone(phone);
		memberVO.setContent(content);
		memberService.updateMember(memberVO);
		System.out.println(memberVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Identity_a");
		model.addObject("Identity_Items",memberVO);
		return model;
	}
	
	@RequestMapping(value = "deleteMember.do" ,method = RequestMethod.POST)
	public void deleteMember(@RequestParam() String passwd,@RequestParam() String passwd2,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		String email = (String)session.getAttribute("sessionId");
		String a = "";
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!passwd.equals(memberService.getMemberPasswd(email))) {
			out.append("a");
			out.flush();
		}else if(!passwd.equals(passwd2)) {
			System.out.println(passwd);
			System.out.println(passwd2);
			out.append("b");
			out.flush();
		}else{
			System.out.println(email);
			memberService.deleteMember(email);
			System.out.println(email);
			System.out.println(email);
			out.append("c");
			out.flush();
		}
		out.close();
	}
	
	
}
