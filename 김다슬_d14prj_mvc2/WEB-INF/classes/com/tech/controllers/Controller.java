package com.tech.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	// 추상메소드 집합
	public void execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
