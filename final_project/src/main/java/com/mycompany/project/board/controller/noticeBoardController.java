package com.mycompany.project.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.project.board.model.Criteria;
import com.mycompany.project.board.model.noticeBoardDTO;
import com.mycompany.project.board.model.PageMakerDTO;
import com.mycompany.project.board.service.noticeBoardService;


@RequestMapping("/board")
@Controller
public class noticeBoardController {
	
	@Autowired
	noticeBoardService boardService;
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) {
		model.addAttribute("boardList",boardService.listPaging(cri));
		int total = boardService.total();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
		
		return "noticeBoard/noticeList";
	}
		
	@RequestMapping(value = "/merge/noticeInsert", method = RequestMethod.GET)
	public String insert(Authentication auth, Model model) {
		
		String user_id = auth.getName();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		model.addAttribute("data",map);
		
		return "noticeBoard/noticeInsert";
	}
	@RequestMapping(value = "/merge/noticeInsert", method = RequestMethod.POST)
	public ModelAndView insert(noticeBoardDTO dto,@RequestParam MultipartFile file, Authentication auth ) throws Exception{	
		ModelAndView mv = new ModelAndView();
		
		// ���� ���ε� ó��
		String file_name = null;
		MultipartFile uploadFile = dto.getFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // Ȯ���� ���ϱ�
			long size = file.getSize(); //���� ������
			System.out.println("���ϸ� : "  + originalFileName);
			System.out.println("�뷮ũ��(byte) : " + size);
			String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
			String uploadFolder = "C:\\Users\\Public\\Downloads\\";
			
			UUID uuid = UUID.randomUUID(); // UUID ���ϱ�
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("������ �������ڿ�" + uniqueName);
			System.out.println("Ȯ���ڸ�" + fileExtension);
			file_name = uuid + "." + ext;
			uploadFile.transferTo(new File(uploadFolder +"\\"+ uniqueName+ fileExtension ));
		
			dto.setFile_name(uniqueName+fileExtension);
			dto.setFile_url(uploadFolder+"\\"+ uniqueName + fileExtension);

		}
		
		boardService.insert(dto);
	
		mv.setViewName("redirect:/board/noticeList");

		return mv;

	}
	
	@RequestMapping(value="/noticeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map, noticeBoardDTO dto) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("noticeBoard/noticeDetail");
		mv.addObject("data", boardService.detail(map));
		
		return mv;
	}
	
	@RequestMapping(value="/merge/noticeUpdate", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map, noticeBoardDTO dto) {
		
		Map<String, Object> list = boardService.detail(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);		
		mv.setViewName("noticeBoard/noticeUpdate");
		System.out.println(map+"///"+dto);
		
		return mv;
	}
	
	@RequestMapping(value="/merge/noticeUpdate", method = RequestMethod.POST)
	public ModelAndView update(noticeBoardDTO dto,@RequestParam MultipartFile file) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		//int free_board_id = boardService.update(dto);
		// ���� ���ε� ó��
				String file_name = null;
				MultipartFile uploadFile = dto.getFile();
				if (!uploadFile.isEmpty()) {
					String originalFileName = uploadFile.getOriginalFilename();
					String ext = FilenameUtils.getExtension(originalFileName); // Ȯ���� ���ϱ�
					long size = file.getSize(); //���� ������
					System.out.println("���ϸ� : "  + originalFileName);
					System.out.println("�뷮ũ��(byte) : " + size);
					String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
					String uploadFolder = "C:\\Users\\Public\\Downloads\\";
					
					UUID uuid = UUID.randomUUID(); // UUID ���ϱ�
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];
					System.out.println("������ �������ڿ�" + uniqueName);
					System.out.println("Ȯ���ڸ�" + fileExtension);
					file_name = uuid + "." + ext;
					uploadFile.transferTo(new File(uploadFolder +"\\"+ uniqueName+ fileExtension ));
				
					dto.setFile_name(uniqueName+fileExtension);
					dto.setFile_url(uploadFolder+"\\"+ uniqueName + fileExtension);
				} else {
					boardService.content_update(dto);
					mv.setViewName("redirect:/board/noticeList");
					System.out.println(dto);
					return mv;
				}
					
				
			
		boardService.update(dto);
		mv.setViewName("redirect:/board/noticeList");
		System.out.println("contorller check");
		return mv;
	}
	@RequestMapping(value = "/merge/noticedelete", method = RequestMethod.GET)
	public String delete(@RequestParam("nboard_id") int nboard_id ) {
		
		String url = boardService.getUrl(nboard_id);
		
		try {
			String path = url;
			File file = new File(path);
			
			if(file.delete()) {
				System.out.println("���ϻ���");
			}else {
				System.out.println("���ϻ��� ����");
			}
		} catch (Exception e) {

		}

		
		boardService.delete(nboard_id);
		
		return "redirect:/board/noticeList";
	}
	
	@RequestMapping(value = "/merge/DeleteAttachFile", method = RequestMethod.GET)
	public String DeleteAttachFile(@RequestParam("nboard_id") int nboard_id ) {
		String fileName = boardService.getFile_Name(nboard_id);
		String url = boardService.getUrl(nboard_id);
		
		boardService.AttachColumnDel(nboard_id);
		try {
			String path = url;
			File file = new File(path);
			
			if(file.delete()) {
				System.out.println("���ϻ���");
			}else {
				System.out.println("���ϻ��� ����");
			}
		} catch (Exception e) {

		}
		return "redirect:/board/merge/noticeUpdate";
	}
	
	 @RequestMapping(value = "/merge/noticeBoardFileDownload.do")
	    public void fileDownload4(HttpServletRequest request,HttpServletResponse response) throws Exception {
	        //String path =  request.getSession().getServletContext().getRealPath("C:\\Users\\Public\\Downloads");
	        
	        String filename =request.getParameter("fileName");
	        String realFilename="";
	        System.out.println(filename);
	         
	        try {
	            String browser = request.getHeader("User-Agent"); 
	            //���� ���ڵ� 
	            if (browser.contains("MSIE") || browser.contains("Trident")
	                    || browser.contains("Chrome")) {
	                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
	            } else {
	                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	            }
	        } catch (UnsupportedEncodingException ex) {
	            System.out.println("UnsupportedEncodingException");
	        }
	        realFilename = "C:\\Users\\Public\\Downloads\\" + filename;
	        System.out.println(realFilename);
	        File file1 = new File(realFilename);
	        if (!file1.exists()) {
	            return ;
	        }
	         
	        // ���ϸ� ����        
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
	
}


