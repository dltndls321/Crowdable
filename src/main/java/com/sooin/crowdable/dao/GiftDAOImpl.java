package com.sooin.crowdable.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sooin.crowdable.vo.GiftVO;

@Repository
public class GiftDAOImpl implements GiftDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.sooin.crowdable.giftMapperNS";
	@Override
	public List<GiftVO> getGiftAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getGiftAll");
	}
	@Override
	public GiftVO getGiftOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getGiftOne",num);
	}
	@Override
	public int deleteGift(int num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace+".deleteGift",num);
	}
	@Override
	public int insertGift(GiftVO giftVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".insertGift",giftVO);
	}
	@Override
	public GiftVO getGiftOneBoardNum(int num)throws Exception{
		return sqlSession.selectOne(Namespace+".getGiftOneBoardNum",num);
	}
	@Override
	public int updateGift(GiftVO giftVO)throws Exception{
		return sqlSession.update(Namespace+".updateGift",giftVO);
	}
	
	

}
