 package com.webflex.vo;


/*create table movie_main(
movie_id int primary key,
movie_title varchar2(200) not null,
movie_sub_title varchar2(200),
movie_poster varchar2(1000) not null, 
movie_category varchar2(100) not null,
movie_content varchar2(4000) not null,
movie_rating varchar2(100) not null,
movie_like varchar2(1),
movie_card_back varchar2(1000) not null,
movie_card_video varchar2(1000) not null,
movie_actor varchar2(500),
inputdate date
);*/


public class MainVO {

	private int movieId;
	private String movieTitle;
	private String movieSubTitle;
	private String moviePosterPath;
	private String movieCategory;
	private String movieContent;
	private String movieRating;
	private String movieLike;
	private String movieCardBackPath;
	private String movieCardVideoPath;
	private String movieActor;
	private String inputDate;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieSubTitle() {
		return movieSubTitle;
	}
	public void setMovieSubTitle(String movieSubTitle) {
		this.movieSubTitle = movieSubTitle;
	}
	public String getMoviePosterPath() {
		return moviePosterPath;
	}
	public void setMoviePosterPath(String moviePosterPath) {
		this.moviePosterPath = moviePosterPath;
	}
	public String getMovieCategory() {
		return movieCategory;
	}
	public void setMovieCategory(String movieCategory) {
		this.movieCategory = movieCategory;
	}
	public String getMovieContent() {
		return movieContent;
	}
	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
	public String getMovieLike() {
		return movieLike;
	}
	public void setMovieLike(String movieLike) {
		this.movieLike = movieLike;
	}
	public String getMovieCardBackPath() {
		return movieCardBackPath;
	}
	public void setMovieCardBackPath(String movieCardBackPath) {
		this.movieCardBackPath = movieCardBackPath;
	}
	public String getMovieCardVideoPath() {
		return movieCardVideoPath;
	}
	public void setMovieCardVideoPath(String movieCardVideoPath) {
		this.movieCardVideoPath = movieCardVideoPath;
	}
	public String getMovieActor() {
		return movieActor;
	}
	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	
	@Override
	public String toString() {
		return "MainVO [movieId=" + movieId + ", movieTitle=" + movieTitle + ", movieSubTitle=" + movieSubTitle
				+ ", moviePosterPath=" + moviePosterPath + ", movieCategory=" + movieCategory + ", movieContent="
				+ movieContent + ", movieRating=" + movieRating + ", movieLike=" + movieLike + ", movieCardBackPath="
				+ movieCardBackPath + ", movieCardVideoPath=" + movieCardVideoPath + ", movieActor=" + movieActor
				+ ", inputDate=" + inputDate + "]";
	}
	

	
	

	
	
	
	
}
