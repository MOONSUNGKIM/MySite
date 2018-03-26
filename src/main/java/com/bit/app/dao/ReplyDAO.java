package com.bit.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.app.vo.ReplyVO;

@Repository
public class ReplyDAO {
	@Autowired
	SqlSession ss;
	
	// ��� list
    public List<ReplyVO> list(int bno){
    	System.out.println("=========���list DAO=========");
    	 return ss.selectList("replylist", bno);
    }
    // ����Է�
    public void create(ReplyVO vo) {
    	System.out.println("===========��� insert DAO============");
         ss.insert("replyinsert", vo);
    }
    // ��ۼ���
    public void update(ReplyVO vo) {
    	
    }
    // ��ۻ���
    public void delete(Integer rno) {
    	
    }
}
