package com.jing.myself.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.jing.myself.mapper.AdminMapper;
import com.jing.myself.pojo.Admin;
import com.jing.myself.pojo.AdminExample;
import com.jing.myself.service.AdminService;

import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.crypto.digest.MD5;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;  
	
	@Override
	public Integer register(String pwd, String nickname, String fullname) { 
		Admin admin = new Admin();
		String password = DigestUtil.md5Hex(pwd);
		admin.setPassword(password); 
		admin.setNickname(nickname);
		admin.setFullname(fullname);
		Integer result = adminMapper.insert(admin);
		return result;
	}
 
	@Override
	public Admin findAdminByNickName(String nickname) {
		AdminExample adminExample = new AdminExample(); 
		adminExample.createCriteria().andNicknameEqualTo(nickname);
		List<Admin> adminList = (List<Admin>) adminMapper.selectByExample(adminExample); 
		if (adminList.size() != 0 && adminList != null) {
			return adminList.get(0);
		} else {
			return null;
		}
	} 
}

