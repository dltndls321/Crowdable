package com.sooin.crowdable.service.impl;

import org.springframework.stereotype.Service;

import com.sooin.crowdable.service.Main_Service;

@Service
public class Main_ServiceImpl implements Main_Service {

	@Override
	public String main_crowdable() {
		return "크로우다블서비스";
	}

}
