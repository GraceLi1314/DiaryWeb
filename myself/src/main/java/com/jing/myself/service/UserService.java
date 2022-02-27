package com.jing.myself.service;
 
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jing.myself.pojo.Admin;
import com.jing.myself.pojo.DiaryPic;
import com.jing.myself.pojo.Picture;

@Service
public interface UserService {

	Integer addPicture(HttpServletRequest request, MultipartFile file);

	Picture defaultPicture(Admin admin);

	Picture findPictureByAdminId(Integer userid);

	Integer addTextToPicture(HttpServletRequest request, Date time);

	List<DiaryPic> findTextsbyPicNum(HttpServletRequest request, Integer num);

}
