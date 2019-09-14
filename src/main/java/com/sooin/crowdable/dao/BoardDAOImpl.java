package com.sooin.crowdable.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.DonationVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.sooin.crowdable.boardMapperNS";
	@Override
	public int boardCreate(BoardVO boardVO) throws Exception{
		return sqlSession.insert(Namespace+".boardCreate",boardVO);
	}
	@Override
	public List<BoardVO> getBoardListAll() throws Exception{
		return sqlSession.selectList(Namespace+".getBoardListAll");
	}
	@Override
	public List<BoardVO> getBoardListAllLimit(Criteria cri) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardListAllList",cri);
	}
	@Override
	public BoardVO getBoardView(int num)throws Exception{
		return sqlSession.selectOne(Namespace+".getBoardView",num);
	}
	@Override
	public List<BoardVO> getBoardOneList(int membernum) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardOneList",membernum);
	}
	@Override
	public List<BoardVO> getBoardOneListLimit(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardOneList",map);
	}
	@Override
	public List<BoardVO> getBoardIdList(String boardid) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardIdList",boardid);
	}
	@Override
	public List<BoardVO> getBoardIdListLimit(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardIdListLimit",map);
	}
	@Override
	public int updateBoardActive(BoardVO boardVO)throws Exception{
		return sqlSession.update(Namespace+".updateBoardActive",boardVO);
	}
	@Override
	public int deleteBoard(int num)throws Exception{
		return sqlSession.delete(Namespace+".deleteBoard",num);
	}
	@Override
	public int updateBoardTot(BoardVO boardVO)throws Exception{
		return sqlSession.update(Namespace+".updateBoardTot",boardVO);
	}
	@Override
	public int updateBoardaddional(BoardVO boardVO)throws Exception{
		return sqlSession.update(Namespace+".updateBoardaddional",boardVO);
	}
	@Override
	public List<BoardVO> getBoardIdListLimittwo(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardIdListLimittwo",map);
	}
	@Override
	public List<BoardVO> getBoardIdListtwo(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(Namespace+".getBoardIdListtwo",map);
	}
	@Override
	public List<BoardVO> getBoardIdListtwoFilter(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getBoardIdListtwoFilter",map);
	}
	@Override
	public List<BoardVO> getBoardIdListLimittwoFilter(Map<String, Object> map)throws Exception{
		return sqlSession.selectList(Namespace+".getBoardIdListLimittwoFilter",map);
	}
	
}
