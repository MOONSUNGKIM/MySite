package com.bit.app.service;

import java.util.List;

import com.bit.app.vo.ReplyVO;

public interface ReplyService {

    // ���list
    public List<ReplyVO> list(int bno);
    // ��ۻ���
    public void create(ReplyVO vo);
    // ��ۼ���
    public void update(ReplyVO vo);
    // ��ۻ���
    public void delete(int rno);
    
}