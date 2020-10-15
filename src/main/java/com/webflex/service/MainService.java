package com.webflex.service;

import java.util.Collection;
import java.util.List;

import com.webflex.vo.CommentVO;
import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.MainVO;

public interface MainService {

	//영화정보 입력
	public void addMovie(MainVO main);
	//영화고유 ID로 찾기
	public MainVO searchMovieId(int movieId);
	//영화 카테고리별로찾기
	public List<MainVO> searchMovieCategory(String movieInfo);
	//영화 전체 목록검색
	public List<MainVO> allSearchMovie();
	//영화 정보 삭제
	public void delMovie(int movieId);
	//영화 정보 수정
	public void modifyMovie(MainVO vo);
	//검색어로 영화 검색
	public List<MainVO> searchMovieFind(String search);
	public List<MainVO> newContentMonth();
	public List<MainVO> newContentDay();
	public List<MainVO> searchMovieCategoryMonth(String divcate);
	public CommentVO CommentAll(int movieId);
	public List<MainVO> search(String trim);
	public Collection<? extends MainVO> getCategoryMovie(String nextToken);

}
