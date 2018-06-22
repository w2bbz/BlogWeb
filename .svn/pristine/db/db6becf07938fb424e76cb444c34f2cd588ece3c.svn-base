package com.wen.business.util;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class RestResult implements Serializable {

	private Integer status = 200;

	private String message;

	private Object data;

	private Long total;

	private Integer start;

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
		if (data instanceof com.github.pagehelper.Page) {
			com.github.pagehelper.Page page = (com.github.pagehelper.Page) data;
			this.total = page.getTotal();
			this.start = page.getStartRow();
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

}
