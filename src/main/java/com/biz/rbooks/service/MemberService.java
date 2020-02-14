package com.biz.rbooks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.MemberVO;
import com.biz.rbooks.repository.MemberDao;

@Service
public class MemberService {
	
	
	
	MemberDao memberDao;
	BCryptPasswordEncoder passwordEncoder;
	
	
	
	@Autowired
	public MemberService(MemberDao memberDao, BCryptPasswordEncoder passwordEncoder) {
		super();
		this.memberDao = memberDao;
		this.passwordEncoder = passwordEncoder;
	}




	public String selectById(String m_id) {
		// TODO Auto-generated method stub
		
		
		String id = memberDao.selectById(m_id);
		return id;
	}




	public int insert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		
	
		
		String encodePassword = passwordEncoder.encode(memberVO.getM_password());
		
		memberVO.setM_password(encodePassword);
		
		int ret = memberDao.insert(memberVO);
		return ret;
	}




	public MemberVO loginCheck(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		
		String m_id = memberVO.getM_id();
		String m_password	= memberVO.getM_password();
		
		
		
		// null이거나 로그인 성공 계정ㄷ 넘어옴
		memberVO = memberDao.selectByIdAndPass(m_id);
		
		if(memberVO != null) {
			
			String cryptPassword = memberVO.getM_password();
			
			if(passwordEncoder.matches(m_password, cryptPassword)) {
				
				return memberVO;
			}
			
		}
		
		
		return null;
		
		

	}




	public int updateLogout(String m_login_date, String m_id) {
		// TODO Auto-generated method stub
		
		int ret = memberDao.updateLogout(m_login_date, m_id);
		
		return ret;
	}




	
	
	
	

}
