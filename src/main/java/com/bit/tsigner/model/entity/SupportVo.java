package com.bit.tsigner.model.entity;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class SupportVo {
	
	int inq_seq, inq_reply_cnt;
	String user_id, user_email, inq_type, inq_title, inq_content, inq_origin_no, inq_group_ord, inq_group_layer;
	String inq_file_path1, inq_file_path2, inq_file_path3, inq_file_path4, inq_file_path5;
	Date regi_date, modi_date;
	MultipartFile[] upload_files;	//getter setter만 만들어줬음
	
	public SupportVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "SupportVo [inq_seq=" + inq_seq + ", inq_reply_cnt=" + inq_reply_cnt + ", user_id=" + user_id
				+ ", user_email=" + user_email + ", inq_type=" + inq_type + ", inq_title=" + inq_title
				+ ", inq_content=" + inq_content + ", inq_origin_no=" + inq_origin_no + ", inq_group_ord="
				+ inq_group_ord + ", inq_group_layer=" + inq_group_layer + ", inq_file_path1=" + inq_file_path1
				+ ", inq_file_path2=" + inq_file_path2 + ", inq_file_path3=" + inq_file_path3 + ", inq_file_path4="
				+ inq_file_path4 + ", inq_file_path5=" + inq_file_path5 + ", regi_date=" + regi_date + ", modi_date="
				+ modi_date + ", upload_files=" + Arrays.toString(upload_files) + "]";
	}

	public SupportVo(int inq_seq, int inq_reply_cnt, String user_id, String user_email, String inq_type,
			String inq_title, String inq_content, String inq_origin_no, String inq_group_ord, String inq_group_layer,
			String inq_file_path1, String inq_file_path2, String inq_file_path3, String inq_file_path4,
			String inq_file_path5, Date regi_date, Date modi_date, MultipartFile[] upload_files) {
		super();
		this.inq_seq = inq_seq;
		this.inq_reply_cnt = inq_reply_cnt;
		this.user_id = user_id;
		this.user_email = user_email;
		this.inq_type = inq_type;
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_origin_no = inq_origin_no;
		this.inq_group_ord = inq_group_ord;
		this.inq_group_layer = inq_group_layer;
		this.inq_file_path1 = inq_file_path1;
		this.inq_file_path2 = inq_file_path2;
		this.inq_file_path3 = inq_file_path3;
		this.inq_file_path4 = inq_file_path4;
		this.inq_file_path5 = inq_file_path5;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
		this.upload_files = upload_files;
	}

	public int getInq_seq() {
		return inq_seq;
	}

	public void setInq_seq(int inq_seq) {
		this.inq_seq = inq_seq;
	}

	public int getInq_reply_cnt() {
		return inq_reply_cnt;
	}

	public void setInq_reply_cnt(int inq_reply_cnt) {
		this.inq_reply_cnt = inq_reply_cnt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getInq_type() {
		return inq_type;
	}

	public void setInq_type(String inq_type) {
		this.inq_type = inq_type;
	}

	public String getInq_title() {
		return inq_title;
	}

	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}

	public String getInq_content() {
		return inq_content;
	}

	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}

	public String getInq_origin_no() {
		return inq_origin_no;
	}

	public void setInq_origin_no(String inq_origin_no) {
		this.inq_origin_no = inq_origin_no;
	}

	public String getInq_group_ord() {
		return inq_group_ord;
	}

	public void setInq_group_ord(String inq_group_ord) {
		this.inq_group_ord = inq_group_ord;
	}

	public String getInq_group_layer() {
		return inq_group_layer;
	}

	public void setInq_group_layer(String inq_group_layer) {
		this.inq_group_layer = inq_group_layer;
	}

	public String getInq_file_path1() {
		return inq_file_path1;
	}

	public void setInq_file_path1(String inq_file_path1) {
		this.inq_file_path1 = inq_file_path1;
	}

	public String getInq_file_path2() {
		return inq_file_path2;
	}

	public void setInq_file_path2(String inq_file_path2) {
		this.inq_file_path2 = inq_file_path2;
	}

	public String getInq_file_path3() {
		return inq_file_path3;
	}

	public void setInq_file_path3(String inq_file_path3) {
		this.inq_file_path3 = inq_file_path3;
	}

	public String getInq_file_path4() {
		return inq_file_path4;
	}

	public void setInq_file_path4(String inq_file_path4) {
		this.inq_file_path4 = inq_file_path4;
	}

	public String getInq_file_path5() {
		return inq_file_path5;
	}

	public void setInq_file_path5(String inq_file_path5) {
		this.inq_file_path5 = inq_file_path5;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}

	public Date getModi_date() {
		return modi_date;
	}

	public void setModi_date(Date modi_date) {
		this.modi_date = modi_date;
	}

	public MultipartFile[] getUpload_files() {
		return upload_files;
	}

	public void setUpload_files(MultipartFile[] upload_files) {
		this.upload_files = upload_files;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((inq_content == null) ? 0 : inq_content.hashCode());
		result = prime * result + ((inq_file_path1 == null) ? 0 : inq_file_path1.hashCode());
		result = prime * result + ((inq_file_path2 == null) ? 0 : inq_file_path2.hashCode());
		result = prime * result + ((inq_file_path3 == null) ? 0 : inq_file_path3.hashCode());
		result = prime * result + ((inq_file_path4 == null) ? 0 : inq_file_path4.hashCode());
		result = prime * result + ((inq_file_path5 == null) ? 0 : inq_file_path5.hashCode());
		result = prime * result + ((inq_group_layer == null) ? 0 : inq_group_layer.hashCode());
		result = prime * result + ((inq_group_ord == null) ? 0 : inq_group_ord.hashCode());
		result = prime * result + ((inq_origin_no == null) ? 0 : inq_origin_no.hashCode());
		result = prime * result + inq_reply_cnt;
		result = prime * result + inq_seq;
		result = prime * result + ((inq_title == null) ? 0 : inq_title.hashCode());
		result = prime * result + ((inq_type == null) ? 0 : inq_type.hashCode());
		result = prime * result + Arrays.hashCode(upload_files);
		result = prime * result + ((user_email == null) ? 0 : user_email.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SupportVo other = (SupportVo) obj;
		if (inq_content == null) {
			if (other.inq_content != null)
				return false;
		} else if (!inq_content.equals(other.inq_content))
			return false;
		if (inq_file_path1 == null) {
			if (other.inq_file_path1 != null)
				return false;
		} else if (!inq_file_path1.equals(other.inq_file_path1))
			return false;
		if (inq_file_path2 == null) {
			if (other.inq_file_path2 != null)
				return false;
		} else if (!inq_file_path2.equals(other.inq_file_path2))
			return false;
		if (inq_file_path3 == null) {
			if (other.inq_file_path3 != null)
				return false;
		} else if (!inq_file_path3.equals(other.inq_file_path3))
			return false;
		if (inq_file_path4 == null) {
			if (other.inq_file_path4 != null)
				return false;
		} else if (!inq_file_path4.equals(other.inq_file_path4))
			return false;
		if (inq_file_path5 == null) {
			if (other.inq_file_path5 != null)
				return false;
		} else if (!inq_file_path5.equals(other.inq_file_path5))
			return false;
		if (inq_group_layer == null) {
			if (other.inq_group_layer != null)
				return false;
		} else if (!inq_group_layer.equals(other.inq_group_layer))
			return false;
		if (inq_group_ord == null) {
			if (other.inq_group_ord != null)
				return false;
		} else if (!inq_group_ord.equals(other.inq_group_ord))
			return false;
		if (inq_origin_no == null) {
			if (other.inq_origin_no != null)
				return false;
		} else if (!inq_origin_no.equals(other.inq_origin_no))
			return false;
		if (inq_reply_cnt != other.inq_reply_cnt)
			return false;
		if (inq_seq != other.inq_seq)
			return false;
		if (inq_title == null) {
			if (other.inq_title != null)
				return false;
		} else if (!inq_title.equals(other.inq_title))
			return false;
		if (inq_type == null) {
			if (other.inq_type != null)
				return false;
		} else if (!inq_type.equals(other.inq_type))
			return false;
		if (!Arrays.equals(upload_files, other.upload_files))
			return false;
		if (user_email == null) {
			if (other.user_email != null)
				return false;
		} else if (!user_email.equals(other.user_email))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		return true;
	}


	
	// uploadfiles may not work - 확인하기
	
}
