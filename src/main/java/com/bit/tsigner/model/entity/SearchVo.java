package com.bit.tsigner.model.entity;

import java.sql.Timestamp;

public class SearchVo {
	int search_seq,search_hits,cmnt_type;
	String keyword,tag;
	Timestamp search_date;
	
	public SearchVo() {
		// TODO Auto-generated constructor stub
	}

	public int getSearch_seq() {
		return search_seq;
	}

	public void setSearch_seq(int search_seq) {
		this.search_seq = search_seq;
	}

	public int getSearch_hits() {
		return search_hits;
	}

	public void setSearch_hits(int search_hits) {
		this.search_hits = search_hits;
	}

	public int getCmnt_type() {
		return cmnt_type;
	}

	public void setCmnt_type(int cmnt_type) {
		this.cmnt_type = cmnt_type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Timestamp getSearch_date() {
		return search_date;
	}

	public void setSearch_date(Timestamp search_date) {
		this.search_date = search_date;
	}

	public SearchVo(int search_seq, int search_hits, int cmnt_type, String keyword, String tag, Timestamp search_date) {
		super();
		this.search_seq = search_seq;
		this.search_hits = search_hits;
		this.cmnt_type = cmnt_type;
		this.keyword = keyword;
		this.tag = tag;
		this.search_date = search_date;
	}

	@Override
	public String toString() {
		return "SearchVo [search_seq=" + search_seq + ", search_hits=" + search_hits + ", cmnt_type=" + cmnt_type
				+ ", keyword=" + keyword + ", tag=" + tag + ", search_date=" + search_date + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cmnt_type;
		result = prime * result + ((keyword == null) ? 0 : keyword.hashCode());
		result = prime * result + search_hits;
		result = prime * result + search_seq;
		result = prime * result + ((tag == null) ? 0 : tag.hashCode());
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
		SearchVo other = (SearchVo) obj;
		if (cmnt_type != other.cmnt_type)
			return false;
		if (keyword == null) {
			if (other.keyword != null)
				return false;
		} else if (!keyword.equals(other.keyword))
			return false;
		if (search_hits != other.search_hits)
			return false;
		if (search_seq != other.search_seq)
			return false;
		if (tag == null) {
			if (other.tag != null)
				return false;
		} else if (!tag.equals(other.tag))
			return false;
		return true;
	}

	

	
}
