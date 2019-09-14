package com.sooin.crowdable.dao;

import java.util.List;

import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.MemberVO;


public interface MemberDAO {
	public List<MemberVO> getMemberList() throws Exception;
	public List<MemberVO> getMemberListLimit(Criteria cri) throws Exception;
	public MemberVO getMemberInfo(String email) throws Exception;
	public int insertMember(MemberVO memberVo) throws Exception;
	public int updateMember(MemberVO memberVo) throws Exception;
	public int deleteMember(String email) throws Exception;
	public String getMemberPasswd(String email) throws Exception;
	public MemberVO getMemberInfoAdmin(int num) throws Exception;
	public int updateMemberAdmin(MemberVO memberVo) throws Exception;
}
