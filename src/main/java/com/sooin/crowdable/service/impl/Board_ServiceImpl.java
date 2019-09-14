package com.sooin.crowdable.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sooin.crowdable.Util.FileUtils;
import com.sooin.crowdable.dao.BoardDAO;
import com.sooin.crowdable.service.BoardService;
import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;

@Service
public class Board_ServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public int boardCreate(BoardVO boardVO) throws Exception{
		
		return dao.boardCreate(boardVO);
		
		
	}
	@Override
	public List<BoardVO> getBoardListAll() throws Exception{
		return dao.getBoardListAll();
	}
	@Override
	public List<BoardVO> getBoardListAllLimit(Criteria cri) throws Exception{
		return dao.getBoardListAllLimit(cri);
	}
	@Override
	public BoardVO getBoardView(int num)throws Exception{
		return dao.getBoardView(num);
	}
	
	@Override
	public List<BoardVO> getBoardOneList(int membernum) throws Exception{
		return dao.getBoardOneList(membernum);
	}
	@Override
	public List<BoardVO> getBoardOneListLimit(int membernum,Criteria cri) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("membernum", membernum);
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		return dao.getBoardOneListLimit(map);
	}
	@Override
	public List<BoardVO> getBoardIdList(String boardid) throws Exception{
		return dao.getBoardIdList(boardid);
	}
	@Override
	public List<BoardVO> getBoardIdListLimit(String boardid,Criteria cri) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("boardid", boardid);
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		return dao.getBoardIdListLimit(map);
	}
	@Override
	public int updateBoardActive(BoardVO boardVO)throws Exception{
		return dao.updateBoardActive(boardVO);
	}
	@Override
	public int deleteBoard(int num)throws Exception{
		return dao.deleteBoard(num);
	}
	@Override
	public int updateBoardTot(BoardVO boardVO)throws Exception{
		return dao.updateBoardTot(boardVO);
	}
	@Override
	public int updateBoardaddional(BoardVO boardVO)throws Exception{
		return dao.updateBoardaddional(boardVO);
	}
	
	@Override
	public List<BoardVO> getBoardIdListLimittwo(String boardid,String activestatus,Criteria cri) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("boardid", boardid);
		map.put("activestatus",activestatus);
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		return dao.getBoardIdListLimittwo(map);
	}
	@Override
	public List<BoardVO> getBoardIdListtwo(String boardid,String activestatus) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardid", boardid);
		map.put("activestatus",activestatus);
		return dao.getBoardIdListtwo(map);
	}
	@Override
	public List<BoardVO> getBoardIdListtwoFilter(String boardid, String activestatus, String category)
			throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardid", boardid);
		map.put("activestatus",activestatus);
		map.put("category",category);
		return dao.getBoardIdListtwoFilter(map);
	}
	@Override
	public List<BoardVO> getBoardIdListLimittwoFilter(String boardid, String activestatus, String category,
			Criteria cri) throws Exception {
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardid", boardid);
		map.put("activestatus",activestatus);
		map.put("category",category);
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		return dao.getBoardIdListLimittwoFilter(map);
	}
	
	
}
