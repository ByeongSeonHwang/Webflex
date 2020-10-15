package com.webflex.dao;

import java.util.Collection;
import java.util.List;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.CommentVO;
import com.webflex.vo.MainVO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void addMovie(MainVO main) {
		this.sqlsession.insert("addMovie",main);
		System.out.println(main.toString());
		
	}

	@Override
	public MainVO searchMovieId(int movieId) {
		
		return this.sqlsession.selectOne("searchMovieId", movieId);
	}

	@Override
	public List<MainVO> searchMovieCategory(String movieInfo) {
		
		return this.sqlsession.selectList("searchMovieCategory", movieInfo);
	}

	@Override
	public List<MainVO> allSearchMovie() {
		
		
		return this.sqlsession.selectList("allSearchMovie");
	}

	@Override
	public void delMovie(int movieId) {
		this.sqlsession.delete("delMovie",movieId);

	}

	@Override
	public void modifyMovie(MainVO vo) {
		this.sqlsession.update("updateMovie",vo);
		
	}
	
	@Override
	public List<MainVO> searchMovieFind(String search) {
		
		return this.sqlsession.selectList("searchMovieFind",search);
	}

	@Override
	public List<MainVO> newContentMonth() {
		
		return this.sqlsession.selectList("newContentMonth");
	}

	@Override
	public List<MainVO> newContentDay() {
		return this.sqlsession.selectList("newContentDay");
	}

	

	@Override
	public List<MainVO> searchMovieCategoryMonth(String divcate) {
		
		return this.sqlsession.selectList("searchMovieCategoryMonth", divcate);
	}

	@Override
	public CommentVO CommentAll(int movieId) {
		return this.sqlsession.selectOne("CommentAll",movieId);
	}

	@Override
	public List<MainVO> search(String search) {
		return this.sqlsession.selectList("movie_info_search", search);
	}

	@Override
	public Collection<? extends MainVO> getCategoryMovie(String nextToken) {
		return this.sqlsession.selectList("get_category_movie",nextToken);
	}

}
