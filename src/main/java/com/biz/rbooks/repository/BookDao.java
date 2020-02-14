package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.biz.rbooks.domain.BookVO;

public interface BookDao {

	@Select("SELECT MAX(b_code) FROM tbl_books")
	public String selectMaxBCode();

	@Insert("INSERT INTO tbl_books(b_code, b_name, b_auther, b_comp, b_year, b_iprice) values(#{b_code, jdbcType=VARCHAR}, #{b_name, jdbcType=VARCHAR}, #{b_auther, jdbcType=VARCHAR},"
			+ "#{b_comp, jdbcType=VARCHAR}, #{b_year, jdbcType=VARCHAR}, #{b_iprice, jdbcType=VARCHAR})")
	public int insert(BookVO bookVO);

	@Select("SELECT * FROM tbl_books")
	public List<BookVO> selectAll();

	@Select("SELECT * FROM tbl_books WHERE b_code = #{b_code}")
	public BookVO selectByBCode(String b_code);

	@Update("UPDATE tbl_books SET b_name = #{b_name, jdbcType=VARCHAR}, b_auther = #{b_auther, jdbcType=VARCHAR}, "
			+ " b_comp = #{b_comp, jdbcType=VARCHAR}, b_year = #{b_year, jdbcType=VARCHAR}, b_iprice = #{b_iprice, jdbcType=VARCHAR} WHERE b_code = #{b_code, jdbcType=VARCHAR}")
	public int update(BookVO bookVO);

	@Delete("DELETE FROM tbl_books WHERE b_code = #{b_code}")
	public int delete(String b_code);

	public List<BookVO> searchBookList(@Param("names") List<String> names);

}
