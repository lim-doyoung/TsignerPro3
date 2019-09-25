package com.bit.tsigner.model.entity;

public class PlannerVo {
	private String loc_dtl_name,sigungu_code,area_code,loc_dtl_cd;
	
	public PlannerVo() {
	}
	
	public String getLoc_dtl_cd() {
		return loc_dtl_cd;
	}

	public void setLoc_dtl_cd(String loc_dtl_cd) {
		this.loc_dtl_cd = loc_dtl_cd;
	}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}


	public String getLoc_dtl_name() {
		return loc_dtl_name;
	}

	public void setLoc_dtl_name(String loc_dtl_name) {
		this.loc_dtl_name = loc_dtl_name;
	}

	@Override
	public String toString() {
		return "PlannerVo [loc_dtl_name=" + loc_dtl_name + ", sigungu_code=" + sigungu_code + ", area_code=" + area_code
				+ ", loc_dtl_cd=" + loc_dtl_cd + ", loc_name=" + loc_name + ", content_id=" + content_id
				+ ", loc_img_url=" + loc_img_url + ", cmnt_content=" + cmnt_content + "]";
	}

	public String getSigungu_code() {
		return sigungu_code;
	}

	public void setSigungu_code(String sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	/***************************************************************************************************************/
	
	String loc_name,content_id,loc_img_url;
	
	public String getLoc_name() {
		return loc_name;
	}
	
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	
	public String getContent_id() {
		return content_id;
	}
	
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	
	public String getLoc_img_url() {
		return loc_img_url;
	}
	
	public void setLoc_img_url(String loc_img_url) {
		this.loc_img_url = loc_img_url;
	}
	
	/********************************************************************************/
	public String cmnt_content;

	public String getCmnt_content() {
		return cmnt_content;
	}

	public void setCmnt_content(String cmnt_content) {
		this.cmnt_content = cmnt_content;
	}
}
