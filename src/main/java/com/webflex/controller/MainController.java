package com.webflex.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webflex.service.MainService;
import com.webflex.service.WebflexUserService;
import com.webflex.vo.CommentVO;
import com.webflex.vo.MainVO;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired WebflexUserService wfUserService;

	@RequestMapping("")
	public String index() {
		return "index";
	}

//------------------------------------------------------------------------------------------------------------------------------------------------------

	// 메인페이지
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request, HttpSession session) {

		// 카테고리별 슬라이드
		List<MainVO> actionList = mainService.searchMovieCategory("액션");
		List<MainVO> comedyList = mainService.searchMovieCategory("코메디");
		List<MainVO> dramaList = mainService.searchMovieCategory("드라마");
		List<MainVO> romanceList = mainService.searchMovieCategory("로맨스");
		List<MainVO> animationList = mainService.searchMovieCategory("애니메이션");
		List<MainVO> fantasyList = mainService.searchMovieCategory("판타지");
		List<MainVO> musicList = mainService.searchMovieCategory("음악");
		List<MainVO> SFList = mainService.searchMovieCategory("SF");
		List<MainVO> thrillerList = mainService.searchMovieCategory("스릴러");

		String email = (String)session.getAttribute("id");
		String userCategory = this.wfUserService.getCategory(email);
	
		if(userCategory != null) {
			List<MainVO> main = new ArrayList<MainVO>();
			StringTokenizer st = new StringTokenizer(userCategory,",");
			while(st.hasMoreElements()) {
				main.addAll(this.mainService.getCategoryMovie(st.nextToken()));
			}
			model.addAttribute("category", main);
			System.out.println(main.get(0).getMovieCardVideoPath());
			System.out.println(main.get(1).getMovieCardVideoPath());
			System.out.println(main.get(2).getMovieCardVideoPath());
		}
		
		model.addAttribute("action", actionList);
		model.addAttribute("comedy", comedyList);
		model.addAttribute("drama", dramaList);
		model.addAttribute("SF", SFList);
		model.addAttribute("thriller", thrillerList);
		model.addAttribute("animation", animationList);
		model.addAttribute("fantasy", fantasyList);
		model.addAttribute("music", musicList);
		model.addAttribute("romance", romanceList);

		
		
		

		return "./webflex/webflexmain";
	}

	// 최신 컨텐츠 페이지
	@RequestMapping("/newContent")
	public String newContent(Model model/* , HttpServletRequest request */) {

		// 최신컨텐츠 이번달
		List<MainVO> newContentMonth = mainService.newContentMonth();
		// 최신컨텐츠 일
		List<MainVO> newContentDay = mainService.newContentDay();

		// 사용자가 관심있어하는 최신 컨텐츠 이번달
		List<MainVO> newUserLike = new ArrayList<MainVO>();
		List<MainVO> divList = new ArrayList<MainVO>();

		/*
		 * String category = request.getParameter("category");
		 * 
		 * 
		 * String[] divcategory = category.split(",");
		 * 
		 * if(divcategory[0] != null) { String divcate = divcategory[0]; divList =
		 * mainService.searchMovieCategoryMonth(divcate); if(divList != null) {
		 * 
		 * newUserLike.addAll(divList); } } else if(divcategory[1] != null) { String
		 * divcate = divcategory[1]; divList =
		 * mainService.searchMovieCategoryMonth(divcate); if(divList != null) {
		 * newUserLike.addAll(divList); } } else if(divcategory[2] !=null) { String
		 * divcate = divcategory[2]; divList =
		 * mainService.searchMovieCategoryMonth(divcate); if(divList != null) {
		 * newUserLike.addAll(divList); } }
		 */

		// 스트레스를 날리세요.
		List<MainVO> powerMovie = new ArrayList<MainVO>();
		powerMovie.addAll(mainService.searchMovieCategoryMonth("액션"));
		powerMovie.addAll(mainService.searchMovieCategoryMonth("스릴러"));
		powerMovie.addAll(mainService.searchMovieCategoryMonth("SF"));
		// 잠깐의 휴식
		List<MainVO> restMovie = new ArrayList<MainVO>();
		restMovie.addAll(mainService.searchMovieCategoryMonth("애니메이션"));
		restMovie.addAll(mainService.searchMovieCategoryMonth("판타지"));
		restMovie.addAll(mainService.searchMovieCategoryMonth("드라마"));
		// 사랑하는 사람과 함께
		List<MainVO> LoveMovie = new ArrayList<MainVO>();
		LoveMovie.addAll(mainService.searchMovieCategoryMonth("음악"));
		LoveMovie.addAll(mainService.searchMovieCategoryMonth("로맨"));
		LoveMovie.addAll(mainService.searchMovieCategoryMonth("코메디"));

		model.addAttribute("newContentCategory", newUserLike);
		model.addAttribute("newContentDay", newContentDay);
		model.addAttribute("newContentMonth", newContentMonth);
		model.addAttribute("powerMovie", powerMovie);
		model.addAttribute("restMovie", restMovie);
		model.addAttribute("loveMovie", LoveMovie);

		return "./webflex/newContent";
	}

	@RequestMapping("/info")
	public String info(@RequestParam("movieId") int movieId, Model model) {

		MainVO movieInfo = mainService.searchMovieId(movieId);
		model.addAttribute("movieInfo", movieInfo);
		String backPath = "";

		if (movieInfo.getMovieCardBackPath().contains("/")) {
			StringTokenizer back = new StringTokenizer(movieInfo.getMovieCardBackPath(), "/");
			while (back.hasMoreElements()) {
				back.nextToken();
				if (back.countTokens() == 1) {
					backPath = back.nextToken();
				}
			}
		} else {
			StringTokenizer back = new StringTokenizer(movieInfo.getMovieCardBackPath(), "\\");
			while (back.hasMoreElements()) {
				back.nextToken();
				if (back.countTokens() == 1) {
					backPath = back.nextToken();
				}
			}
		}
		System.out.println(backPath);
		model.addAttribute("backPath", backPath);
		// 커멘드 다받아옴.
		CommentVO movieComment = mainService.CommentAll(movieId);

		System.out.println(movieComment);

		model.addAttribute("Comment", movieComment);

		return "./webflex/m_info";
	}

	@RequestMapping("/searchView")
	public String search_info(String search, Model model) {
		List<String> relMovie = new ArrayList<>();
		// 영화검색
		List<MainVO> searchList = mainService.searchMovieFind(search);
		List<MainVO> searchList_rel = mainService.searchMovieFind(search.substring(0, search.length() - 1));

		for (int i = 0; i <= searchList_rel.size() - 1; i++) {
			if (searchList_rel.get(i).getMovieTitle() == null) {
				break;
			} else if (i >= 10) {
				break;
			}
			System.out.println("컨트롤러 : " + searchList_rel.get(i).getMovieTitle());
			relMovie.add(searchList_rel.get(i).getMovieTitle());
			System.out.println("List : " + searchList);
		}

		model.addAttribute("relMovie", relMovie);
		model.addAttribute("result", search);
		model.addAttribute("searchMovie", searchList);

		return "./webflex/searchView";

	}

	@RequestMapping("/VideoPage")
	public String VideoPage(@RequestParam("movieId") int movieId, Model model) {
		MainVO movieInfo = mainService.searchMovieId(movieId);
		model.addAttribute("movieInfo", movieInfo);

		return "./webflex/VideoPage";
	}

}
