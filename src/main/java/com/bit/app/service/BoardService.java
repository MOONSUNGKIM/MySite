package com.bit.app.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bit.app.vo.BoardVO;

public interface BoardService {
    //�ۼ�
    public void create(BoardVO vo) throws Exception;
    //�󼼺���
    public BoardVO read(int bno) throws Exception;
    //����
    public void update(BoardVO vo) throws Exception;
    //����
    public void delete(int bno) throws Exception;
    //��ü list
  //  public List<BoardVO> listAll() throws Exception;
    //��ȸ
    public void increaseViewcnt(int bno, HttpSession session) throws Exception;
    
    //search(�˻�)
    //����¡ , �˻��ɼ�, Ű���� �˻� 
    public List<BoardVO> listAll(int start, int end, String search, String keyword) throws Exception;
    //���ڵ� ���� 
    public int countArticle(String search, String keyword) throws Exception;
    //
    
    
}
