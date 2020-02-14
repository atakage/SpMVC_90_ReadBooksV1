package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BookVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.repository.ReadBookDao;

@Service
public class ReadBookService {

	
	
	private ReadBookDao readBookDao;
	
	
	
	@Autowired
	public ReadBookService(ReadBookDao readBookDao) {
		super();
		this.readBookDao = readBookDao;
	}




	public List<ReadBookVO> getReadBookList() {
		// TODO Auto-generated method stub
		
		List<ReadBookVO> readBookList = readBookDao.selectAll();
		
		
		return readBookList;
	}




	public List<String> selectBNameByRBBCode(List<ReadBookVO> readBookList) {
		// TODO Auto-generated method stub
		
		System.out.println("리드북리스틍ㅇㅇ서비스"+readBookList.toString());
		List<String> b_nameList = readBookDao.selectBNameByRBBCode(readBookList);
		System.out.println("북네임리스트"+b_nameList.toString());
		return b_nameList;
	}




	public int getCurSeq() {
		// TODO Auto-generated method stub
		
		int seq_read_book = readBookDao.getCurSeq();
		return seq_read_book;
	}




	public int insert(ReadBookVO readBookVO) {
		// TODO Auto-generated method stub
		
		System.out.println("리드북브이오인서트"+ readBookVO.toString());
		
		int ret = readBookDao.insert(readBookVO);
		return ret;
	}




	public ReadBookVO selectReadBookListBySeq(String rb_seq) {
		// TODO Auto-generated method stub
		
		ReadBookVO readBookVO = readBookDao.selectReadBookListBySeq(rb_seq);
		
		return readBookVO;
	}




	public int update(ReadBookVO readBookVO) {
		
		 int ret = readBookDao.update(readBookVO);
		// TODO Auto-generated method stub
		return ret;
	}




	public int delete(int rb_seq) {
		// TODO Auto-generated method stub
		
		int ret = readBookDao.delete(rb_seq);
		return ret;
	}




	public List<ReadBookVO> searchReadBookList(String searchVal) {
		// TODO Auto-generated method stub
		
		List<String> names = Arrays.asList(searchVal.split(" "));
		return readBookDao.searchReadBookList(names);
	}




	public List<ReadBookVO> searchSubject(String optionSubject, String searchVal) {
		// TODO Auto-generated method stub
		
		 
		
		return readBookDao.searchSubject(optionSubject, searchVal);
	}

}
