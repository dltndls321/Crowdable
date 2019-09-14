package com.sooin.crowdable.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sooin.crowdable.service.BoardService;
import com.sooin.crowdable.service.DonationService;
import com.sooin.crowdable.service.GiftService;
import com.sooin.crowdable.service.MemberService;
import com.sooin.crowdable.vo.BoardVO;
import com.sooin.crowdable.vo.Criteria;
import com.sooin.crowdable.vo.DonationVO;
import com.sooin.crowdable.vo.GiftVO;
import com.sooin.crowdable.vo.MemberVO;
import com.sooin.crowdable.vo.PageMaker;
import com.sooin.crowdable.vo.PhotoVO;

@Controller
@RequestMapping(value="board")
public class Board_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Board_Controller.class);
	
	@Inject
	private MemberService memberService;
	@Inject
	private BoardService boardService;
	@Inject
	private GiftService giftService;
	@Inject
	private DonationService donationService;
	
	@RequestMapping(value = "noticelist.do")
	public ModelAndView noticelist(HttpServletResponse response,HttpSession session,Criteria cri) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		String boardid = "1";
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		int totNum =  boardService.getBoardIdList(boardid).size();
		System.out.println(boardService.getBoardIdList(boardid));
		List<BoardVO> boardVO =  boardService.getBoardIdListLimit(boardid, cri);
		pageMaker.setTotalCount(totNum);
		System.out.println(boardVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_NotceBoard");
		model.addObject("noticeList",boardVO);
		model.addObject("pageMaker",pageMaker);
		return model;
	}

	
	@RequestMapping(value = "createnotice.do")
	public ModelAndView createnotice(Criteria cri,HttpSession session,HttpServletResponse response,HttpServletRequest request,@RequestParam String boardid,@RequestParam String category1,@RequestParam String category2,@RequestParam String category3,@RequestParam String writer,@RequestParam String filename,@RequestParam int filesize,@RequestParam String ip,@RequestParam String activestatus,@RequestParam int wantmoney,@RequestParam String content,@RequestParam String subject ) throws Exception{
		BoardVO boardVO = new BoardVO();
		int membernum =(Integer)session.getAttribute("sessionNum");
		String email = (String)session.getAttribute("sessionId");
		boardVO.setMembernum(membernum);
		boardVO.setBoardid(boardid);
		boardVO.setCategory1(category1);
		boardVO.setCategory2(category2);
		boardVO.setCategory3(category3);
		boardVO.setWriter(writer);
		boardVO.setSubject(subject);
		boardVO.setEmail(email);
		boardVO.setContent(content);
		boardVO.setIp(ip);
		boardVO.setFilename(filename);
		boardVO.setFilesize(filesize);
		boardVO.setActivestatus(activestatus);
		boardVO.setWantmoney(wantmoney);
		boardService.boardCreate(boardVO);
		ModelAndView model = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		int totNum =  boardService.getBoardIdList(boardid).size();
		List<BoardVO> noticeList =  boardService.getBoardIdListLimit(boardid, cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totNum);
		model.setViewName("/viewTot/View_NotceBoard");
		model.addObject("noticeList",noticeList);
		model.addObject("pageMaker",pageMaker);
		
		return model;
	}
	@RequestMapping(value = "whoboardlist.do")
	public ModelAndView whoboardlist(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		
		int membernum = (Integer) session.getAttribute("sessionNum");
		List<BoardVO> boardVO = boardService.getBoardOneList(membernum);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_OneMemberboardList");
		model.addObject("noticeList",boardVO);
		return model;
	}
	
	
	
	
	
	@RequestMapping(value = "createcontent.do")
	public ModelAndView createNotice(HttpSession session,HttpServletResponse response,HttpServletRequest request,@RequestParam("file") MultipartFile file,@RequestParam String boardid,@RequestParam String category1,@RequestParam String category2,@RequestParam String category3,@RequestParam String writer,@RequestParam String filename,@RequestParam int filesize,@RequestParam String ip,@RequestParam String activestatus,@RequestParam int wantmoney,@RequestParam String content,@RequestParam String subject ) throws Exception{
		BoardVO boardVO = new BoardVO();
		String filePath = "C:/Users/PC/Desktop/soosoo/CrowdableSpring2/workspace/crowdable/src/main/webapp/resources/photo_upload/";
		int membernum =(Integer) session.getAttribute("sessionNum");
		String email = (String)session.getAttribute("sessionId");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String oldName = null; 
		String originalFileExtension = null; 
		String savename = null;
		String newName = null;
		while(iterator.hasNext()) {
			System.out.println("저장 몇번 되는지?");
			multipartFile=multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				byte[] data = file.getBytes();
				oldName=multipartFile.getOriginalFilename();
				originalFileExtension=oldName.substring(oldName.lastIndexOf("."));
				newName = UUID.randomUUID().toString() + originalFileExtension;
				savename = "<img src=\""+"http://211.63.89.28:31234/resources/photo_upload/"+newName+"\" style=\"width: 100px; height: 80px;\">";
				FileOutputStream fos = new FileOutputStream(filePath+newName);
				fos.write(data);
				fos.close();
			}
		}
		boardVO.setMembernum(membernum);
		boardVO.setBoardid(boardid);
		boardVO.setCategory1(category1);
		boardVO.setCategory2(category2);
		boardVO.setCategory3(category3);
		boardVO.setWriter(writer);
		boardVO.setSubject(subject);
		boardVO.setEmail(email);
		boardVO.setContent(content);
		boardVO.setIp(ip);
		boardVO.setFilename(savename);
		boardVO.setFilesize(filesize);
		boardVO.setActivestatus(activestatus);
		boardVO.setWantmoney(wantmoney);
		boardService.boardCreate(boardVO);
		ModelAndView model = new ModelAndView();
		List<BoardVO> noticeList =  boardService.getBoardListAll();
		model.setViewName("/viewTot/View_Main");
		model.addObject("noticeList",noticeList);
		
		
		return model;
	}
	
	@RequestMapping(value = "photoUpload.do",method = {RequestMethod.POST} )
	public String photoUpload(HttpServletRequest request, PhotoVO vo) throws Exception{
		System.out.println("111111");
		String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;             
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 /////////////////
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println(file_result);
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	@RequestMapping(value = "multiplePhotoUpload.do" ,method = {RequestMethod.POST})
	@ResponseBody
	public String multiplePhotoUpload(HttpServletResponse response,HttpServletRequest request ) throws Exception{
		System.out.println("222222");
		StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:/Users/PC/Desktop/soosoo/CrowdableSpring2/workspace/crowdable/src/main/webapp/resources/photo_upload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(saveName)
              .append("&sFileURL=").append("http://211.63.89.28:31234/resources/photo_upload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sb);
        return sb.toString();
	}
	@RequestMapping(value = "multiplePhotoUploadtwo.do" ,method = {RequestMethod.POST})
	@ResponseBody
	public String multiplePhotoUploadtwo(HttpServletResponse response,HttpServletRequest request ) throws Exception{
		System.out.println("3333");
		StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:/Users/PC/Desktop/soosoo/CrowdableSpring2/workspace/crowdable/src/main/webapp/resources/photo_upload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(saveName)
              .append("&sFileURL=").append("http://211.63.89.28:31234/resources/photo_upload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sb);
        return sb.toString();
	}
	@RequestMapping(value = "viewoneboard/{idx}.do")
	public ModelAndView viewoneboard(@PathVariable("idx") int idx,HttpServletResponse response,HttpSession session,Criteria cri) throws Exception{
		int boardnum=idx;
		  System.out.println("정보가 들어오니");
		  BoardVO boardVO = new BoardVO();
		  boardVO=boardService.getBoardView(boardnum);
		  MemberVO memberVO = new MemberVO();
		  memberVO = memberService.getMemberInfoAdmin(boardVO.getMembernum());
		  ModelAndView model = new ModelAndView();
		  model.setViewName("/viewTot/View_BoardOneInfo");
		  model.addObject("boardoneview",boardVO);
		  model.addObject("memberinfo",memberVO);
		  return model;
	}
	@RequestMapping(value = "updateboard/{idx}.do")
	public ModelAndView updateboard(@PathVariable("idx") int idx,HttpServletResponse response,HttpSession session)throws Exception{
		ModelAndView model = new ModelAndView();
		BoardVO boardVO = new BoardVO();
		MemberVO memberVO = new MemberVO();
		boardVO = boardService.getBoardView(idx);
		memberVO = memberService.getMemberInfoAdmin((Integer) session.getAttribute("sessionNum"));
		System.out.println(boardVO);
		System.out.println(memberVO);
		model.addObject("memberinfo",memberVO);
		model.addObject("boardinfo",boardVO);
		model.setViewName("/viewTot/View_updateProject");
		return model;
	}
	@RequestMapping(value = "updateboarddone.do")
	public ModelAndView updateboarddone(HttpSession session,HttpServletResponse response,HttpServletRequest request,@RequestParam String num,@RequestParam String boardid,@RequestParam String category1,@RequestParam String category2,@RequestParam String category3,@RequestParam String writer,@RequestParam String filename,@RequestParam int filesize,@RequestParam String ip,@RequestParam String activestatus,@RequestParam int wantmoney,@RequestParam String content,@RequestParam String subject )throws Exception{
		int membernum = (Integer) session.getAttribute("sessionNum");
		
		String email = (String)session.getAttribute("sessionId");
		int num2 = Integer.parseInt(num);
		System.out.println("num : " +num);
		System.out.println("num2 : " + num2);
		BoardVO boardVO2 = new BoardVO();
		boardVO2.setNum(num2);
		boardVO2.setMembernum(membernum);
		boardVO2.setBoardid(boardid);
		boardVO2.setCategory1(category1);
		boardVO2.setCategory2(category2);
		boardVO2.setCategory3(category3);
		boardVO2.setWriter(writer);
		boardVO2.setSubject(subject);
		boardVO2.setEmail(email);
		boardVO2.setContent(content);
		boardVO2.setIp(ip);
		boardVO2.setFilename(filename);
		boardVO2.setFilesize(filesize);
		boardVO2.setActivestatus(activestatus);
		boardVO2.setWantmoney(wantmoney);
		ModelAndView model = new ModelAndView();
		boardService.updateBoardTot(boardVO2);
		model.setViewName("/viewTot/View_OneMemberboardList");
		List<BoardVO> boardVO = boardService.getBoardOneList(membernum);
		model.addObject("noticeList",boardVO);
		return model;
	}
	@RequestMapping(value = "additionalupdateboard/{idx}.do")
	public ModelAndView additionalupdateboard(@PathVariable("idx") int idx,HttpServletResponse response,HttpSession session)throws Exception{
		ModelAndView model = new ModelAndView();
		BoardVO boardVO = new BoardVO();
		MemberVO memberVO = new MemberVO();
		GiftVO giftVO = giftService.getGiftOneBoardNum(idx);
		System.out.println(giftVO);
		boardVO = boardService.getBoardView(idx);
		memberVO = memberService.getMemberInfoAdmin((Integer) session.getAttribute("sessionNum"));
		model.addObject("memberinfo",memberVO);
		model.addObject("boardinfo",boardVO);
		model.addObject("giftinfo",giftVO);
		model.setViewName("/viewTot/View_insertadditionalupdateboard");
		return model;
	}
	@RequestMapping(value = "additionalupdate.do")
	public ModelAndView additionalupdate(HttpServletResponse response,HttpSession session,@RequestParam int boardnum,
			@RequestParam String account,@RequestParam @DateTimeFormat(pattern="yyyy-MM-dd") Date enddate,@RequestParam int wantmoney,@RequestParam String giftcontentone,@RequestParam String giftcontenttwo,@RequestParam String giftcontentthree,@RequestParam int giftmoneyone,@RequestParam int giftmoneytwo,@RequestParam int giftmoneythree,@RequestParam int giftnum)throws Exception{
		ModelAndView model = new ModelAndView();
		BoardVO boardVO = new BoardVO();
		GiftVO giftVO = new GiftVO();
		giftVO.setBoardnum(boardnum);
		giftVO.setGiftcontentone(giftcontentone);
		giftVO.setGiftcontenttwo(giftcontenttwo);
		giftVO.setGiftcontentthree(giftcontentthree);
		giftVO.setGiftmoneyone(giftmoneyone);
		giftVO.setGiftmoneytwo(giftmoneytwo);
		giftVO.setGiftmoneythree(giftmoneythree);
		if(giftnum==0) {
			giftService.insertGift(giftVO);
		}else if(giftnum!=0) {
			giftVO.setNum(giftnum);
			giftService.updateGift(giftVO);
		}
		
		System.out.println(giftVO);
		boardVO.setNum(boardnum);
		boardVO.setActivestatus("4");
		boardVO.setEnddate(enddate);
		boardVO.setAccount(account);
		boardVO.setWantmoney(wantmoney);
		boardService.updateBoardaddional(boardVO);
		int membernum = (Integer) session.getAttribute("sessionNum");
		List<BoardVO> boardVO2 = boardService.getBoardOneList(membernum);
		model.setViewName("/viewTot/View_OneMemberboardList");
		model.addObject("noticeList",boardVO2);
		return model;
	}
	@RequestMapping(value = "projectlist.do")
	public ModelAndView projectlist(HttpServletResponse response,HttpSession session,Criteria cri)throws Exception{
		response.setContentType("text/html; charset=utf-8");
		String boardid = "2";
		String activestatus ="2";
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totNum =  boardService.getBoardIdListtwo(boardid, activestatus).size();
		System.out.println(boardService.getBoardIdListtwo(boardid, activestatus));
		List<BoardVO> boardVO =  boardService.getBoardIdListLimittwo(boardid, activestatus, cri);
		pageMaker.setTotalCount(totNum);
		System.out.println(boardVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_ProjectBoard");
		model.addObject("projectList",boardVO);
		model.addObject("pageMaker",pageMaker);
		return model;
	}
	@RequestMapping(value = "projectlistFilter.do")
	public ModelAndView projectlistFilter(HttpServletResponse response,HttpSession session,Criteria cri,@RequestParam String category)throws Exception{
		response.setContentType("text/html; charset=utf-8");
		String boardid = "2";
		String activestatus ="2";
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totNum = 0; 
		System.out.println(boardService.getBoardIdListtwo(boardid, activestatus));
		List<BoardVO> boardVO = new ArrayList<BoardVO>();
		if(category.equals("default")) {
			totNum = boardService.getBoardIdListtwo(boardid, activestatus).size();
			boardVO =  boardService.getBoardIdListLimittwo(boardid, activestatus, cri);
		}else {
			totNum = boardService.getBoardIdListtwoFilter(boardid, activestatus, category).size();
			boardVO =  boardService.getBoardIdListLimittwoFilter(boardid, activestatus, category, cri);
		}
		
		pageMaker.setTotalCount(totNum);
		System.out.println(boardVO);
		ModelAndView model = new ModelAndView();
		model.setViewName("/viewTot/View_ProjectBoard");
		model.addObject("projectList",boardVO);
		model.addObject("pageMaker",pageMaker);
		return model;
	}
	
	@RequestMapping(value = "viewoneproject/{idx}.do")
	public ModelAndView viewoneproject(@PathVariable("idx") int idx,HttpServletResponse response,HttpSession session) throws Exception{
		int boardnum=idx;
		  System.out.println("정보가 들어오니");
		  BoardVO boardVO = new BoardVO();
		  boardVO=boardService.getBoardView(boardnum);
		  GiftVO giftVO = giftService.getGiftOneBoardNum(boardnum);
		  MemberVO memberVO = new MemberVO();
		  memberVO = memberService.getMemberInfoAdmin(boardVO.getMembernum());
		  DonationVO donationVO = new DonationVO();
		  donationVO.setMembernum((Integer)session.getAttribute("sessionNum"));
		  donationVO.setBoardnum(boardnum);
		  System.out.println("donationVO viewoneproject: " +donationVO);
		  int oneMemberDonation = donationService.sumDoantionmembernum((Integer)session.getAttribute("sessionNum"));
		  System.out.println("1 : " + oneMemberDonation);
		  int oneBoardDonation = donationService.sumDoantionboardnum(boardnum);
		  System.out.println("2 : " +oneBoardDonation);
		  int totProjectDonation = donationService.sumDoantiononeProject(donationVO);
		  System.out.println("3 : " +totProjectDonation);
		  ModelAndView model = new ModelAndView();
		 
		  model.setViewName("/viewTot/View_ProjectOneInfo");
		  model.addObject("boardinfo",boardVO);
		  model.addObject("memberinfo",memberVO);
		  model.addObject("giftinfo",giftVO);
		  model.addObject("oneMemberDonation",oneMemberDonation);
		  model.addObject("oneBoardDonation",oneBoardDonation);
		  model.addObject("totProjectDonation",totProjectDonation);
		  
		  return model;
	}
	@RequestMapping(value = "donateinsert/{idx}.do")
	public ModelAndView donateinsert(@PathVariable("idx") int idx,HttpServletResponse response,HttpSession session,@RequestParam int membernum,@RequestParam int boardnum,@RequestParam int donate )throws Exception{
		DonationVO donationVO = new DonationVO();
		donationVO.setBoardnum(boardnum);
		donationVO.setDonate(donate);
		donationVO.setMembernum((Integer)session.getAttribute("sessionNum"));
		System.out.println(donationVO);
		donationService.insertDonation(donationVO);
		MemberVO memberVO = new MemberVO();
		BoardVO boardVO = new BoardVO();
		ModelAndView model = new ModelAndView();
		donationVO = new DonationVO();
		donationVO.setMembernum((Integer)session.getAttribute("sessionNum"));
		donationVO.setBoardnum(boardnum);
		System.out.println("donationVO donateinsert: " +donationVO);
		int oneMemberDonation = donationService.sumDoantionmembernum((Integer) session.getAttribute("sessionNum"));
		int oneBoardDonation = donationService.sumDoantionboardnum(boardnum);
		int totProjectDonation = donationService.sumDoantiononeProject(donationVO);
		GiftVO giftVO = giftService.getGiftOneBoardNum(boardnum);
		boardVO=boardService.getBoardView(boardnum);
		memberVO = memberService.getMemberInfoAdmin(boardVO.getMembernum());
		
		model.setViewName("/viewTot/View_ProjectOneInfo");
		model.addObject("boardinfo",boardVO);
		model.addObject("memberinfo",memberVO);
		model.addObject("giftinfo",giftVO);
		model.addObject("oneMemberDonation",oneMemberDonation);
		model.addObject("oneBoardDonation",oneBoardDonation);
		model.addObject("totProjectDonation",totProjectDonation);
		
		return model;
	}
	@RequestMapping(value = "donationlist.do")
	public ModelAndView donationlist(HttpServletResponse response,HttpSession session)throws Exception{
		response.setContentType("text/html; charset=utf-8");
		int membernum = (Integer)session.getAttribute("sessionNum");
		
		List<DonationVO> donationVO = donationService.getDonationOnemembernum(membernum);
		List<BoardVO> boardVO = new ArrayList<BoardVO>();
		List<DonationVO> projectDo = donationService.sumDoantionOneGroupBoardnum(membernum);
		List<BoardVO> boardVOt = new ArrayList<BoardVO>();
		for(int i = 0 ; i< donationVO.size();i++) {
			BoardVO a = boardService.getBoardView(donationVO.get(i).getBoardnum());
			boardVO.add(i, a);
			
		}
		for(int i = 0 ; i<projectDo.size();i++ ) {
			BoardVO a = boardService.getBoardView(projectDo.get(i).getBoardnum());
			boardVOt.add(i, a);
		}
		System.out.println(donationVO.size() + " : " + boardVO.size());
		ModelAndView model = new ModelAndView();
			
		int oneMemberDonation = donationService.sumDoantionmembernum(membernum);
		model.setViewName("/viewTot/View_donationMember");
		model.addObject("donationList",donationVO);
		model.addObject("oneMemberDonation",oneMemberDonation);
		model.addObject("boardList",boardVO);
		model.addObject("projectDo",projectDo);
		model.addObject("boardListtwo",boardVOt);
		
		return model;
	}
	
	
}


