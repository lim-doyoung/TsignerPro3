package com.bit.tsigner.model.entity;

import java.sql.Date;

public class FaqVo {
	
	int faq_seq;
	String faq_title, faq_content;
	Date regi_date;
	
	public FaqVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "FaqVo [faq_seq=" + faq_seq + ", faq_title=" + faq_title + ", faq_content=" + faq_content
				+ ", regi_date=" + regi_date + "]";
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((faq_content == null) ? 0 : faq_content.hashCode());
		result = prime * result + faq_seq;
		result = prime * result + ((faq_title == null) ? 0 : faq_title.hashCode());
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
		FaqVo other = (FaqVo) obj;
		if (faq_content == null) {
			if (other.faq_content != null)
				return false;
		} else if (!faq_content.equals(other.faq_content))
			return false;
		if (faq_seq != other.faq_seq)
			return false;
		if (faq_title == null) {
			if (other.faq_title != null)
				return false;
		} else if (!faq_title.equals(other.faq_title))
			return false;
		return true;
	}

	public FaqVo(int faq_seq, String faq_title, String faq_content, Date regi_date) {
		super();
		this.faq_seq = faq_seq;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.regi_date = regi_date;
	}

	public int getFaq_seq() {
		return faq_seq;
	}

	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public Date getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
}
