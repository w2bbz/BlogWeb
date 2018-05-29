package com.wen.business.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "demo", catalog = "baseweb")
public class Demo implements Serializable {
	
	@Id
	@Column(name="d_id")
	private Long dId;

	@Column(name="d_name")
	private String dName;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	//@Temporal(TemporalType.TIMESTAMP)
	@Column(name="d_add_time")
	private Date dAddTime;

	@Column(name="d_delete_state")
	private Integer dDeleteState;
	

	public Long getdId() {
		return dId;
	}

	public void setdId(Long dId) {
		this.dId = dId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public Date getdAddTime() {
		return dAddTime;
	}

	public void setdAddTime(Date dAddTime) {
		this.dAddTime = dAddTime;
	}

	public Integer getdDeleteState() {
		return dDeleteState;
	}

	public void setdDeleteState(Integer dDeleteState) {
		this.dDeleteState = dDeleteState;
	}

	
}
