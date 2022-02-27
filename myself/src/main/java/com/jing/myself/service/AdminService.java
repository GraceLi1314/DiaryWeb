package com.jing.myself.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jing.myself.pojo.Admin;

@Service
public interface AdminService {
	Integer register(String pwd, String nickname, String fullname);
	Admin findAdminByNickName(String nickname);
}
