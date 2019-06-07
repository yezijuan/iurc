package com.iurc.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iurc.entity.Collection;
import com.iurc.service.BaseService;
import com.iurc.service.CollectionService;

@Controller
@RequestMapping("/collection")
public class CollectionController extends BaseController<Collection>{

	@Resource
	private CollectionService collectionService;
	@Override
	protected BaseService<Collection> getBaseService() {
		return collectionService;
	}

	@Override
	protected String getPrefix() {
		return "/collection";
	}

}
