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

import com.b66k.www.domain.QuestionImgVO;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@AllArgsConstructor
@Slf4j
@Component
public class qnaFileHandler {
   private final String UP_DIR = "D:\\_b66k\\fileUpload\\qnaImg";

   public List<QuestionImgVO> uploadFiles(MultipartFile[] files) {
      LocalDate date = LocalDate.now(); // 현재 날짜 구하기
      log.info(">>> date : " + date);
      String today = date.toString();
      
      today = today.replace("-", File.separator);

      File folders = new File(UP_DIR, today);

      if (!folders.exists()) {
         folders.mkdirs();
      }

      List<QuestionImgVO> flist = new ArrayList<QuestionImgVO>();
      for (MultipartFile file : files) {
         QuestionImgVO qivo = new QuestionImgVO();
         qivo.setSaveDir(today);
         qivo.setFileSize(file.getSize());
         
         String originalFileName = file.getOriginalFilename();
         String onlyFileName = originalFileName.substring(originalFileName.lastIndexOf(File.separator) + 1);
         log.info(">>>> onlyFileName : " + onlyFileName);
         qivo.setFileName(onlyFileName);

         UUID uuid = UUID.randomUUID();
         qivo.setUuid(uuid.toString());

         String fullfileName = uuid.toString() + "_" + onlyFileName;
         File storeFile = new File(folders, fullfileName);

         try {
            file.transferTo(storeFile);
            if (isImageFile(storeFile)) {
               
               qivo.setFileType(1);
               File thumbnail = new File(folders, uuid.toString() + "_th_" + onlyFileName);
               Thumbnails.of(storeFile).size(100, 100).toFile(thumbnail);
               ;
            }
         } catch (Exception e) {
            log.info(">>> file 생성 오류!");
            e.printStackTrace();
         }
         flist.add(qivo);
      }

      return flist;

   }

   private boolean isImageFile(File storeFile) throws IOException {
      String mimeType = new Tika().detect(storeFile);
      return mimeType.startsWith("image") ? true : false;
   }
}