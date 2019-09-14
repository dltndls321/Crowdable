package com.sooin.crowdable.service;

import java.util.List;



import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;

public interface BoardService {
	public int boardCreate(BoardVO boardVO) throws Exception;
	public List<BoardVO> getBoardListAll() throws Exception;
	public List<BoardVO> getBoardListAllLimit(Criteria cri) throws Exception;
	public BoardVO getBoardView(int num)throws Exception;
	public List<BoardVO> getBoardOneList(int membernum) throws Exception;
	public List<BoardVO> getBoardOneListLimit(int membernum,Criteria cri) throws Exception;
	public List<BoardVO> getBoardIdList(String boardid) throws Exception;
	public List<BoardVO> getBoardIdListLimit(String boardid,Criteria cri) throws Exception;
	public int updateBoardActive(BoardVO boardVO)throws Exception;
	public int deleteBoard(int num)throws Exception;
	public int updateBoardTot(BoardVO boardVO)throws Exception;
	public int updateBoardaddional(BoardVO boardVO)throws Exception;
	public List<BoardVO> getBoardIdListLimittwo(String boardid,String activestatus,Criteria cri) throws Exception;
	public List<BoardVO> getBoardIdListtwo(String boardid,String activestatus) throws Exception;
	public List<BoardVO> getBoardIdListtwoFilter(String boardid,String activestatus,String category) throws Exception;
	public List<BoardVO> getBoardIdListLimittwoFilter(String boardid,String activestatus,String category,Criteria cri) throws Exception;
	
}
