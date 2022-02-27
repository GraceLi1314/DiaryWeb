package com.jing.myself.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jing.myself.mapper.DiaryPicMapper;
import com.jing.myself.mapper.PictureMapper;
import com.jing.myself.pojo.Admin;
import com.jing.myself.pojo.DiaryPic;
import com.jing.myself.pojo.DiaryPicExample;
import com.jing.myself.pojo.Picture;
import com.jing.myself.pojo.PictureExample;
import com.jing.myself.service.UserService;

import cn.hutool.core.util.StrUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private PictureMapper pictureMapper;
	@Autowired
	private DiaryPicMapper diaryPicMapper;
	
	@Override
	public Integer addPicture(HttpServletRequest request, MultipartFile file) {
		Integer picNum = Integer.parseInt(request.getParameter("picNum"));
		Picture picture = new Picture(); 
		try{
			Part part = request.getPart("picture"); 
			String fileName = file.getOriginalFilename();
			if (!StrUtil.isBlank(fileName)) {
				String filePath = request.getSession().getServletContext().getRealPath("/admin/upload/");
				System.out.println("real-Path is = "+filePath+"/"+fileName);
				file.transferTo(new File(filePath+"/"+fileName));
			}
			if (!StrUtil.isBlank(fileName)) {
				if (picNum ==1) {
					picture.setPic1(fileName);
				} else if (picNum == 2) {
					picture.setPic2(fileName);
				} else if (picNum == 3) {
					picture.setPic3(fileName);
				} else if (picNum == 4) {
					picture.setPic4(fileName);
				} else if (picNum == 5) {
					picture.setPic5(fileName);
				} else if (picNum == 6) {
					picture.setPic6(fileName);
				} 
			}
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			picture.setUserid(admin.getUserid());
			Integer result = pictureMapper.updateByPrimaryKeySelective(picture); 
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		} 
	}

	@Override
	public Picture defaultPicture(Admin admin) {
		Picture picture = new Picture();
		picture.setPic1("think.jpg");
		picture.setUserid(admin.getUserid());
		picture.setPic2("speak.jpg");
		picture.setPic3("plate.jpg");
		picture.setPic4("travel.png");
		picture.setPic5("make.jpg");
		picture.setPic6("passion.jpg");
		pictureMapper.insert(picture);
		return picture; 
	}

	@Override
	public Picture findPictureByAdminId(Integer userid) {
		PictureExample example = new PictureExample();
		example.createCriteria().andUseridEqualTo(userid); 
		List<Picture> picture = pictureMapper.selectByExample(example);
		if (picture!=null) {
			return picture.get(0);
		} else {
			return null;
		} 
	}
 
	@Override
	public Integer addTextToPicture(HttpServletRequest request, Date time) {
		Integer picNum = Integer.parseInt(request.getParameter("num"));
		String task = request.getParameter("task");
		String diary = request.getParameter("diary");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		DiaryPic diaryPic = new DiaryPic();
		diaryPic.setUserid(admin.getUserid());
		diaryPic.setCategory(task);
		diaryPic.setToday(time);
		diaryPic.setPictureid(picNum);
		diaryPic.setDiary(diary);
		return diaryPicMapper.insert(diaryPic); 
	}

	@Override
	public List<DiaryPic> findTextsbyPicNum(HttpServletRequest request, Integer num) {
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		Integer id = admin.getUserid();
		DiaryPicExample diaryPicExample = new DiaryPicExample();
		diaryPicExample.createCriteria().andPictureidEqualTo(num).andUseridEqualTo(id);
		List<DiaryPic> diaryPic = diaryPicMapper.selectByExample(diaryPicExample);
		return diaryPic;
	}

}
