package com.bit.tsigner.model.entity;

import java.sql.Timestamp;

public class ReplyVo {
	Integer event_seq, reply_seq;
	String reply_id, reply_content;
	Timestamp regi_date, modi_date;
	
	public ReplyVo() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVo(Integer event_seq, Integer reply_seq, String reply_id, String reply_content, Timestamp regi_date,
			Timestamp modi_date) {
		super();
		this.event_seq = event_seq;
		this.reply_seq = reply_seq;
		this.reply_id = reply_id;
		this.reply_content = reply_content;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
	}

	@Override
	public String toString() {
		return "ReplyVo [event_seq=" + event_seq + ", reply_seq=" + reply_seq + ", reply_id=" + reply_id
				+ ", reply_content=" + reply_content + ", regi_date=" + regi_date + ", modi_date=" + modi_date + "]";
	}

	public Integer getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(Integer event_seq) {
		this.event_seq = event_seq;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((event_seq == null) ? 0 : event_seq.hashCode());
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
		ReplyVo other = (ReplyVo) obj;
		if (event_seq == null) {
			if (other.event_seq != null)
				return false;
		} else if (!event_seq.equals(other.event_seq))
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
	
	
	
	
	
}
