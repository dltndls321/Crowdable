package com.sooin.crowdable.dao;

import java.util.List;
import java.util.Map;

import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.DonationVO;

public interface BoardDAO {
	public int boardCreate(BoardVO boardVO) throws Exception;
	public List<BoardVO> getBoardListAll() throws Exception;
	public List<BoardVO> getBoardListAllLimit(Criteria cri) throws Exception;
	public BoardVO getBoardView(int num)throws Exception;
	public List<BoardVO> getBoardOneList(int membernum) throws Exception;
	public List<BoardVO> getBoardOneListLimit(Map<String, Object> map) throws Exception;
	public List<BoardVO> getBoardIdList(String boardid) throws Exception;
	public List<BoardVO> getBoardIdListLimit(Map<String, Object> map) throws Exception;
	public int updateBoardActive(BoardVO boardVO)throws Exception;
	public int deleteBoard(int num)throws Exception;
	public int updateBoardTot(BoardVO boardVO)throws Exception;
	public int updateBoardaddional(BoardVO boardVO)throws Exception;
	public List<BoardVO> getBoardIdListLimittwo(Map<String, Object> map) throws Exception;
	public List<BoardVO> getBoardIdListtwo(Map<String, Object> map) throws Exception;
	public List<BoardVO> getBoardIdListtwoFilter(Map<String, Object> map)throws Exception;
	public List<BoardVO> getBoardIdListLimittwoFilter(Map<String, Object> map)throws Exception;
	
	
}
