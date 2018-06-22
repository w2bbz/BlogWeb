package com.wen.business.model;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "base_user", catalog = "baseweb")
public class BaseUser implements Serializable{
	
	@Id
	@Column(name="id")
	@ApiModelProperty(hidden=true)
	private Long id;

	@Column(name="name")
	private String name;	

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@Column(name="add_time")
	private Date addTime;
	
	@Column(name="account")
	private String account;
	
	@Column(name="password")
	@ApiModelProperty(hidden=true)
	private String password;
	
	@Column(name="state")
	@ApiModelProperty(hidden=true)
	private Integer state;
	
	@Column(name="delete_state")
	@ApiModelProperty(hidden=true)
	private Integer deleteState;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getDeleteState() {
		return deleteState;
	}

	public void setDeleteState(Integer deleteState) {
		this.deleteState = deleteState;
	}
	
	
	
	
}
