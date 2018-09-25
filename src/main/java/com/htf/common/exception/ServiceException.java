package com.htf.common.exception;

/**
 * @author acumes
 * @date 2018/9/18 11:29
 */
public class ServiceException extends Exception {

	public ServiceException(String code, String message) {
		this.code = code;
		this.message = message;
	}

	public ServiceException(String code) {
		this.code = code;
		this.message = code;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -5884570245402940933L;

	/**
	 * 异常描述
	 */
	private String message;
	/**
	 * 异常编码信息
	 */
	private String code;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
