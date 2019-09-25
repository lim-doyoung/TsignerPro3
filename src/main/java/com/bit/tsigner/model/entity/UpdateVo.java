package com.bit.tsigner.model.entity;

import java.sql.Timestamp;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class UpdateVo {
	int update_seq, update_hits;
	String update_title, update_content, update_writer_id, update_type;
	String update_file_path1, update_file_path2, update_file_path3;
	String update_file_path4, update_file_path5;
	Timestamp regi_date, modi_date;
	MultipartFile[] upload_files;	//getter setter만 만들어줬음
	
	
	
	public UpdateVo() {
		// TODO Auto-generated constructor stub
	}

	public UpdateVo(int update_seq, int update_hits, String update_title, String update_content,
			String update_writer_id, String update_type, String update_file_path1, String update_file_path2,
			String update_file_path3, String update_file_path4, String update_file_path5, Timestamp regi_date,
			Timestamp modi_date, MultipartFile[] upload_files) {
		super();
		this.update_seq = update_seq;
		this.update_hits = update_hits;
		this.update_title = update_title;
		this.update_content = update_content;
		this.update_writer_id = update_writer_id;
		this.update_type = update_type;
		this.update_file_path1 = update_file_path1;
		this.update_file_path2 = update_file_path2;
		this.update_file_path3 = update_file_path3;
		this.update_file_path4 = update_file_path4;
		this.update_file_path5 = update_file_path5;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
		this.upload_files = upload_files;
	}

	@Override
	public String toString() {
		return "UpdateVo [update_seq=" + update_seq + ", update_hits=" + update_hits + ", update_title=" + update_title
				+ ", update_content=" + update_content + ", update_writer_id=" + update_writer_id + ", update_type="
				+ update_type + ", update_file_path1=" + update_file_path1 + ", update_file_path2=" + update_file_path2
				+ ", update_file_path3=" + update_file_path3 + ", update_file_path4=" + update_file_path4
				+ ", update_file_path5=" + update_file_path5 + ", regi_date=" + regi_date + ", modi_date=" + modi_date
				+ ", upload_files=" + Arrays.toString(upload_files) + "]";
	}

	public int getUpdate_seq() {
		return update_seq;
	}

	public void setUpdate_seq(int update_seq) {
		this.update_seq = update_seq;
	}

	public int getUpdate_hits() {
		return update_hits;
	}

	public void setUpdate_hits(int update_hits) {
		this.update_hits = update_hits;
	}

	public String getUpdate_title() {
		return update_title;
	}

	public void setUpdate_title(String update_title) {
		this.update_title = update_title;
	}

	public String getUpdate_content() {
		return update_content;
	}

	public void setUpdate_content(String update_content) {
		this.update_content = update_content;
	}

	public String getUpdate_writer_id() {
		return update_writer_id;
	}

	public void setUpdate_writer_id(String update_writer_id) {
		this.update_writer_id = update_writer_id;
	}

	public String getUpdate_type() {
		return update_type;
	}

	public void setUpdate_type(String update_type) {
		this.update_type = update_type;
	}

	public String getUpdate_file_path1() {
		return update_file_path1;
	}

	public void setUpdate_file_path1(String update_file_path1) {
		this.update_file_path1 = update_file_path1;
	}

	public String getUpdate_file_path2() {
		return update_file_path2;
	}

	public void setUpdate_file_path2(String update_file_path2) {
		this.update_file_path2 = update_file_path2;
	}

	public String getUpdate_file_path3() {
		return update_file_path3;
	}

	public void setUpdate_file_path3(String update_file_path3) {
		this.update_file_path3 = update_file_path3;
	}

	public String getUpdate_file_path4() {
		return update_file_path4;
	}

	public void setUpdate_file_path4(String update_file_path4) {
		this.update_file_path4 = update_file_path4;
	}

	public String getUpdate_file_path5() {
		return update_file_path5;
	}

	public void setUpdate_file_path5(String update_file_path5) {
		this.update_file_path5 = update_file_path5;
	}

	public Timestamp getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Timestamp regi_date) {
		this.regi_date = regi_date;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
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
		result = prime * result + ((update_content == null) ? 0 : update_content.hashCode());
		result = prime * result + ((update_file_path1 == null) ? 0 : update_file_path1.hashCode());
		result = prime * result + ((update_file_path2 == null) ? 0 : update_file_path2.hashCode());
		result = prime * result + ((update_file_path3 == null) ? 0 : update_file_path3.hashCode());
		result = prime * result + ((update_file_path4 == null) ? 0 : update_file_path4.hashCode());
		result = prime * result + ((update_file_path5 == null) ? 0 : update_file_path5.hashCode());
		result = prime * result + update_hits;
		result = prime * result + update_seq;
		result = prime * result + ((update_title == null) ? 0 : update_title.hashCode());
		result = prime * result + ((update_type == null) ? 0 : update_type.hashCode());
		result = prime * result + ((update_writer_id == null) ? 0 : update_writer_id.hashCode());
		result = prime * result + Arrays.hashCode(upload_files);
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
		UpdateVo other = (UpdateVo) obj;
		if (update_content == null) {
			if (other.update_content != null)
				return false;
		} else if (!update_content.equals(other.update_content))
			return false;
		if (update_file_path1 == null) {
			if (other.update_file_path1 != null)
				return false;
		} else if (!update_file_path1.equals(other.update_file_path1))
			return false;
		if (update_file_path2 == null) {
			if (other.update_file_path2 != null)
				return false;
		} else if (!update_file_path2.equals(other.update_file_path2))
			return false;
		if (update_file_path3 == null) {
			if (other.update_file_path3 != null)
				return false;
		} else if (!update_file_path3.equals(other.update_file_path3))
			return false;
		if (update_file_path4 == null) {
			if (other.update_file_path4 != null)
				return false;
		} else if (!update_file_path4.equals(other.update_file_path4))
			return false;
		if (update_file_path5 == null) {
			if (other.update_file_path5 != null)
				return false;
		} else if (!update_file_path5.equals(other.update_file_path5))
			return false;
		if (update_hits != other.update_hits)
			return false;
		if (update_seq != other.update_seq)
			return false;
		if (update_title == null) {
			if (other.update_title != null)
				return false;
		} else if (!update_title.equals(other.update_title))
			return false;
		if (update_type == null) {
			if (other.update_type != null)
				return false;
		} else if (!update_type.equals(other.update_type))
			return false;
		if (update_writer_id == null) {
			if (other.update_writer_id != null)
				return false;
		} else if (!update_writer_id.equals(other.update_writer_id))
			return false;
		if (!Arrays.equals(upload_files, other.upload_files))
			return false;
		return true;
	}
	
	
	
	
	

	
	
	
}
