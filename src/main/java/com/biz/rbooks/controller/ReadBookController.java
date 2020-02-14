package com.biz.rbooks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.rbooks.domain.BookVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.service.BookService;
import com.biz.rbooks.service.ReadBookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/readbook")
@Controller
public class ReadBookController {

	
	ReadBookService readBookService;
	BookService bookService;
	
	
	@Autowired
	public ReadBookController(ReadBookService readBookService, BookService bookService) {
		super();
		this.readBookService = readBookService;
		this.bookService = bookService;
	}




	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String readBookList(Model model) {
		
		List<ReadBookVO> readBookList = readBookService.getReadBookList();
		
		//System.out.println("리드북리스틍ㅇㅇ"+readBookList.toString());
		
		List<String> b_nameList= readBookService.selectBNameByRBBCode(readBookList);
		
		model.addAttribute("READBOOKLIST" , readBookList);
		model.addAttribute("READBOOKATTR", "READBOOKATTR");
		model.addAttribute("BOOKNAMELIST", b_nameList);
		model.addAttribute("SEARCHINCLUDE" , "READBOOKLIST");
		return "readbooklist";
	}
	
	
	
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String readBookInsert(Model model) {
		
		List<BookVO> bookList = bookService.getBookList();
		//int seq_read_book = readBookService.getCurSeq();
		
		model.addAttribute("BOOKLIST", bookList);
		//model.addAttribute("SEQREADBOOK", String.valueOf(seq_read_book));
		return "readbook_insert";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertnext", method=RequestMethod.POST)
	public String readBookInsertNext(@RequestParam("rb_bcode") String rb_bcode, @RequestParam("rb_date") String rb_date, @RequestParam("rb_rtime") int rb_rtime, @RequestParam("rb_subject") String rb_subject,
			@RequestParam("rb_text") String rb_text, @RequestParam("rb_star") int rb_star) {
		
		
		System.out.println("알비비코드"+rb_bcode);
		
		
		ReadBookVO readBookVO = new ReadBookVO();
		
		readBookVO = ReadBookVO.builder().rb_bcode(rb_bcode).rb_rtime(rb_rtime).rb_date(rb_date).rb_subject(rb_subject).tb_text(rb_text).rb_star(rb_star).build();
		
		
		
		int ret = readBookService.insert(readBookVO);
		
		if(ret < 1) {
			return "FAIL";
		}else {
			int seq_read_book  = readBookService.getCurSeq();
			return seq_read_book+"";
		}
		
		
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String readBookUpdate(@RequestParam("rb_seq") String rb_seq, Model model) {
		
		
		ReadBookVO readBookVO = readBookService.selectReadBookListBySeq(rb_seq);
		
		if(readBookVO.getTb_text() == null) {
			readBookVO.setTb_text(" ");			// 공백 시 널 포인트 방지
		}
		
		
		readBookVO.setTb_text(readBookVO.getTb_text().replace("<br/>", "\r\n"));
		
		
		
		model.addAttribute("READBOOKVO", readBookVO);
		return "readbook_insert";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updatenext")
	public String readBookUpdateNext(@RequestParam("rb_seq") int rb_seq, @RequestParam("rb_bcode") String rb_bcode, @RequestParam("rb_date") String rb_date, @RequestParam("rb_rtime") int rb_rtime, 
			@RequestParam("rb_subject") String rb_subject, @RequestParam("rb_text") String rb_text, @RequestParam("rb_star") int rb_star ) {
		
		
		ReadBookVO readBookVO = new ReadBookVO();
		
		readBookVO = ReadBookVO.builder().rb_seq(rb_seq).rb_bcode(rb_bcode).rb_date(rb_date).rb_rtime(rb_rtime).rb_subject(rb_subject).tb_text(rb_text).rb_star(rb_star).build();
		
		
		int ret= readBookService.update(readBookVO);
		
		
		if(ret < 1) {
			return "FAIL";
		}else {
			return "OK";
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String readBookDelete(@RequestParam("rb_seq") int rb_seq) {
		
		int ret = readBookService.delete(rb_seq);
		
		if(ret < 1) {
			return "FAIL";
		}else {
			return "OK";
		}
	}
	
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String readBookView(@RequestParam("rb_seq") String rb_seq, @RequestParam("rb_bname") String rb_bname, Model model) {
		
		ReadBookVO readBookVO= readBookService.selectReadBookListBySeq(rb_seq);
		
		readBookVO.setRb_bname(rb_bname);
		
		model.addAttribute("READBOOKVO", readBookVO);
		
		return "readbook_view";
		
	}
	
	
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String readBookSearch(
			@RequestParam("optionVal") String optionVal, @RequestParam("searchVal")String searchVal, Model model) {
		
		
		log.debug("옵션밸"+optionVal);
		log.debug("서치밸"+searchVal);
		
		
		if(optionVal != null) { // option의 value값이 subject면 한줄소감으로 검색
			
			
			List<ReadBookVO> readBookList = readBookService.searchSubject(optionVal, searchVal);
			List<String> b_nameList= readBookService.selectBNameByRBBCode(readBookList);
			
			
			model.addAttribute("READBOOKLIST" , readBookList);
			model.addAttribute("BOOKNAMELIST", b_nameList);
			model.addAttribute("READBOOKATTR", "READBOOKATTR");
			model.addAttribute("SEARCHINCLUDE" , "READBOOKLIST");
			
			return "readbooklist";
			
		}
		
			
		
		// 아니면 도서명으로 검색 (못함 아직)
		
		List<ReadBookVO> readBookList = readBookService.getReadBookList();
		
		//System.out.println("리드북리스틍ㅇㅇ"+readBookList.toString());
		
		List<String> b_nameList= readBookService.selectBNameByRBBCode(readBookList);
		
		model.addAttribute("READBOOKLIST" , readBookList);
		model.addAttribute("BOOKNAMELIST", b_nameList);
		model.addAttribute("READBOOKATTR", "READBOOKATTR");
		model.addAttribute("SEARCHINCLUDE" , "READBOOKLIST");
		
		return "readbooklist";
		
		
	}
	
	
	
}
