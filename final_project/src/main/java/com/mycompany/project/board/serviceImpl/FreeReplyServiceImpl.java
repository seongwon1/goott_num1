package com.mycompany.project.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeReplyDAO;
import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.FreeReplyPageDTO;
import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.service.FreeReplyService;



@Service
public class FreeReplyServiceImpl implements FreeReplyService{

	@Autowired
	FreeReplyDAO replyDao;
	
	@Override
	public int insertReply(FreeReplyDTO dto) {
		// TODO Auto-generated method stub
		
		int result = replyDao.insertRply(dto); 
		
		return result;
	}

	@Override
	public FreeReplyPageDTO replyList(Criteria cri) {
		FreeReplyPageDTO dto = new FreeReplyPageDTO();
		
		dto.setList(replyDao.replyList(cri));
		dto.setPageInfo(new PageMakerDTO(cri, replyDao.replyTotal(cri.getFree_board_id())));
		
		return dto;
	}

	@Override
	public int deleteReply(FreeReplyDTO dto) {
		// TODO Auto-generated method stub

		int result = replyDao.deleteReply(dto.getReplyId()); 
		
		return result;
		
	}

	@Override
	public int updateReply(FreeReplyDTO dto) {
		// TODO Auto-generated method stub
		int result = replyDao.updateReply(dto); 
		System.out.println(dto);
		return result;
	}

	@Override
	public FreeReplyDTO getUpdateReply(int replyId) {
		// TODO Auto-generated method stub
		return replyDao.getUpdateReply(replyId);
	}

	

}
