package com.sooin.crowdable.dao;

import java.util.List;
import java.util.Map;

import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.DonationVO;

public interface DonationDAO {
	public List<DonationVO> getDonationAll()throws Exception;
	public DonationVO getDonationOne(int num)throws Exception;
	public List<DonationVO> getDonationOnemembernum(int membernum)throws Exception;
	public int deleteDonation(int num)throws Exception;
	public int insertDonation(DonationVO donationVO)throws Exception;
	public List<DonationVO> getDonationOneboardnum(int boardnum)throws Exception;
	public int sumDoantionmembernum(int membernum) throws Exception;
	public int sumDoantionboardnum(int boardnum) throws Exception;
	public int sumDoantiononeProject(DonationVO donationVO) throws Exception;
	public List<DonationVO> getDonationAllLimit(Map<String, Object> map)throws Exception;
	public List<DonationVO> getDonationOnemembernumLimit(Map<String, Object> map)throws Exception;
	public List<DonationVO> getDonationOneboardnumLimit(Map<String, Object> map)throws Exception;
	public List<DonationVO> sumDoantionOneGroupBoardnum(int membernum)throws Exception;
}
