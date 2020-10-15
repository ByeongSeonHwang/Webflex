package com.webflex.dao;

import java.util.Collection;
import java.util.List;

import com.webflex.vo.CommentVO;
import com.webflex.vo.MainVO;

public interface MainDAO {

public void addMovie(MainVO vo);
	
	public MainVO searchMovieId(int movieId);
	
	public List<MainVO> searchMovieCategory(String movieInfo);
	
	public List<MainVO> allSearchMovie();
	
	public void delMovie(int movieId);
	
	public void modifyMovie(MainVO vo);

	public List<MainVO> searchMovieFind(String search);

	public List<MainVO> newContentMonth();

	public List<MainVO> newContentDay();

	public List<MainVO> searchMovieCategoryMonth(String divcate);

	public CommentVO CommentAll(int movieId);

	public List<MainVO> search(String search);

	public Collection<? extends MainVO> getCategoryMovie(String nextToken);
}
