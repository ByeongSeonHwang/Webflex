package com.webflex.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.webflex.service.AdminService;
import com.webflex.service.MainService;
import com.webflex.vo.CommentUpdateVO;
import com.webflex.vo.MainVO;

@Controller
public class AdminMovieController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/movie_info")
	public String movie_info(HttpServletRequest request) {
		List<MainVO> list = this.mainService.allSearchMovie();
		request.setAttribute("movie", list);
		return "./admin/movie_info";
	}
	
	@RequestMapping("/movie_insert")
	public String movie_insert() {
		return "./admin/movie_insert";
	}
	
	@PostMapping("/uploadFormAction")
	//post로 접근하는 uploadFormAction매핑주소 처리
	public void uploadFormAction(MultipartFile[] uploadFiles) {
	/*
	스프링 API에서 MultipartFile 타입을 제공해서 업로드 되는 파일 데이터를 쉽게 처리.	
	다중 업로드 파일은 배열로 받는다. <input type="file" name="uploadFiles">
	네임 파라미터 이름을 매개변수명으로 지정해서 처리한다. 파라미터 이름과 매개변수명이 같아야 한다.
	 */
		String uploadFolder = "D:\\java_program\\Webflex\\Webflex\\src\\main\\webapp\\resources\\images";//업로드 서버 경로
		String upload = "\\resources\\images";
		for(MultipartFile file : uploadFiles) {
			System.out.println("------------------------------");
			System.out.println("Upload file name : "+file.getOriginalFilename());
			//getOriginalFilename()메서드는 업로드된 파일의 원본 파일명을 반환함.
			System.out.println("Upload file size : "+file.getSize());
			System.out.println(uploadFolder+"\\"+file.getOriginalFilename());
			//getSize()메서드는 업로드된 파일의 크기를 반환함.
			File saveFile = new File(uploadFolder,file.getOriginalFilename());
			//파일과 폴더를 다루는 File클래스 생성자 인자값으로 업로드 서버 경로와 첨부된 원본 파일명을가지고 File클래스 객체 생성
			
			try {
				file.transferTo(saveFile);//업로드 된 원본 파일명으로 c드라이브 upload폴더에 업로드
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//uploadFormAction()
	
	
	
	@PostMapping("/movieInsert")
	public String movieInsert(MultipartFile[] uploadFiles, MainVO main,
			@RequestParam("movieTitle") String title, @RequestParam("movieSubTitle") String sub,
			@RequestParam("movieCategory") String category, @RequestParam("movieRating") String rating,
			@RequestParam("movieActor") String actor,@RequestParam("movieContent") String con) {
				
//		private int movieId;
//		private String movieTitle;
//		private String movieSubTitle;
//		private String moviePosterPath;
//		private String movieCategory;
//		private String movieContent;
//		private String movieRating;
//		private String movieLike;
//		private String movieCardBackPath;
//		private String movieCardVideoPath;
//		private String movieActor;
//		private String inputDate;
		/*
		스프링 API에서 MultipartFile 타입을 제공해서 업로드 되는 파일 데이터를 쉽게 처리.	
		다중 업로드 파일은 배열로 받는다. <input type="file" name="uploadFiles">
		네임 파라미터 이름을 매개변수명으로 지정해서 처리한다. 파라미터 이름과 매개변수명이 같아야 한다.
		 */
			String uploadMain = "D:\\java_program\\Webflex\\Webflex\\src\\main\\webapp\\resources\\images\\mainPoster";//업로드 서버 경로
			String uploadCard = "D:\\java_program\\Webflex\\Webflex\\src\\main\\webapp\\resources\\images\\subPoster";//업로드 서버 경로
			String uploadVideo = "D:\\java_program\\Webflex\\Webflex\\src\\main\\webapp\\resources\\images\\movie_trailer";//업로드 서버 경로
			
			String moviePosterPath = "\\resources\\images\\mainPoster";
			String movieCardBackPath = "\\resources\\images\\subPoster";
			String movieCardVideoPath = "\\resources\\images\\movie_trailer";
			
			int i = 0;
			
			for(MultipartFile file : uploadFiles) {
				if(i == 0) {
					System.out.println("------------------------------");
					System.out.println("Upload file name : "+file.getOriginalFilename());
					System.out.println("Upload file size : "+file.getSize());
					moviePosterPath = moviePosterPath+"\\"+file.getOriginalFilename();
					System.out.println(moviePosterPath);
					File saveFile = new File(uploadMain,file.getOriginalFilename());
					try {
						file.transferTo(saveFile);//업로드 된 원본 파일명으로 c드라이브 upload폴더에 업로드
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else if(i == 1) {
					System.out.println("------------------------------");
					System.out.println("Upload file name : "+file.getOriginalFilename());
					System.out.println("Upload file size : "+file.getSize());
					movieCardBackPath = movieCardBackPath+"\\"+file.getOriginalFilename();
					System.out.println(movieCardBackPath);
					File saveFile = new File(uploadCard,file.getOriginalFilename());
					try {
						file.transferTo(saveFile);//업로드 된 원본 파일명으로 c드라이브 upload폴더에 업로드
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else {
					System.out.println("------------------------------");
					System.out.println("Upload file name : "+file.getOriginalFilename());
					System.out.println("Upload file size : "+file.getSize());
					movieCardVideoPath = movieCardVideoPath+"\\"+file.getOriginalFilename();
					System.out.println(movieCardVideoPath);
					File saveFile = new File(uploadVideo,file.getOriginalFilename());
					try {
						file.transferTo(saveFile);//업로드 된 원본 파일명으로 c드라이브 upload폴더에 업로드
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				i++;
			}
			System.out.println(actor);
			System.out.println(category);
			System.out.println(con);
			System.out.println(rating);
			System.out.println(title);
			System.out.println(sub);
			
			main.setMoviePosterPath(moviePosterPath);
			main.setMovieCardBackPath(movieCardBackPath);
			main.setMovieCardVideoPath(movieCardVideoPath);
			main.setMovieActor(actor);
			main.setMovieCategory(category);
			main.setMovieContent(con);
			main.setMovieRating(rating);
			main.setMovieTitle(title);
			main.setMovieSubTitle(sub);
			
			this.mainService.addMovie(main);
			return "redirect:/movie_info";
		}//uploadFormAction()
	
	@RequestMapping("/movie_comment")
	public String movie_comment() {

		return "./admin/movie_comment";
	}
	@RequestMapping("/movie_comment_ok")
	public String movie_comment(String movie_title,String name,String movie_comment) {
		
		CommentUpdateVO vo = new CommentUpdateVO();
		
		System.out.println("여기까지 기동1");
		System.out.println(movie_title);
		int movieId = service.chageMovie_title(movie_title);
		
		System.out.println(movie_title); 
		vo.setMovie_id(movieId);
		vo.setMovie_comment(movie_comment); 
		vo.setName(name); 
		System.out.println(vo);
		System.out.println("여기까지 기동2"); 
		service.commentUpdate(vo);
		System.out.println("여기까지 기동3");
		
		return "./admin/movie_comment";
	}
	
	@ResponseBody
	@RequestMapping("/movie_del")
	public ResponseEntity<String> movie_del(@RequestParam("movie_id") int movieId){
		ResponseEntity<String> entity = null;
		
		try {
			this.mainService.delMovie(movieId);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping("/admin_movie_search")
	public ModelAndView notice_search(@RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView();
		List<MainVO> movie = this.mainService.search(search.trim());
		mv.addObject("movie", movie);
		mv.setViewName("./admin/movie_info");
		return mv;
	}

}
