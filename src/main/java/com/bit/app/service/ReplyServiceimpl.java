package com.bit.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.app.dao.ReplyDAO;
import com.bit.app.vo.ReplyVO;

@Service
public class ReplyServiceimpl implements ReplyService{
    @Autowired
    ReplyDAO dao;
    
    // ��� ���
    @Override
    public List<ReplyVO> list(int b_no) {
    	System.out.println("=========== ��� ����Ʈ service ==============");
//    	System.out.println("�Խñ� ��ȣ :  " + bno);    	
        return dao.list(b_no);
    }
    // ��� �ۼ�
    @Override
    public void create(ReplyVO vo) {
    	System.out.println("=========== ��� �ۼ� service ==============");
        dao.create(vo);
    }
    // ��� ����
    @Override
    public void update(ReplyVO vo) {
        // TODO Auto-generated method stub
 
    }
    // ��� ����
    @Override
    public void delete(int rno) {
        // TODO Auto-generated method stub
 
    }
}
