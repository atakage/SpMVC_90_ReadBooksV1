package com.biz.rbooks.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class MemberVO {
	
	
	private String m_id;//	varchar2(6 byte)
	private String m_password;//	nvarchar2(125 char)
	private String m_login_date;//	nvarchar2(125 char)

}
