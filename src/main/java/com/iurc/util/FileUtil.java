package com.iurc.util;

import java.io.File;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iurc.entity.UploadFile;
/*
 * 文件工具
 * 上传
 * 下载
 * 删除
 * */
public class FileUtil extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	/*
	 * 上传文件
	 * */
	public static UploadFile upload(String uploadPath,  @RequestParam(value="file",required=false)MultipartFile file,
    		HttpServletRequest request){
		String localPath = "F:"+"\\"+"GraduationProject"+"\\"+"MyEclipse10"+"\\"+"iurc1.1"+"\\"+"WebRoot"+"\\"+"upload"+"\\"+uploadPath;
		String path = request.getSession().getServletContext().getRealPath("/")+"upload"+"\\"+uploadPath; //(服务器上)文件存储位置
	    String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() 
        		+ request.getContextPath() +"/upload/"+uploadPath+ "/";//访问图片路径
	    String fileName=file.getOriginalFilename();//获取文件名加后缀
	    String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
	    fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名
	    File file1 =new File(path);
	    File file2 =new File(localPath);
	  //如果文件夹不存在则创建    
        if(!file1 .exists()  && !file1 .isDirectory()){       
            file1 .mkdir();  
        }
        if(!file2 .exists()  && !file2 .isDirectory()){       
            file2 .mkdir();  
        }
		UploadFile uf= new UploadFile();
        try {
	    	file.transferTo(new File(file1, fileName));//上传到服务器指定位置
	    	file.transferTo(new File(file2, fileName));//上传到当地路径指定位置
	    	uf.setAccessPath(returnUrl);
	    	uf.setFileName(fileName);
	    	
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uf;
	}
	
	/*
	 * 删除文件
	 * */
	public static Integer deleteFile(String uploadPath, String oldImg,
    		HttpServletRequest request){
		
		String localPath = "F:"+"\\"+"GraduationProject"+"\\"+"MyEclipse10"+"\\"+"iurc1.1"
							+"\\"+"WebRoot"+"\\"+"upload"+"\\"+uploadPath;//本地目录
		//获取文件名称（包含后缀名）
		String fileName = oldImg.substring(oldImg.lastIndexOf("\\"), oldImg.length());//文件名+后缀
	//	String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
		//判断指定目录下是否存在对应的文件，存在则删除
		delete(localPath,fileName);
		return 0;
	}
	
	
	/*
	 * 删除指定目录下的指定文件
	 * */
	public static int delete(String strPath,String fileName) {
		File file=new File(strPath+fileName);
		System.out.println(file.exists());
		if(!file.exists()){
			System.out.println("获取序列文件出错，请检查！");
		}
		else{
			System.out.println("没有问题");
		}
	    
	  return 0;
	  }

}
