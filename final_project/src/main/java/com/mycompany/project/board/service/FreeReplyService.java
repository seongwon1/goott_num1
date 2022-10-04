package com.mycompany.project.board.service;

import java.util.List;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.FreeReplyDTO;
import com.mycompany.project.board.model.FreeReplyPageDTO;



public interface FreeReplyService {
	
	public int insertReply(FreeReplyDTO dto);
	public FreeReplyPageDTO replyList(Criteria cri);
	public int deleteReply(FreeReplyDTO dto);
	public int updateReply(FreeReplyDTO dto);
	public FreeReplyDTO getUpdateReply(int free_board_id);

}
