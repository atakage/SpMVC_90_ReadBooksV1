package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.biz.rbooks.domain.ReadBookVO;

public interface ReadBookDao {

	
	@Select("SELECT * FROM tbl_read_book")
	public List<ReadBookVO> selectAll();
	
	@Select("SELECT b_name FROM tbl_books INNER JOIN tbl_read_book ON tbl_books.b_code = tbl_read_book.rb_bcode")
	public List<String> selectBNameByRBBCode(List<ReadBookVO> readBookList);

	@Select("SELECT seq_read_book.currval FROM dual")
	public int getCurSeq();

	@Insert("INSERT INTO tbl_read_book(rb_seq ,rb_bcode, rb_date, rb_rtime, rb_subject, tb_text, rb_star) VALUES(seq_read_book.nextval , #{rb_bcode, jdbcType=VARCHAR}, #{rb_date, jdbcType=VARCHAR}, #{rb_rtime, jdbcType=VARCHAR }, #{rb_subject, jdbcType=VARCHAR }, #{tb_text, jdbcType=VARCHAR }, #{rb_star, jdbcType=VARCHAR })")
	public int insert(ReadBookVO readBookVO);

	@Select("SELECT * FROM tbl_read_book WHERE rb_seq = #{rb_seq, jdbcType=VARCHAR}")
	public ReadBookVO selectReadBookListBySeq(String rb_seq);

	@Update("UPDATE tbl_read_book SET rb_date = #{rb_date , jdbcType=VARCHAR}, rb_rtime = #{rb_rtime , jdbcType=VARCHAR}, rb_subject = #{rb_subject , jdbcType=VARCHAR}, tb_text = #{tb_text , jdbcType=VARCHAR}, rb_star = #{rb_star , jdbcType=VARCHAR} WHERE rb_seq = #{rb_seq , jdbcType=VARCHAR}")
	public int update(ReadBookVO readBookVO);

	
	@Delete("DELETE FROM tbl_read_book WHERE rb_seq = #{rb_seq}")
	public int delete(int rb_seq);

	public List<ReadBookVO> searchReadBookList(List<String> names);

	
	@Select("SELECT * FROM tbl_read_book WHERE ${optionVal} LIKE '%' || #{searchVal} || '%'")
	public List<ReadBookVO> searchSubject(@Param("optionVal") String optionVal, @Param("searchVal") String searchVal);
	
	

	

}
