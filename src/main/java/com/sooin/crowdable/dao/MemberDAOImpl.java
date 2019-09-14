package com.sooin.crowdable.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.sooin.crowdable.memberMapperNS";
	
	@Override
	public List<MemberVO> getMemberList() throws Exception{
		return sqlSession.selectList(Namespace+".getMemberList");
	}
	@Override
	public List<MemberVO> getMemberListLimit(Criteria cri) throws Exception{
		return sqlSession.selectList(Namespace+".getMemberListLimit",cri);
	}
	@Override
	public MemberVO getMemberInfo(String email) throws Exception{
		return sqlSession.selectOne(Namespace+".getMemberInfo",email);
	}
	@Override
	public MemberVO getMemberInfoAdmin(int num) throws Exception{
		return sqlSession.selectOne(Namespace+".getMemberInfoAdmin",num);
	}
	@Override
	public int insertMember(MemberVO memberVo) throws Exception{
		return sqlSession.insert(Namespace+".insertMember",memberVo );
	}
	@Override
	public int updateMember(MemberVO memberVo) throws Exception{
		return sqlSession.update(Namespace+".updateMember",memberVo);
	}	
	@Override
	public int updateMemberAdmin(MemberVO memberVo) throws Exception{
		return sqlSession.update(Namespace+".updateMemberAdmin",memberVo);
	}
	@Override
	public int deleteMember(String email) throws Exception{
		return sqlSession.delete(Namespace+".deleteMember",email);
	}
	@Override
	public String getMemberPasswd(String email) throws Exception{
		return sqlSession.selectOne(Namespace+".getMemberPasswd",email);
	}
	

	
	
}
