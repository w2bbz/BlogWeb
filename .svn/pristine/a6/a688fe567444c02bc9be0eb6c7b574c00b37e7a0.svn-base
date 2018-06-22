package com.wen.business.model;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "baidu_mark_api", catalog = "blogweb")
public class BaiduMarkApi implements Serializable{
	
	@Id
	@Column(name="id")
	@ApiModelProperty(hidden=true)
	private Long id;

	@Column(name="name")
	private String name;
	
	@Column(name="account")
	@ApiModelProperty(hidden=true)
	private String account;
	
	@Column(name="password")
	@ApiModelProperty(hidden=true)
	private String password;
	
	@Column(name="ak")
	@ApiModelProperty(hidden=true)
	private String ak;
	
	@Column(name="url")
	@ApiModelProperty(hidden=true)
	private String url;
	
	@Column(name="exp")
	@ApiModelProperty(hidden=true)
	private String exp;
	
	@Column(name="content")
	@ApiModelProperty(hidden=true)
	private String content;
	
	@Column(name="method")
	@ApiModelProperty(hidden=true)
	private String method;
	
	@Column(name="add_time")
	private Date addTime;
	
	@Column(name="state")
	private Integer state;
	
	@Column(name="delete_state")
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

	public String getAk() {
		return ak;
	}

	public void setAk(String ak) {
		this.ak = ak;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
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
