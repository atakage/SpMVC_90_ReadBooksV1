package com.biz.rbooks.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.rbooks.domain.BookVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.service.BookService;
import com.biz.rbooks.service.ReadBookService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	
	
	ReadBookService readBookService;
	BookService bookService;
	
	
	
	@Autowired
	public HomeController(ReadBookService readBookService, BookService bookService) {
		super();
		this.readBookService = readBookService;
		this.bookService = bookService;
	}




	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		
			int endVal = 10;
			//List<ReadBookVO> readBookList = readBookService.getReadBookList();
			List<BookVO> bookList = bookService.getBookList();
			
			
			model.addAttribute("endVal", endVal);
			model.addAttribute("BOOKLIST", bookList);
			model.addAttribute("SEARCHINCLUDE" , "BOOKLIST");
		
		
			
		
		
		
		
		return "home";
	}
	
}
