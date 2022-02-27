package com.jing.myself.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jing.myself.pojo.Admin;
import com.jing.myself.pojo.Picture;
import com.jing.myself.service.AdminService;
import com.jing.myself.service.UserService;
import com.jing.myself.vo.ResultInfo;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;

/**
 * Servlet implementation class UserServlet
 */
@Controller
@MapperScan(basePackages = "com.jing.myself.mapper.AdminMapper")  
@RequestMapping("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
    	request.getSession().invalidate();
    	return "login";
    }
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
    	String nickname = request.getParameter("nickname");
    	String password = request.getParameter("password");
    	String encryptPwd = DigestUtil.md5Hex(password);
    	Admin admin = (Admin) adminService.findAdminByNickName(nickname); 
    	ResultInfo<Admin> resultInfo = new ResultInfo<>();
    	if (StrUtil.isBlank(nickname) || StrUtil.isBlank(password)) {
    		resultInfo.setMessage("用户名或密码不能为空");
    		resultInfo.setCode(0);
    		request.setAttribute("resultInfo", resultInfo);
    		return "login";
    	}
    	if (admin == null) {
    		resultInfo.setMessage("用户名不正确");
    		resultInfo.setCode(0); 
    		request.setAttribute("resultInfo", resultInfo);
    		return "login";
    	} 
    	Admin admin1 = new Admin();
    	admin1.setNickname(nickname); 
    		String correctPwd = admin.getPassword();
    		if (!encryptPwd.equals(correctPwd)) {
    			resultInfo.setMessage("用户名或密码不正确");
    			resultInfo.setCode(0);
    			resultInfo.setResult(admin1);
    			request.setAttribute("resultInfo", resultInfo);
    			return "login";
    		} else {
    			request.getSession().setAttribute("admin", admin);
    			//找到admin对应的picture对象
    			Picture picture = userService.findPictureByAdminId(admin.getUserid());
    			request.getSession().setAttribute("picture", picture);
    			return "index";
    		}  
    }
	@RequestMapping("/register")
	public String register(HttpServletRequest request) {
		String nickname = request.getParameter("nickname");
		String fullname = request.getParameter("fullname");
		String pwd = request.getParameter("password");
		String confirmpwd = request.getParameter("password-confirm"); 
		Admin admin = new Admin();
		ResultInfo<Admin> resultInfo = new ResultInfo<>();
		//检验用户输入有效
		if (StrUtil.isBlank(confirmpwd) || StrUtil.isBlank(fullname) || StrUtil.isBlank(nickname) || StrUtil.isBlank(pwd)) {
			admin.setFullname(fullname);
			admin.setNickname(nickname); 
			resultInfo.setCode(0);
			admin.setPassword(pwd);
			resultInfo.setMessage("用户名密码或昵称不能为空");
			resultInfo.setResult(admin); 
			request.setAttribute("resultInfo", resultInfo);
			//不跳转到其他页面，原来用户写的信息还是封装到resultInfo返回给request, 然后页面可以显示
			return "signup";
		} 
		//添加用户到数据库
		//查看是否有这个昵称
		Admin foundAdmin = (Admin) adminService.findAdminByNickName(nickname);
		if (foundAdmin != null) {
			admin.setFullname(fullname);
			admin.setPassword(pwd);
			resultInfo.setCode(0);
			resultInfo.setMessage("已存在此昵称，请重新填写");
			resultInfo.setResult(admin);
			request.setAttribute("resultInfo", resultInfo);
			return "signup";
		}
		//添加用户成功 
		adminService.register(confirmpwd, nickname, fullname);
		foundAdmin = adminService.findAdminByNickName(nickname);
		//register的同时，给此用户创建默认的picture对象
		Picture picture = userService.defaultPicture(foundAdmin);
		request.getSession().setAttribute("picture", picture);
		//转到登陆页面
		return "login";
	} 

}
