package com.bit.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.app.service.BoardPage;
import com.bit.app.service.BoardService;
import com.bit.app.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
 
	@Autowired
	BoardService bs;
    
    //�Խñ� �ۼ�
    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String write(){
    	System.out.println("=======wirtejsp���̵� ======");
        return "/write"; // write.jsp�� �̵�
    }
    
    //�Խñ� �ۼ�ó��
    @RequestMapping(value="/insert", method=RequestMethod.POST)
    public String insert(@ModelAttribute BoardVO vo) throws Exception{
    	System.out.println("======�Խñ� �ۼ� ��Ʈ�ѷ� =====");
        bs.create(vo);
        return "redirect:list";
    }
    
    //�󼼳���,��ȸ�� ����
    @RequestMapping(value="/view/{no}", method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("no") int no, HttpSession session) throws Exception{    	
        // ��ȸ�� ���� ó��
        bs.increaseViewcnt(no, session);
        ModelAndView mav = new ModelAndView();
        // ���� �̸�
        mav.setViewName("/detail");
        // �信 ������ ������
        mav.addObject("vo", bs.read(no));
        return mav;
    }
    
    //�Խñ� ����   
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String update(@ModelAttribute BoardVO vo) throws Exception{
    	System.out.println("========�Խñ� ���� ��Ʈ�ѷ�=========");
        bs.update(vo);
        
        return "redirect:list";
    }
    
    // �Խñ� ����
    @RequestMapping("/delete")
    public String delete(@RequestParam int no) throws Exception{
        bs.delete(no);
        return "redirect:list";
    }
        
    //�Խñ� ��ü list & Search list 
    @RequestMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "all") String search,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curpage			
			) throws Exception {
    	
    	System.out.println("======BOARD LIST Controller======");
    	
		// �Խñ� ����
		int count = bs.countArticle(search, keyword);    	
		
	    //PAGE
		BoardPage bp = new BoardPage(count,curpage);
		int start = bp.getPageBegin();
		int end = bp.getPageEnd();				
		
    	//�Խñ� list
		List<BoardVO> list = bs.listAll(start,end, search, keyword);
								
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // ���ڵ��� ����
		map.put("search", search); // �˻��ɼ�
		map.put("keyword", keyword); // �˻�Ű����
		//page
		map.put("bp", bp);
				
		ModelAndView mav = new ModelAndView();		
		mav.addObject("map", map); 
		mav.setViewName("/boardlist"); //boardlist.jsp�� 
		return mav;
	}

}
