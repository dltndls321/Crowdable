package com.sooin.crowdable.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sooin.crowdable.vo.DonationVO;

@Repository
public class DonationDAOImpl implements DonationDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.sooin.crowdable.donationMapperNS";
	@Override
	public List<DonationVO> getDonationAll() throws Exception {
		return sqlSession.selectList(Namespace+".getDonationAll");
	}
	@Override
	public DonationVO getDonationOne(int num) throws Exception {
		return sqlSession.selectOne(Namespace+".getDonationOne",num);
	}
	@Override
	public int deleteDonation(int num) throws Exception {
		return sqlSession.delete(Namespace + ".deleteDonation",num);
	}
	@Override
	public int insertDonation(DonationVO donationVO) throws Exception {
		return sqlSession.insert(Namespace + ".insertDonation",donationVO);
	}
	@Override
	public List<DonationVO> getDonationOnemembernum(int membernum)throws Exception{
		return sqlSession.selectList(Namespace + ".getDonationOnemembernum",membernum);
	}
	@Override
	public List<DonationVO> getDonationOneboardnum(int boardnum)throws Exception{
		return sqlSession.selectList(Namespace + ".getDonationOneboardnum",boardnum);
	}
	@Override
	public int sumDoantionmembernum(int membernum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".sumDoantionmembernum",membernum);
	}
	@Override
	public int sumDoantionboardnum(int boardnum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".sumDoantionboardnum",boardnum);
	}
	@Override
	public int sumDoantiononeProject(DonationVO donationVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".sumDoantiononeProject",donationVO);
	}
	@Override
	public List<DonationVO> getDonationAllLimit(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".getDonationAllLimit",map);
	}
	@Override
	public List<DonationVO> getDonationOnemembernumLimit(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getDonationOnemembernumLimit",map);
	}
	@Override
	public List<DonationVO> getDonationOneboardnumLimit(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getDonationOneboardnumLimit",map);
	}
	@Override
	public List<DonationVO> sumDoantionOneGroupBoardnum(int membernum)throws Exception{
		return sqlSession.selectList(Namespace+".sumDoantionOneGroupBoardnum",membernum);
	}
	
	
}
