package com.bit.tsigner.model.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class CommunityVo {
	
	int cmnt_seq,cmnt_hits,cmnt_recom;
	String cmnt_title,cmnt_content,cmnt_writer_id,plan_code,cmnt_file_path1,cmnt_file_path2,cmnt_file_path3,cmnt_file_path4,cmnt_file_path5,cmnt_type,cmnt_filename;
	Timestamp regi_date,modi_date,r_regi_date,r_modi_date;
	int recru_per,reqly_total,total_per;
	String hash_tag,recod_id;
	Date together_date;
	int reply_seq,assign_seq,rn,reply_total;
	String reply_id,reply_content,assign_id,assign_title,assign_content,option,user_mem_lev,myself,profile;
	int re_reply_seq,likeCnt;
	Timestamp re_modi_date;
	String re_reply_content,re_reply_id,profile_root,profile_file;
	
	
	public CommunityVo() {
		// TODO Auto-generated constructor stub
	}


	public int getCmnt_seq() {
		return cmnt_seq;
	}


	public void setCmnt_seq(int cmnt_seq) {
		this.cmnt_seq = cmnt_seq;
	}


	public int getCmnt_hits() {
		return cmnt_hits;
	}


	public void setCmnt_hits(int cmnt_hits) {
		this.cmnt_hits = cmnt_hits;
	}


	public int getCmnt_recom() {
		return cmnt_recom;
	}


	public void setCmnt_recom(int cmnt_recom) {
		this.cmnt_recom = cmnt_recom;
	}


	public String getCmnt_title() {
		return cmnt_title;
	}


	public void setCmnt_title(String cmnt_title) {
		this.cmnt_title = cmnt_title;
	}


	public String getCmnt_content() {
		return cmnt_content;
	}


	public void setCmnt_content(String cmnt_content) {
		this.cmnt_content = cmnt_content;
	}


	public String getCmnt_writer_id() {
		return cmnt_writer_id;
	}


	public void setCmnt_writer_id(String cmnt_writer_id) {
		this.cmnt_writer_id = cmnt_writer_id;
	}


	public String getPlan_code() {
		return plan_code;
	}


	public void setPlan_code(String plan_code) {
		this.plan_code = plan_code;
	}


	public String getCmnt_file_path1() {
		return cmnt_file_path1;
	}


	public void setCmnt_file_path1(String cmnt_file_path1) {
		this.cmnt_file_path1 = cmnt_file_path1;
	}


	public String getCmnt_file_path2() {
		return cmnt_file_path2;
	}


	public void setCmnt_file_path2(String cmnt_file_path2) {
		this.cmnt_file_path2 = cmnt_file_path2;
	}


	public String getCmnt_file_path3() {
		return cmnt_file_path3;
	}


	public void setCmnt_file_path3(String cmnt_file_path3) {
		this.cmnt_file_path3 = cmnt_file_path3;
	}


	public String getCmnt_file_path4() {
		return cmnt_file_path4;
	}


	public void setCmnt_file_path4(String cmnt_file_path4) {
		this.cmnt_file_path4 = cmnt_file_path4;
	}


	public String getCmnt_file_path5() {
		return cmnt_file_path5;
	}


	public void setCmnt_file_path5(String cmnt_file_path5) {
		this.cmnt_file_path5 = cmnt_file_path5;
	}


	public String getCmnt_type() {
		return cmnt_type;
	}


	public void setCmnt_type(String cmnt_type) {
		this.cmnt_type = cmnt_type;
	}


	public String getCmnt_filename() {
		return cmnt_filename;
	}


	public void setCmnt_filename(String cmnt_filename) {
		this.cmnt_filename = cmnt_filename;
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


	public Timestamp getR_regi_date() {
		return r_regi_date;
	}


	public void setR_regi_date(Timestamp r_regi_date) {
		this.r_regi_date = r_regi_date;
	}


	public Timestamp getR_modi_date() {
		return r_modi_date;
	}


	public void setR_modi_date(Timestamp r_modi_date) {
		this.r_modi_date = r_modi_date;
	}


	public int getRecru_per() {
		return recru_per;
	}


	public void setRecru_per(int recru_per) {
		this.recru_per = recru_per;
	}


	public int getReqly_total() {
		return reqly_total;
	}


	public void setReqly_total(int reqly_total) {
		this.reqly_total = reqly_total;
	}


	public int getTotal_per() {
		return total_per;
	}


	public void setTotal_per(int total_per) {
		this.total_per = total_per;
	}


	public String getHash_tag() {
		return hash_tag;
	}


	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}


	public String getRecod_id() {
		return recod_id;
	}


	public void setRecod_id(String recod_id) {
		this.recod_id = recod_id;
	}


	public Date getTogether_date() {
		return together_date;
	}


	public void setTogether_date(Date together_date) {
		this.together_date = together_date;
	}


	public int getReply_seq() {
		return reply_seq;
	}


	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}


	public int getAssign_seq() {
		return assign_seq;
	}


	public void setAssign_seq(int assign_seq) {
		this.assign_seq = assign_seq;
	}


	public int getRn() {
		return rn;
	}


	public void setRn(int rn) {
		this.rn = rn;
	}


	public int getReply_total() {
		return reply_total;
	}


	public void setReply_total(int reply_total) {
		this.reply_total = reply_total;
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


	public String getAssign_id() {
		return assign_id;
	}


	public void setAssign_id(String assign_id) {
		this.assign_id = assign_id;
	}


	public String getAssign_title() {
		return assign_title;
	}


	public void setAssign_title(String assign_title) {
		this.assign_title = assign_title;
	}


	public String getAssign_content() {
		return assign_content;
	}


	public void setAssign_content(String assign_content) {
		this.assign_content = assign_content;
	}


	public String getOption() {
		return option;
	}


	public void setOption(String option) {
		this.option = option;
	}


	public String getUser_mem_lev() {
		return user_mem_lev;
	}


	public void setUser_mem_lev(String user_mem_lev) {
		this.user_mem_lev = user_mem_lev;
	}


	public String getMyself() {
		return myself;
	}


	public void setMyself(String myself) {
		this.myself = myself;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public int getRe_reply_seq() {
		return re_reply_seq;
	}


	public void setRe_reply_seq(int re_reply_seq) {
		this.re_reply_seq = re_reply_seq;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public Timestamp getRe_modi_date() {
		return re_modi_date;
	}


	public void setRe_modi_date(Timestamp re_modi_date) {
		this.re_modi_date = re_modi_date;
	}


	public String getRe_reply_content() {
		return re_reply_content;
	}


	public void setRe_reply_content(String re_reply_content) {
		this.re_reply_content = re_reply_content;
	}


	public String getRe_reply_id() {
		return re_reply_id;
	}


	public void setRe_reply_id(String re_reply_id) {
		this.re_reply_id = re_reply_id;
	}


	public String getProfile_root() {
		return profile_root;
	}


	public void setProfile_root(String profile_root) {
		this.profile_root = profile_root;
	}


	public String getProfile_file() {
		return profile_file;
	}


	public void setProfile_file(String profile_file) {
		this.profile_file = profile_file;
	}


	@Override
	public String toString() {
		return "CommunityVo [cmnt_seq=" + cmnt_seq + ", cmnt_hits=" + cmnt_hits + ", cmnt_recom=" + cmnt_recom
				+ ", cmnt_title=" + cmnt_title + ", cmnt_content=" + cmnt_content + ", cmnt_writer_id=" + cmnt_writer_id
				+ ", plan_code=" + plan_code + ", cmnt_file_path1=" + cmnt_file_path1 + ", cmnt_file_path2="
				+ cmnt_file_path2 + ", cmnt_file_path3=" + cmnt_file_path3 + ", cmnt_file_path4=" + cmnt_file_path4
				+ ", cmnt_file_path5=" + cmnt_file_path5 + ", cmnt_type=" + cmnt_type + ", cmnt_filename="
				+ cmnt_filename + ", regi_date=" + regi_date + ", modi_date=" + modi_date + ", r_regi_date="
				+ r_regi_date + ", r_modi_date=" + r_modi_date + ", recru_per=" + recru_per + ", reqly_total="
				+ reqly_total + ", total_per=" + total_per + ", hash_tag=" + hash_tag + ", recod_id=" + recod_id
				+ ", together_date=" + together_date + ", reply_seq=" + reply_seq + ", assign_seq=" + assign_seq
				+ ", rn=" + rn + ", reply_total=" + reply_total + ", reply_id=" + reply_id + ", reply_content="
				+ reply_content + ", assign_id=" + assign_id + ", assign_title=" + assign_title + ", assign_content="
				+ assign_content + ", option=" + option + ", user_mem_lev=" + user_mem_lev + ", myself=" + myself
				+ ", profile=" + profile + ", re_reply_seq=" + re_reply_seq + ", likeCnt=" + likeCnt + ", re_modi_date="
				+ re_modi_date + ", re_reply_content=" + re_reply_content + ", re_reply_id=" + re_reply_id
				+ ", profile_root=" + profile_root + ", profile_file=" + profile_file + "]";
	}


	public CommunityVo(int cmnt_seq, int cmnt_hits, int cmnt_recom, String cmnt_title, String cmnt_content,
			String cmnt_writer_id, String plan_code, String cmnt_file_path1, String cmnt_file_path2,
			String cmnt_file_path3, String cmnt_file_path4, String cmnt_file_path5, String cmnt_type,
			String cmnt_filename, Timestamp regi_date, Timestamp modi_date, Timestamp r_regi_date,
			Timestamp r_modi_date, int recru_per, int reqly_total, int total_per, String hash_tag, String recod_id,
			Date together_date, int reply_seq, int assign_seq, int rn, int reply_total, String reply_id,
			String reply_content, String assign_id, String assign_title, String assign_content, String option,
			String user_mem_lev, String myself, String profile, int re_reply_seq, int likeCnt, Timestamp re_modi_date,
			String re_reply_content, String re_reply_id, String profile_root, String profile_file) {
		super();
		this.cmnt_seq = cmnt_seq;
		this.cmnt_hits = cmnt_hits;
		this.cmnt_recom = cmnt_recom;
		this.cmnt_title = cmnt_title;
		this.cmnt_content = cmnt_content;
		this.cmnt_writer_id = cmnt_writer_id;
		this.plan_code = plan_code;
		this.cmnt_file_path1 = cmnt_file_path1;
		this.cmnt_file_path2 = cmnt_file_path2;
		this.cmnt_file_path3 = cmnt_file_path3;
		this.cmnt_file_path4 = cmnt_file_path4;
		this.cmnt_file_path5 = cmnt_file_path5;
		this.cmnt_type = cmnt_type;
		this.cmnt_filename = cmnt_filename;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
		this.r_regi_date = r_regi_date;
		this.r_modi_date = r_modi_date;
		this.recru_per = recru_per;
		this.reqly_total = reqly_total;
		this.total_per = total_per;
		this.hash_tag = hash_tag;
		this.recod_id = recod_id;
		this.together_date = together_date;
		this.reply_seq = reply_seq;
		this.assign_seq = assign_seq;
		this.rn = rn;
		this.reply_total = reply_total;
		this.reply_id = reply_id;
		this.reply_content = reply_content;
		this.assign_id = assign_id;
		this.assign_title = assign_title;
		this.assign_content = assign_content;
		this.option = option;
		this.user_mem_lev = user_mem_lev;
		this.myself = myself;
		this.profile = profile;
		this.re_reply_seq = re_reply_seq;
		this.likeCnt = likeCnt;
		this.re_modi_date = re_modi_date;
		this.re_reply_content = re_reply_content;
		this.re_reply_id = re_reply_id;
		this.profile_root = profile_root;
		this.profile_file = profile_file;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((assign_content == null) ? 0 : assign_content.hashCode());
		result = prime * result + ((assign_id == null) ? 0 : assign_id.hashCode());
		result = prime * result + assign_seq;
		result = prime * result + ((assign_title == null) ? 0 : assign_title.hashCode());
		result = prime * result + ((cmnt_content == null) ? 0 : cmnt_content.hashCode());
		result = prime * result + ((cmnt_file_path1 == null) ? 0 : cmnt_file_path1.hashCode());
		result = prime * result + ((cmnt_file_path2 == null) ? 0 : cmnt_file_path2.hashCode());
		result = prime * result + ((cmnt_file_path3 == null) ? 0 : cmnt_file_path3.hashCode());
		result = prime * result + ((cmnt_file_path4 == null) ? 0 : cmnt_file_path4.hashCode());
		result = prime * result + ((cmnt_file_path5 == null) ? 0 : cmnt_file_path5.hashCode());
		result = prime * result + ((cmnt_filename == null) ? 0 : cmnt_filename.hashCode());
		result = prime * result + cmnt_hits;
		result = prime * result + cmnt_recom;
		result = prime * result + cmnt_seq;
		result = prime * result + ((cmnt_title == null) ? 0 : cmnt_title.hashCode());
		result = prime * result + ((cmnt_type == null) ? 0 : cmnt_type.hashCode());
		result = prime * result + ((cmnt_writer_id == null) ? 0 : cmnt_writer_id.hashCode());
		result = prime * result + ((hash_tag == null) ? 0 : hash_tag.hashCode());
		result = prime * result + likeCnt;
		result = prime * result + ((myself == null) ? 0 : myself.hashCode());
		result = prime * result + ((option == null) ? 0 : option.hashCode());
		result = prime * result + ((plan_code == null) ? 0 : plan_code.hashCode());
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((profile_file == null) ? 0 : profile_file.hashCode());
		result = prime * result + ((profile_root == null) ? 0 : profile_root.hashCode());
		result = prime * result + ((re_reply_content == null) ? 0 : re_reply_content.hashCode());
		result = prime * result + ((re_reply_id == null) ? 0 : re_reply_id.hashCode());
		result = prime * result + re_reply_seq;
		result = prime * result + ((recod_id == null) ? 0 : recod_id.hashCode());
		result = prime * result + recru_per;
		result = prime * result + ((reply_content == null) ? 0 : reply_content.hashCode());
		result = prime * result + ((reply_id == null) ? 0 : reply_id.hashCode());
		result = prime * result + reply_seq;
		result = prime * result + reply_total;
		result = prime * result + reqly_total;
		result = prime * result + rn;
		result = prime * result + total_per;
		result = prime * result + ((user_mem_lev == null) ? 0 : user_mem_lev.hashCode());
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
		CommunityVo other = (CommunityVo) obj;
		if (assign_content == null) {
			if (other.assign_content != null)
				return false;
		} else if (!assign_content.equals(other.assign_content))
			return false;
		if (assign_id == null) {
			if (other.assign_id != null)
				return false;
		} else if (!assign_id.equals(other.assign_id))
			return false;
		if (assign_seq != other.assign_seq)
			return false;
		if (assign_title == null) {
			if (other.assign_title != null)
				return false;
		} else if (!assign_title.equals(other.assign_title))
			return false;
		if (cmnt_content == null) {
			if (other.cmnt_content != null)
				return false;
		} else if (!cmnt_content.equals(other.cmnt_content))
			return false;
		if (cmnt_file_path1 == null) {
			if (other.cmnt_file_path1 != null)
				return false;
		} else if (!cmnt_file_path1.equals(other.cmnt_file_path1))
			return false;
		if (cmnt_file_path2 == null) {
			if (other.cmnt_file_path2 != null)
				return false;
		} else if (!cmnt_file_path2.equals(other.cmnt_file_path2))
			return false;
		if (cmnt_file_path3 == null) {
			if (other.cmnt_file_path3 != null)
				return false;
		} else if (!cmnt_file_path3.equals(other.cmnt_file_path3))
			return false;
		if (cmnt_file_path4 == null) {
			if (other.cmnt_file_path4 != null)
				return false;
		} else if (!cmnt_file_path4.equals(other.cmnt_file_path4))
			return false;
		if (cmnt_file_path5 == null) {
			if (other.cmnt_file_path5 != null)
				return false;
		} else if (!cmnt_file_path5.equals(other.cmnt_file_path5))
			return false;
		if (cmnt_filename == null) {
			if (other.cmnt_filename != null)
				return false;
		} else if (!cmnt_filename.equals(other.cmnt_filename))
			return false;
		if (cmnt_hits != other.cmnt_hits)
			return false;
		if (cmnt_recom != other.cmnt_recom)
			return false;
		if (cmnt_seq != other.cmnt_seq)
			return false;
		if (cmnt_title == null) {
			if (other.cmnt_title != null)
				return false;
		} else if (!cmnt_title.equals(other.cmnt_title))
			return false;
		if (cmnt_type == null) {
			if (other.cmnt_type != null)
				return false;
		} else if (!cmnt_type.equals(other.cmnt_type))
			return false;
		if (cmnt_writer_id == null) {
			if (other.cmnt_writer_id != null)
				return false;
		} else if (!cmnt_writer_id.equals(other.cmnt_writer_id))
			return false;
		if (hash_tag == null) {
			if (other.hash_tag != null)
				return false;
		} else if (!hash_tag.equals(other.hash_tag))
			return false;
		if (likeCnt != other.likeCnt)
			return false;
		if (myself == null) {
			if (other.myself != null)
				return false;
		} else if (!myself.equals(other.myself))
			return false;
		if (option == null) {
			if (other.option != null)
				return false;
		} else if (!option.equals(other.option))
			return false;
		if (plan_code == null) {
			if (other.plan_code != null)
				return false;
		} else if (!plan_code.equals(other.plan_code))
			return false;
		if (profile == null) {
			if (other.profile != null)
				return false;
		} else if (!profile.equals(other.profile))
			return false;
		if (profile_file == null) {
			if (other.profile_file != null)
				return false;
		} else if (!profile_file.equals(other.profile_file))
			return false;
		if (profile_root == null) {
			if (other.profile_root != null)
				return false;
		} else if (!profile_root.equals(other.profile_root))
			return false;
		if (re_reply_content == null) {
			if (other.re_reply_content != null)
				return false;
		} else if (!re_reply_content.equals(other.re_reply_content))
			return false;
		if (re_reply_id == null) {
			if (other.re_reply_id != null)
				return false;
		} else if (!re_reply_id.equals(other.re_reply_id))
			return false;
		if (re_reply_seq != other.re_reply_seq)
			return false;
		if (recod_id == null) {
			if (other.recod_id != null)
				return false;
		} else if (!recod_id.equals(other.recod_id))
			return false;
		if (recru_per != other.recru_per)
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
		if (reply_seq != other.reply_seq)
			return false;
		if (reply_total != other.reply_total)
			return false;
		if (reqly_total != other.reqly_total)
			return false;
		if (rn != other.rn)
			return false;
		if (total_per != other.total_per)
			return false;
		if (user_mem_lev == null) {
			if (other.user_mem_lev != null)
				return false;
		} else if (!user_mem_lev.equals(other.user_mem_lev))
			return false;
		return true;
	}

	


	

}
