package com.jing.myself.controller;

import java.io.IOException; 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.jing.myself.pojo.Admin;
import com.jing.myself.pojo.DiaryPic;
import com.jing.myself.pojo.Picture;
import com.jing.myself.service.AdminService;
import com.jing.myself.service.UserService;
import com.jing.myself.vo.PictureVo;
import com.jing.myself.vo.ResultInfo;

@Controller
@MapperScan(basePackages="com.jing.myself.PictureMapper")  
public class UserServlet { 
	@Autowired
	private UserService userService; 
	
	@RequestMapping("/user/addPicture") 
	public String addPicture(HttpServletRequest request,@RequestParam("picture") MultipartFile file) throws IOException, ServletException {
		ResultInfo<Object> resultInfo = new ResultInfo<>();   
		 Integer result = userService.addPicture(request, file);
		 if (result == 1) {
			 resultInfo.setCode(1);
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			 Picture picture = userService.findPictureByAdminId(admin.getUserid()); 
					//更新session中的picture对象
			request.getSession().setAttribute("picture", picture);		 
		 } else {
			 resultInfo.setCode(0);
			 resultInfo.setMessage("更新不成功");
		 }
		 request.setAttribute("resultInfo", resultInfo);
		 return "index";
	}
	@RequestMapping("/user/saveText")
	public String saveText(HttpServletRequest request, @RequestParam("date") String date) throws ParseException {
		String diary = request.getParameter("diary");
		Date time = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(date);
		System.out.println("date is = "+date);
		if (diary == "") {
			return "index";
		} else {
			Integer result = userService.addTextToPicture(request, time); 
		}
		 return "index";
	}
	@RequestMapping("/user/getMessages")
	public String getMessages(HttpServletRequest request, @RequestParam("picNum") Integer num, @RequestParam("desc") String picDesc) {
		List<DiaryPic> diaryPic = userService.findTextsbyPicNum(request, num);
		//get All the messages and categories of the diaryPic object
		String message = "";
		String category = "";
		Date time = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		List<String> messages = new ArrayList<>();
		List<String> categories = new ArrayList<>();
		String date = ""; 
		ResultInfo<String> resultInfo = new ResultInfo<>();
		if (diaryPic.size() == 0) { 
			return "index";
		}
		for (DiaryPic object: diaryPic) { 
			message = object.getDiary();
			category = object.getCategory();
			time = object.getToday(); 
			date = dateFormat.format(time);
			System.out.println("the date now is "+date);
			message = message + "   by   "+date; 
			categories.add(category);
			messages.add(message);  
		} 
		System.out.println("size = "+messages.size());
		request.setAttribute("categories", categories);
		request.setAttribute("messages", messages);
		request.setAttribute("picDesc", picDesc);
		return "messages";
	}
}
