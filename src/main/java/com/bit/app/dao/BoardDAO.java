package com.bit.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.app.vo.BoardVO;

@Repository
public class BoardDAO {
    @Autowired
    SqlSession ss;
	//�ۼ�
    public void create(BoardVO vo) throws Exception {
    	System.out.println("======�Խñ� �ۼ� DAO =====");
    	ss.insert("boardinsert", vo);
    }
    //��
    public BoardVO read(int bno) throws Exception {
    	System.out.println("==============================readDAO===============================");
        return ss.selectOne("boardview", bno);
    }
    //����    
    public void update(BoardVO vo) throws Exception {
    	ss.update("boardupdate", vo);
    }
    //����    
    public void delete(int bno) throws Exception {
    	ss.delete("boarddelete",bno);
    }
//    //��ü list    
//    public List<BoardVO> listAll() throws Exception {
//    	System.out.println("==============================DAO ===============================");
//        return ss.selectList("boardlistAll");
//    }
    //��ȸ�� ����    
    public void increaseViewcnt(int no) throws Exception {
    	System.out.println("==============================��ȸ��DAO ===============================");
    	ss.update("boardincreaseViewcnt", no);
    }
    
    
    //Search
    //����¡
    //�Խñ� ��� ==> �˻��ɼ�, Ű����
    
    public List<BoardVO> listAll(int start, int end ,String search, String keyword) throws Exception{
    	System.out.println("======BOARD LIST dao======");
    	Map<String, Object> map = new HashMap<String,Object>();
        map.put("search", search);
        map.put("keyword", keyword);
        //����¡ 
        map.put("start",start);
        map.put("end", end);
        
        return ss.selectList("boardlistAll", map);

    }
    //�Խñ� ���ڵ� ����
    public int countArticle(String search, String keyword) throws Exception{
    	System.out.println("=====SEARCHcount DAO  ===== ");
    	 Map<String, String> map = new HashMap<String, String>();
    	    map.put("search", search);
    	    map.put("keyword", keyword);
    	    return ss.selectOne("boardcountArticle", map);

    }
}
