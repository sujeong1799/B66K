package com.b66k.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.b66k.www.domain.UserImgVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@AllArgsConstructor
@Slf4j
@Component
public class userImgHandler {
	private final String UP_DIR = "D:\\_b66k\\fileUpload\\userProfile";
	   
	   public List<UserImgVO> uploadFiles(MultipartFile[] files){
	      LocalDate date = LocalDate.now();
	      log.info(">>date : " + date);
	      String today = date.toString(); 
	      
	      today = today.replace("-", File.separator);
	      
	      
	      File folders = new File(UP_DIR, today);
	      
	      
	      if(!folders.exists()) {
	         folders.mkdirs(); 
	      }
	      
	      List<UserImgVO> flist = new ArrayList<UserImgVO>();
	      for(MultipartFile file : files) {
	    	  UserImgVO uivo = new UserImgVO();
	    	  uivo.setSaveDir(today); 
	    	  uivo.setFileSize(file.getSize()); 
	         
	         
	         String originalFileName = file.getOriginalFilename();
	         String onlyFileName = originalFileName.substring(
	               originalFileName.lastIndexOf(File.separator)+1);
	         
	         log.info(">> onlyFileName : "+onlyFileName); 
	         uivo.setFileName(onlyFileName);
	         
	         
	         UUID uuid = UUID.randomUUID();
	         uivo.setUuid(uuid.toString()); 
	         
	         
	         String fullfileName = uuid.toString()+"_"+onlyFileName;
	         File storeFile = new File(folders, fullfileName);
	         
	         try {
	            file.transferTo(storeFile); 
  
	         } catch (Exception e) {
	            log.info(">>> file 생성오류~");
	            e.printStackTrace();
	         }
	         
	         flist.add(uivo);
	      }
	      
	      return flist;
	      
	   }

	   
 private boolean isImageFile(File storeFile) throws IOException {
	         String mimeType = new Tika().detect(storeFile);
	         return mimeType.startsWith("image")? true : false;
	      }
	
}
