package com.sooin.crowdable.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sooin.crowdable.service.MemberService;
import com.sooin.crowdable.vo.MemberVO;


@Controller
public class Main_Controller {
	@Inject
	private MemberService memberService;
	

	@RequestMapping(value="/main.do")
	public String crowdable(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request, HttpServletRequest response ) throws Exception {
		
		return "/viewTot/View_Main";
	}
	@RequestMapping(value="register.do")
	public String moveRegister(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request, HttpServletRequest response ) {
		
		
		return "/viewTot/View_Register";
	}
	@RequestMapping(value="login.do")
	public String moveLogin(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request, HttpServletRequest response ) {
		
		
		return "/viewTot/View_Login";
	}
	@RequestMapping(value="whatcrowdable.do")
	public String moveWhatCrowdable() throws Exception {
		
		return "/viewTot/View_WhatCrowdable";
	}
	
	@RequestMapping(value="identity.do")
	public ModelAndView moveIdentity(@RequestParam Map<String, Object> paramMap,HttpSession session,HttpServletRequest request, HttpServletRequest response ) throws Exception {
		session.setAttribute("View_Identity","a");
		MemberVO memberVO = new MemberVO();
		memberVO=memberService.getMemberInfo((String)session.getAttribute("sessionId"));
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
		if(session.getAttribute("View_Identity").equals("a")) {//넘겨 받은 이메일 정보가 있는지
			model.setViewName("/viewTot/View_Identity_a");
			model.addObject("Identity_Items",memberVO);
		}else if(session.getAttribute("View_Identity").equals("b")){
			model.setViewName("/viewTot/View_Identity_b");
			model.addObject("Identity_Items",memberVO);
		}else if(session.getAttribute("View_Identity").equals("c")){
			model.setViewName("/viewTot/View_Identity_c");
			model.addObject("Identity_Items",memberVO);
		}
		return model;
	}
	
	@RequestMapping(value="deletelocation.do")
	public String deletelocation(@RequestParam Map<String, Object> paramMap ) throws Exception {
		
		return "/viewTot/DeleteLocation";
	}
	@RequestMapping(value="createboardmember.do")
	public String createboardmember(@RequestParam Map<String, Object> paramMap ) throws Exception {
	
	return "/viewTot/View_BoardCreateMember";
	}
	@RequestMapping(value="movecreatenotice.do")
	public String movecreatenotice() throws Exception {
	
	return "/viewTot/View_Createnotice";
	}
	
	
	
}
