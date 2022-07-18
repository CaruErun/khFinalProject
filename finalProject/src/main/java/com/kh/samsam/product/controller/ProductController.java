package com.kh.samsam.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.samsam.common.model.vo.Category;
import com.kh.samsam.product.model.service.ProductService;
import com.kh.samsam.product.model.vo.Product;
import com.kh.samsam.product.model.vo.ProductImages;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("insertProductForm.pr")
	public String insertProductForm() {
		return "product/insertProductForm";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCateList.pr", produces="json/application; charset=UTF-8")
	public String selectCategoryList(int categoryNo){
		ArrayList<Category> cateList = productService.selectCategoryList(categoryNo);
		return new Gson().toJson(cateList);
		
	}
	@RequestMapping("insertProduct.pr")
	public String insertProduct(Product p
								,MultipartFile[] upfile
								,HttpSession session
								,Model model) {
		
		System.out.println(p);
	
		ArrayList<ProductImages> list = new ArrayList<>();
		
			
			for(int i=0; i<upfile.length; i++) {
				ProductImages pi = new ProductImages();
				if(!upfile[i].getOriginalFilename().equals("")) {
					
					pi.setOriName(upfile[i].getOriginalFilename());
					String changeName = saveFile(upfile[i],session);
					pi.setSysName(changeName);
					pi.setPath("resources/uploadFiles/"+changeName);
					list.add(pi);
				}
			}
		
		System.out.println(list);
		
		int result =productService.insertProduct(p);
		if(result>0) {
			productService.insertProductImages(list);
		}
	
		return null;
		
	}
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000) +10000;
		System.out.println(originName);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime+ranNum+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}	
}
