package com.sooin.crowdable.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sooin.crowdable.dao.GiftDAO;
import com.sooin.crowdable.service.GiftService;
import com.sooin.crowdable.vo.GiftVO;

@Service
public class GiftServiceImpl implements GiftService{
	@Inject
	private GiftDAO dao;

	@Override
	public List<GiftVO> getGiftAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.getGiftAll();
	}

	@Override
	public GiftVO getGiftOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.getGiftOne(num);
	}

	@Override
	public int deleteGift(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteGift(num);
	}

	@Override
	public int insertGift(GiftVO giftVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertGift(giftVO);
	}
	@Override
	public GiftVO getGiftOneBoardNum(int num)throws Exception{
		return dao.getGiftOneBoardNum(num);
	}
	@Override
	public int updateGift(GiftVO giftVO)throws Exception{
		return dao.updateGift(giftVO);
	}
	
	
}
