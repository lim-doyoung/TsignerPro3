package com.bit.tsigner.model.entity;

import java.sql.Date;

public class InqReplyVo {
	
	Integer inq_seq, reply_seq;
	String reply_id, reply_content;
	Date regi_date, modi_date;
	
	public InqReplyVo() {
		// TODO Auto-generated constructor stub
	}
	
	public InqReplyVo(Integer inq_seq, Integer reply_seq, String reply_id, String reply_content, Date regi_date,
			Date modi_date) {
		super();
		this.inq_seq = inq_seq;
		this.reply_seq = reply_seq;
		this.reply_id = reply_id;
		this.reply_content = reply_content;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((inq_seq == null) ? 0 : inq_seq.hashCode());
		result = prime * result + ((reply_content == null) ? 0 : reply_content.hashCode());
		result = prime * result + ((reply_id == null) ? 0 : reply_id.hashCode());
		result = prime * result + ((reply_seq == null) ? 0 : reply_seq.hashCode());
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
		InqReplyVo other = (InqReplyVo) obj;
		if (inq_seq == null) {
			if (other.inq_seq != null)
				return false;
		} else if (!inq_seq.equals(other.inq_seq))
			return false;
		if (reply_content == null) {
			if (other.reply_content != null)
				return false;
		} else if (!reply_content.equals(other.reply_content))
			return false;
		if (reply_id == null) {
			if (other.reply_id != null)
				return false;
		} else if (!reply_id.equals(other.reply_id))
			return false;
		if (reply_seq == null) {
			if (other.reply_seq != null)
				return false;
		} else if (!reply_seq.equals(other.reply_seq))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "InqReplyVo [inq_seq=" + inq_seq + ", reply_seq=" + reply_seq + ", reply_id=" + reply_id
				+ ", reply_content=" + reply_content + ", regi_date=" + regi_date + ", modi_date=" + modi_date + "]";
	}

	public Integer getInq_seq() {
		return inq_seq;
	}

	public void setInq_seq(Integer inq_seq) {
		this.inq_seq = inq_seq;
	}

	public Integer getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(Integer reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getReply_id() {
		return reply_id;
	}

	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
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
	
}
