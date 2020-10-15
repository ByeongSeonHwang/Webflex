--공지사항
create table wf_notice(
 notice_no number(38) primary key, -- 번호
 notice_title varchar2(100) not null, --제목
 notice_writer varchar2(50) not null, --작성자
 notice_cont varchar2(4000) not null, -- 내용
 notice_hit number(38) default 0, -- 조회
 notice_date date --날짜
);

insert into WF_NOTICE (notice_no, notice_title, notice_writer, notice_cont, notice_date)
values (notice_no_seq.nextval,'웹플, 크롬캐스트 기능 지원!','관리자','오래 기다리셨죠? 알아요...<br>
드디어 WEBFLEX에 크롬캐스트 기능이 추가되었어요!<br><br>
WEBFLEX에 매주 업데이트 되는 좋은 영화, 드라마들을 이제 크롬캐스트로 TV에서도 마음껏 감상해 보세요 :)<br>
(크롬캐스트는 TV의 HDMI 포트에 연결해 사용하는 장치로, 크롬캐스트에 대한 자세한 내용은 이곳을 눌러 확인해보세요. Google Cast 기능이 있는 Android TV 기기들에서도 사용할 수 있어요.)<br><br>
크롬캐스트를 이용하기 위해선 WEBFLEX를 최신 버전으로 업데이트하셔야 해요. <br>
아래 버튼을 눌러 스토어로 들어간 다음, "업데이트" 버튼이 상단에 있다면 업데이트 해주세요.<br><br>
[업데이트하러 가기]<br><br>이제, 큰 화면에서 더욱 풍부하게 즐기세요.' ,sysdate);
insert into WF_NOTICE (notice_no, notice_title, notice_writer, notice_cont, notice_date)
values (notice_no_seq.nextval,,sysdate);

--공지사항 번호
create sequence notice_no_seq
start with 1
increment by 1
nocache;



