package com.sooin.crowdable.service;

import java.util.List;

import com.sooin.crowdable.vo.GiftVO;

public interface GiftService {
	public List<GiftVO> getGiftAll()throws Exception;
	public GiftVO getGiftOne(int num)throws Exception;
	public int deleteGift(int num)throws Exception;
	public int insertGift(GiftVO giftVO)throws Exception;
	public GiftVO getGiftOneBoardNum(int num)throws Exception;
	public int updateGift(GiftVO giftVO)throws Exception;
}
