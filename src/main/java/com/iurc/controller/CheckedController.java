package com.iurc.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iurc.entity.Checked;
import com.iurc.service.BaseService;
import com.iurc.service.CheckedService;

@Controller
@RequestMapping("/checked")
public class CheckedController extends BaseController<Checked>{

	@Resource
	private CheckedService checkedService;
	@Override
	protected BaseService<Checked> getBaseService() {
		return checkedService;
	}

	@Override
	protected String getPrefix() {
		return "/checked";
	}

}
