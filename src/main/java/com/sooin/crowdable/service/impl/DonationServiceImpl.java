package com.sooin.crowdable.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sooin.crowdable.dao.DonationDAO;
import com.sooin.crowdable.service.DonationService;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.DonationVO;

@Service
public class DonationServiceImpl implements DonationService{
	@Inject
	private DonationDAO dao;

	@Override
	public List<DonationVO> getDonationAll() throws Exception {
		
		return dao.getDonationAll();
	}

	@Override
	public DonationVO getDonationOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.getDonationOne(num);
	}

	@Override
	public int deleteDonation(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteDonation(num);
	}

	@Override
	public int insertDonation(DonationVO donationVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertDonation(donationVO);
	}
	@Override
	public List<DonationVO> getDonationOnemembernum(int membernum)throws Exception{
		
		return dao.getDonationOnemembernum(membernum);
	}
	@Override
	public List<DonationVO> getDonationOneboardnum(int boardnum)throws Exception{
		return dao.getDonationOneboardnum(boardnum);
	}

	@Override
	public int sumDoantionmembernum(int membernum) throws Exception {
		// TODO Auto-generated method stub
		return dao.sumDoantionmembernum(membernum);
	}

	@Override
	public int sumDoantionboardnum(int boardnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.sumDoantionboardnum(boardnum);
	}

	@Override
	public int sumDoantiononeProject(DonationVO donationVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.sumDoantiononeProject(donationVO);
	}
	@Override
	public List<DonationVO> getDonationAllLimit(Criteria cri)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		return dao.getDonationAllLimit(map);
		
	}
	@Override
	public List<DonationVO> getDonationOnemembernumLimit(int membernum,Criteria cri)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		map.put("membernum",membernum);
		return dao.getDonationOnemembernumLimit(map);
	}
	@Override
	public List<DonationVO> getDonationOneboardnumLimit(int boardnum,Criteria cri)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		int pageStart=cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		map.put("pageStart", pageStart);
		map.put("perPageNum",perPageNum);
		map.put("boardnum",boardnum);
		return dao.getDonationOneboardnumLimit(map);
	}
	@Override
	public List<DonationVO> sumDoantionOneGroupBoardnum(int membernum)throws Exception{
		return dao.sumDoantionOneGroupBoardnum(membernum);
	}
	
}
