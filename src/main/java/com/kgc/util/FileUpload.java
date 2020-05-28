package com.kgc.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOExceptionWithCause;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	
	public static String fileUp(MultipartFile file, String filePath, String fileName){
		String extName="";//扩展名格式
		try {
			int index = file.getOriginalFilename().lastIndexOf(".");
			if(index>=0){
				System.out.println("扩展名赋值");
				extName = file.getOriginalFilename().substring(index);
				System.out.println(extName);
			}
			copyFile(file.getInputStream(),filePath,fileName+extName).replaceAll("-", "");
			//进行图片压缩,根据后缀判断是否为图片
			if(".jpg.jpeg.gif.png.bmp".indexOf(extName.toLowerCase())!=-1&&file.getSize()>=500*1024 ){
				//图片大于500k即进行压缩
				Thumbnails.of(filePath+"/"+fileName+extName).
				size(480, 480).outputQuality(0.8f).toFile(filePath+"/"+fileName+extName);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName+extName;
	}
	public static String copyFile(InputStream in,String dir,String realName) throws IOException {
		File file = new File(dir,realName);
		if(!file.exists()){
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			file.createNewFile();
		}
		FileUtils.copyInputStreamToFile(in, file);
		return realName;
	}
}
