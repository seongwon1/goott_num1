package com.mycompany.project.board.model;

import java.util.List;

public interface FreeReplyDAO {
	
	public int insertRply(FreeReplyDTO dto);
	public List<FreeReplyDTO> replyList(Criteria cri);
	public int replyTotal(int replyId);
	public int deleteReply(int replyId);
	public int updateReply(FreeReplyDTO dto);
	public FreeReplyDTO getUpdateReply(int free_board_id);
	
}
