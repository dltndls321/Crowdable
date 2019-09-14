package com.sooin.crowdable.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sooin.crowdable.service.BoardService;
import com.sooin.crowdable.service.DonationService;
import com.sooin.crowdable.service.GiftService;
import com.sooin.crowdable.service.MemberService;
import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.GiftVO;
import com.sooin.crowdable.vo.MemberVO;
import com.sooin.crowdable.vo.PageMaker;

@Controller
@RequestMapping(value="admin")
public class Admin_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Admin_Controller.class);
	
	@Inject
	private MemberService memberService;
	@Inject
	private BoardService boardService;
	@Inject
	private GiftService giftService;
	@Inject
	private DonationService donationService;
	
	@RequestMapping(value = "identity.do")
	public ModelAndView moveIdentity(@RequestParam Map<String, Object> paramMap,HttpSession session,HttpServletRequest request, HttpServletRequest response ) throws Exception {
		session.setAttribute("View_Identity","a");
		MemberVO memberVO = new MemberVO();
		memberVO=memberService.getMemberInfo((String)session.getAttribute("sessionId"));
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Admin_a");
		model.addObject("Admin_Items",memberVO);
		return model;
	}
	@RequestMapping(value = "updateAdmin.do")
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
		model.setViewName("/viewTot/View_Admin_a");
		model.addObject("Admin_Items",memberVO);
		return model;
	}
	@RequestMapping(value = "updateAdminmember.do")
	public ModelAndView updateAdminmember(@RequestParam() int num,@RequestParam() String email,@RequestParam() String name,@RequestParam() String address,@RequestParam() String passwd,@RequestParam() String phone,@RequestParam() String content,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		System.out.println(num);
		MemberVO memberVO = new MemberVO();
		memberVO.setNum(num);
		memberVO.setEmail(email);
		memberVO.setName(name);
		memberVO.setPasswd(passwd);
		memberVO.setAddress(address);
		memberVO.setPhone(phone);
		memberVO.setContent(content);
		memberService.updateMember(memberVO);
		System.out.println(memberVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_AdminMemberInfo");
		model.addObject("memberinfo",memberVO);
		return model;
	}
	@RequestMapping(value = "adminmember.do")
	public ModelAndView adminMember(HttpServletResponse response,HttpSession session,Criteria cri) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		List<MemberVO> memberVO =  memberService.getMemberListLimit(cri);
		int totalCount = memberService.getMemberList().size();
		pageMaker.setTotalCount(totalCount);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Admin_b");
		model.addObject("userList",memberVO);
		model.addObject("pageMaker",pageMaker);
		
		return model;
	}
	@RequestMapping(value = "onclicklist.do")
	public ModelAndView onclicklist(@RequestParam() String email,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		System.out.println(email);
		MemberVO memberVO =  memberService.getMemberInfo(email);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Admin_list");
		model.addObject("onclickList",memberVO);
		return model;
	}
	@RequestMapping(value = "projectlist.do")
	public ModelAndView projectlist(Criteria cri,HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totNum =  boardService.getBoardListAll().size();
		List<BoardVO> boardVO =  boardService.getBoardListAllLimit(cri);
		pageMaker.setTotalCount(totNum);
		for(int i=0; i<boardVO.size();i++) {
			System.out.println(boardVO.get(i)); 
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_Admin_c");
		model.addObject("noticeList",boardVO);
		model.addObject("pageMaker",pageMaker);
		return model;
	}
	
	
	@RequestMapping(value ="viewonemember/{idx}.do")
	public ModelAndView viewonemember(@PathVariable("idx") int idx) throws Exception {
		System.out.println(idx);
		
		  int membernum=idx;
		  MemberVO memberVO = new MemberVO();
		  memberVO=memberService.getMemberInfoAdmin(idx);
		  List<BoardVO> boardVO =boardService.getBoardOneList(membernum);
		  
		  System.out.println(memberVO);
		
		  ModelAndView model = new ModelAndView();
		  model.setViewName("/viewTot/View_AdminMemberInfo");
		  model.addObject("memberinfo",memberVO); 
		  model.addObject("boardinfo",boardVO);
		
		  return model;
	}
	@RequestMapping(value = "viewoneboard/{idx3}.do")
	public ModelAndView viewoneboard(@PathVariable("idx3") int idx) throws Exception {
		  int boardnum=idx;
		  BoardVO boardVO = new BoardVO();
		  boardVO=boardService.getBoardView(boardnum);
		  GiftVO giftVO = giftService.getGiftOneBoardNum(boardnum);
		  MemberVO memberVO = new MemberVO();
		  memberVO = memberService.getMemberInfoAdmin(boardVO.getMembernum());
		  ModelAndView model = new ModelAndView();
		  model.setViewName("/viewTot/View_AdminBoardOneInfo");
		  model.addObject("boardoneview",boardVO);
		  model.addObject("memberinfo",memberVO);
		  model.addObject("giftinfo",giftVO);
		  return model;
	}
	@RequestMapping(value = "deleteAdminmember.do")
	public void deleteAdminmember(@RequestParam() String email,HttpServletResponse response,HttpSession session)throws Exception{
		memberService.deleteMember(email);
	}
	@RequestMapping(value = "boardupdateAdminone.do")
	public String boardupdateAdminone(@RequestParam() int num)throws Exception {
		BoardVO boardVO = new BoardVO();
		String activeStatus = "3";
		boardVO.setNum(num);
		boardVO.setActivestatus(activeStatus);
		System.out.println(boardVO);
		boardService.updateBoardActive(boardVO);
		return null;
	}
	@RequestMapping(value = "boardupdateAdmintwo.do")
	public String boardupdateAdmintwo(@RequestParam() int num)throws Exception {
		System.out.println(num);
		BoardVO boardVO = new BoardVO();
		String activeStatus = "2";
		boardVO.setNum(num);
		boardVO.setActivestatus(activeStatus);
		System.out.println(boardVO);
		boardService.updateBoardActive(boardVO);
		return null;
	}
	@RequestMapping(value = "deleteAdminboard.do")
	public void deleteAdminboard(@RequestParam() int num)throws Exception  {
		boardService.deleteBoard(num);
	}
	
}
