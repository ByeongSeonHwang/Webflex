package com.webflex.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.MainDAO;
import com.webflex.vo.CommentVO;
import com.webflex.vo.MainVO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;
	
	@Override
	public void addMovie(MainVO main) {
		this.dao.addMovie(main);
	}

	@Override
	public MainVO searchMovieId(int movieId) {
		
		return dao.searchMovieId(movieId);
	}

	@Override
	public List<MainVO> searchMovieCategory(String movieInfo) {

		
		return dao.searchMovieCategory(movieInfo);
	}

	@Override
	public List<MainVO> allSearchMovie() {

		return dao.allSearchMovie();
	}

	@Override
	public void delMovie(int movieId) {
		this.dao.delMovie(movieId);
	}

	@Override
	public void modifyMovie(MainVO vo) {
		
	}

	@Override
	public List<MainVO> searchMovieFind(String search) {
		
		System.out.println("서비스 : "+search);
		
		return dao.searchMovieFind(search);
	}

	@Override
	public List<MainVO> newContentMonth() {
		
		return dao.newContentMonth();
	}

	@Override
	public List<MainVO> newContentDay() {
		
		return dao.newContentDay();
	}

	@Override
	public List<MainVO> searchMovieCategoryMonth(String divcate) {
		
		return dao.searchMovieCategoryMonth(divcate);
	}

	@Override
	public CommentVO CommentAll(int movieId) {
		// TODO Auto-generated method stub
		return dao.CommentAll(movieId);
	}

	@Override
	public List<MainVO> search(String search) {
		return this.dao.search(search);
	}

	@Override
	public Collection<? extends MainVO> getCategoryMovie(String nextToken) {
		return this.dao.getCategoryMovie(nextToken);
	}

	

}
