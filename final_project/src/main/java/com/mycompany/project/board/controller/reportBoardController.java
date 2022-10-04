package com.mycompany.project.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.model.UploadVO;
import com.mycompany.project.board.model.reportBoardCriteria;
import com.mycompany.project.board.model.reportBoardDTO;
import com.mycompany.project.board.service.reportBoardService;






@Controller
public class reportBoardController {
	@Autowired
	reportBoardService boardService;
	
	
	@RequestMapping(value = "/reportBoardList", method = RequestMethod.GET)
	public String list(Model model, reportBoardCriteria cri) {
		model.addAttribute("boardList",boardService.listPaging(cri));
		int total = boardService.total();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
		System.out.println(pageMake.toString());
		return "/reportBoardList";
	}
		
	@RequestMapping(value = "/reportBoardInsert", method = RequestMethod.GET)
	public String insert() {
		
		return "/reportBoardInsert";
	}
	@RequestMapping(value = "/reportBoardInsert", method = RequestMethod.POST)
	public ModelAndView insert(reportBoardDTO dto,UploadVO vo,@RequestParam MultipartFile file) {
		
		
	
		ModelAndView mv = new ModelAndView();
		
		MultipartFile uploadFile = vo.getFile();
		if(!uploadFile.isEmpty()) {
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "/Users/kim/Desktop/springImage/";
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜덤 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();

		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];

		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo.setName(uniqueName+fileExtension);
		vo.setFile_url(uploadFolder+"\\" + uniqueName + fileExtension );
		
		boardService.insert(dto,vo);
	
		
		mv.setViewName("redirect:/reportBoardList");

		return mv;
		}
		boardService.insert(dto,vo);
	
		
		mv.setViewName("redirect:/reportBoardList");

		return mv;
	}
	
    @RequestMapping(value = "fileDownload.do")
    public void fileDownload4(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("저장경로");
        
        String filename =request.getParameter("fileName");
        String realFilename="";
        System.out.println(filename);
         
        try {
            String browser = request.getHeader("User-Agent"); 
            //파일 인코딩 
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
                        "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        realFilename = "/Users/kim/Desktop/springImage/\\" + filename;
        System.out.println(realFilename);
        File file1 = new File(realFilename);
        if (!file1.exists()) {
            return ;
        }
         
        // 파일명 지정        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
    }

	
	
	
	
	@RequestMapping(value="/reportBoardDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map, reportBoardDTO dto) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/reportBoardDetail");
		mv.addObject("data", boardService.detail(map));
		
		
		return mv;
	}
	
	@RequestMapping(value="/reportBoardUpdate", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> list = boardService.detail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);
		mv.setViewName("/reportBoardUpdate");
		
		return mv;
	}
	
//	@RequestMapping(value="/reportBoardUpdate", method = RequestMethod.POST)
//	public ModelAndView update(reportBoardDTO dto) {
//		
//		
//		ModelAndView mv = new ModelAndView();
//		int free_board_id = boardService.update(dto);
//		mv.setViewName("redirect:/reportBoardList");
//		
//		return mv;
//	

	@RequestMapping(value="/reportBoardUpdate", method = RequestMethod.POST)
	public ModelAndView update(reportBoardDTO dto,UploadVO vo, @RequestParam MultipartFile file) throws Exception {
		
		      ModelAndView mv = new ModelAndView();
		      //int free_board_id = boardService.update(dto);
		      // 파일 업로드 처리
		            String file_name = null;

				
		            MultipartFile uploadFile = vo.getFile();
		        
		            if (!uploadFile.isEmpty()) {
		            	  
		               String originalFileName = uploadFile.getOriginalFilename();
		               String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
		               long size = file.getSize(); //파일 사이즈

		               String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
		               String uploadFolder = "/Users/kim/Desktop/springImage/";
		               
		               UUID uuid = UUID.randomUUID(); // UUID 구하기
		               String[] uuids = uuid.toString().split("-");
		               String uniqueName = uuids[0];

		               file_name = uuid + "." + ext;
		               uploadFile.transferTo(new File(uploadFolder +"\\"+ uniqueName+ fileExtension ));
		            
		               vo.setName(uniqueName+fileExtension);

		               vo.setFile_url(uploadFolder+"\\"+ uniqueName + fileExtension);
		             
		 		      boardService.update(dto,vo);
				      mv.setViewName("redirect:/reportBoardList");
				      
				      return mv;
		            
		            } else {
		               boardService.content_update(dto);
		               mv.setViewName("redirect:/reportBoardList");
		               
		               return mv;
		            }
		               

		 
		
		
	}	

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("rboard_id") int rboard_id) {
		
		String url = boardService.getUrl(rboard_id);
		
		try {
			String path = url;
			File file = new File(path);
			
			if(file.delete()) {
				System.out.println("파일삭제");
			}else {
				System.out.println("파일삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		boardService.delete(rboard_id);
		
		return "redirect:/reportBoardList";
	}
	@RequestMapping(value = "/UpdateDeleteFile", method = RequestMethod.GET)
	public String UpdateDeleteFile(@RequestParam("rboard_id") int rboard_id) {
		String fileName = boardService.getFileName(rboard_id);
		String url = boardService.getUrl(rboard_id);
		
		boardService.columnDel(rboard_id);
		try {
			String path = url;
			File file = new File(path);
			
			if(file.delete()) {
				System.out.println("파일삭제");
			}else {
				System.out.println("파일삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return "redirect:/reportBoardUpdate";
	}

}


