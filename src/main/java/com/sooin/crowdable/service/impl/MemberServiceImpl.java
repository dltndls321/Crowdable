package com.sooin.crowdable.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sooin.crowdable.dao.MemberDAO;
import com.sooin.crowdable.service.MemberService;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Inject
	private MemberDAO dao;
	
	@Override
	public List<MemberVO> getMemberList() throws Exception{
		return dao.getMemberList();
	}
	public List<MemberVO> getMemberListLimit(Criteria cri) throws Exception{
		return dao.getMemberListLimit(cri);
	}
	@Override
	public MemberVO getMemberInfo(String email) throws Exception{
		return dao.getMemberInfo(email);
	}
	@Override
	public MemberVO getMemberInfoAdmin(int num) throws Exception{
		return dao.getMemberInfoAdmin(num);
	}
	@Override
	public int insertMember(MemberVO memberVo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertMember(memberVo);
	}
	@Override
	public int updateMember(MemberVO memberVo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateMember(memberVo);
	}
	@Override
	public int updateMemberAdmin(MemberVO memberVo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateMemberAdmin(memberVo);
	}
	@Override
	public int deleteMember(String email) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteMember(email);
	}
	@Override
	public String getMemberPasswd(String email) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMemberPasswd(email);
	}
}
