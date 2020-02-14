package com.biz.rbooks.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.biz.rbooks.domain.MemberVO;

public interface MemberDao {

	
	@Select("SELECT m_id FROM tbl_member WHERE m_id = #{m_id}")
	public String selectById(String m_id);

	@Insert("INSERT INTO tbl_member(m_id, m_password) VALUES(#{m_id, jdbcType=VARCHAR}, #{m_password, jdbcType=VARCHAR})")
	public int insert(MemberVO memberVO);

	
	@Select("SELECT * FROM tbl_member WHERE m_id = #{m_id}")
	public MemberVO selectByIdForAll(String m_id);

	@Select("SELECT * FROM tbl_member WHERE m_id = #{m_id}")
	public MemberVO selectByIdAndPass(String m_id);

	@Update("UPDATE tbl_member SET m_login_date = #{m_login_date, jdbcType=VARCHAR} WHERE m_id = #{m_id , jdbcType=VARCHAR} ")
	public int updateLogout(@Param("m_login_date") String m_login_date, @Param("m_id") String m_id);

}
