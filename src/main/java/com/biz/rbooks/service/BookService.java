package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BookVO;
import com.biz.rbooks.repository.BookDao;

@Service
public class BookService {

	
	BookDao bookDao;

	
	@Autowired
	public BookService(BookDao bookDao) {
		super();
		this.bookDao = bookDao;
	}


	public String getMaxBCode() {
		// TODO Auto-generated method stub
		
		String max_b_code = bookDao.selectMaxBCode();
		
		return max_b_code;
	}


	public int insert(BookVO bookVO) {
		// TODO Auto-generated method stub
		
		
		
		int ret = bookDao.insert(bookVO);
		return ret;
	}


	public List<BookVO> getBookList() {
		// TODO Auto-generated method stub
		
		List<BookVO>  bookList= bookDao.selectAll();
		return bookList;
	}


	public BookVO selectByBCode(String b_code) {
		// TODO Auto-generated method stub
		
		BookVO bookVO = bookDao.selectByBCode(b_code);
		
		
		return bookVO;
	}


	public int update(BookVO bookVO) {
		// TODO Auto-generated method stub
		
		int ret = bookDao.update(bookVO);
		
		return ret;
	}


	public int delete(String b_code) {
		// TODO Auto-generated method stub
		
		int ret = bookDao.delete(b_code);
		return ret;
	}


	public List<BookVO> searchBookList(String searchVal) {
		// TODO Auto-generated method stub
		
		List<String> names = Arrays.asList(searchVal.split(" "));
		
		return bookDao.searchBookList(names);
	}
	
	
	
	
	
}
