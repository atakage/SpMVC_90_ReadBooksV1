package com.biz.rbooks.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.rbooks.domain.BookVO;
import com.biz.rbooks.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/book")
@Controller
public class BookController {
	
	
	
	BookService bookService;
	
	
	
	
	
	@Autowired
	public BookController(BookService bookService) {
		super();
		this.bookService = bookService;
	}



	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String  bookInsertStart() {
		
		return "book_insert";
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/createcode", method=RequestMethod.GET)
	public String createBcode(Model model) {
		
		String max_b_code = bookService.getMaxBCode();
		
		
		System.out.println("맥스코드!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + max_b_code);
		
		
		
		if(max_b_code == null) {   // 안에 데이터 없을 때
			
		}
		
		String max_middle_code = max_b_code.substring(7,13);
		
		
		
		
		
		int int_max_middle_code = Integer.valueOf(max_middle_code)+1;
		
		
		String b_code = String.format("979-11-%d-0-0", int_max_middle_code);
		
		
		
		return b_code;
		
	}
	
	
	@RequestMapping(value="insertnext", method=RequestMethod.GET)
	public String insertNext(@RequestParam("b_code") String b_code, @RequestParam("b_name") String b_name, @RequestParam("b_auther") String b_auther,
			@RequestParam("b_comp") String b_comp, @RequestParam("b_year") String b_year, @RequestParam("b_iprice") int b_iprice, Model model) {
		
		
		
		
		BookVO bookVO = new BookVO();
		
		 bookVO = BookVO.builder().b_code(b_code).b_name(b_name).b_auther(b_auther).b_comp(b_comp).b_year(b_year).b_iprice(b_iprice).build();
		
		
		int ret = bookService.insert(bookVO);
		
		
		if(ret < 0) {
		
			model.addAttribute("INSERT_CONFIRM", "INSERT_FAIL");
			return "redirect:/";	
		}else {
			model.addAttribute("INSERT_CONFIRM", "INSERT_OK");
			return "redirect:/";
		}
		
		

		
	}
	
	
	@RequestMapping(value="/update", method =RequestMethod.GET)
	public String updateBook(@RequestParam("b_code") String b_code, Model model) {
		
		BookVO bookVO = bookService.selectByBCode(b_code);
		
		
		model.addAttribute("BOOKVO", bookVO);
		
		
		return "book_insert";
		
	}
	
	
	@RequestMapping(value="/updatenext", method=RequestMethod.GET)
	public String updateNext(@RequestParam("b_code") String b_code, @RequestParam("b_name") String b_name, @RequestParam("b_auther") String b_auther,
			@RequestParam("b_comp") String b_comp, @RequestParam("b_year") String b_year, @RequestParam("b_iprice") int b_iprice, Model model) {
		
		BookVO bookVO = new BookVO();
		
		bookVO = BookVO.builder().b_code(b_code).b_name(b_name).b_auther(b_auther).b_comp(b_comp).b_year(b_year).b_iprice(b_iprice).build();
		
		int ret = bookService.update(bookVO);
		
		
		if(ret < 0) {
			
			model.addAttribute("UPDATE_CONFIRM", "UPDATE_FAIL");
			return "redirect:/";	
		}else {
			model.addAttribute("UPDATE_CONFIRM", "UPDATE_OK");
			return "redirect:/";
		}
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deletenext", method=RequestMethod.POST)
	public String deleteNext(@RequestParam("b_code") String b_code) {
		int ret = bookService.delete(b_code);
		
		
		
		return ret+"";
		
		
		
		
	}
	
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam("searchVal") String searchVal, Model model) {
		
		List<BookVO> bookList = bookService.searchBookList(searchVal);
		
		model.addAttribute("BOOKLIST", bookList);
		model.addAttribute("SEARCHINCLUDE" , "BOOKLIST");
		return "home";
	}
	

	
	/*
	@ResponseBody
	@RequestMapping(value="/endValue", method=RequestMethod.POST)
	public JSONArray endValue(@RequestParam("endVal") String endVal, Model model) {
		
		
		int endValI = Integer.valueOf(endVal);
		
		
		log.debug("엔드밸류"+endVal);
		
		List<BookVO> bookList = bookService.getBookList(endValI);
		
		
		
		JSONarray bookJsonArray =  new JSONArray();
		
		bookJsonArray.addAll(bookList);
		
		
		return bookJsonArray;
		
	}
	*/
}
