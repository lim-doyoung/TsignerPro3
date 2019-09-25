package com.bit.tsigner.model.entity;

import java.sql.Timestamp;

public class PayVo {

	int pay_seq;
	String user_id, pay_info, pay_cost;
	Timestamp pay_day;
	String pay_checkIn, pay_checkOut;
	
	public PayVo() {
	}

	public PayVo(int pay_seq, String user_id, String pay_info, String pay_cost, Timestamp pay_day, String pay_checkIn,
			String pay_checkOut) {
		super();
		this.pay_seq = pay_seq;
		this.user_id = user_id;
		this.pay_info = pay_info;
		this.pay_cost = pay_cost;
		this.pay_day = pay_day;
		this.pay_checkIn = pay_checkIn;
		this.pay_checkOut = pay_checkOut;
	}

	public int getPay_seq() {
		return pay_seq;
	}

	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPay_info() {
		return pay_info;
	}

	public void setPay_info(String pay_info) {
		this.pay_info = pay_info;
	}

	public String getPay_cost() {
		return pay_cost;
	}

	public void setPay_cost(String pay_cost) {
		this.pay_cost = pay_cost;
	}

	public Timestamp getPay_day() {
		return pay_day;
	}

	public void setPay_day(Timestamp pay_day) {
		this.pay_day = pay_day;
	}

	public String getPay_checkIn() {
		return pay_checkIn;
	}

	public void setPay_checkIn(String pay_checkIn) {
		this.pay_checkIn = pay_checkIn;
	}

	public String getPay_checkOut() {
		return pay_checkOut;
	}

	public void setPay_checkOut(String pay_checkOut) {
		this.pay_checkOut = pay_checkOut;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pay_checkIn == null) ? 0 : pay_checkIn.hashCode());
		result = prime * result + ((pay_checkOut == null) ? 0 : pay_checkOut.hashCode());
		result = prime * result + ((pay_cost == null) ? 0 : pay_cost.hashCode());
		result = prime * result + ((pay_day == null) ? 0 : pay_day.hashCode());
		result = prime * result + ((pay_info == null) ? 0 : pay_info.hashCode());
		result = prime * result + pay_seq;
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
		PayVo other = (PayVo) obj;
		if (pay_checkIn == null) {
			if (other.pay_checkIn != null)
				return false;
		} else if (!pay_checkIn.equals(other.pay_checkIn))
			return false;
		if (pay_checkOut == null) {
			if (other.pay_checkOut != null)
				return false;
		} else if (!pay_checkOut.equals(other.pay_checkOut))
			return false;
		if (pay_cost == null) {
			if (other.pay_cost != null)
				return false;
		} else if (!pay_cost.equals(other.pay_cost))
			return false;
		if (pay_day == null) {
			if (other.pay_day != null)
				return false;
		} else if (!pay_day.equals(other.pay_day))
			return false;
		if (pay_info == null) {
			if (other.pay_info != null)
				return false;
		} else if (!pay_info.equals(other.pay_info))
			return false;
		if (pay_seq != other.pay_seq)
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PayVo [pay_seq=" + pay_seq + ", user_id=" + user_id + ", pay_info=" + pay_info + ", pay_cost="
				+ pay_cost + ", pay_day=" + pay_day + ", pay_checkIn=" + pay_checkIn + ", pay_checkOut=" + pay_checkOut
				+ "]";
	}
	
}
