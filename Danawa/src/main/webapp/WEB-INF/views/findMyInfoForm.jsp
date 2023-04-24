<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="Keywords" content="가격비교사이트, 가격비교 싸이트, 가격 비교, 가격 검색, 최저가,추천,인터넷쇼핑,온라인쇼핑,쇼핑, 조립PC,피씨,컴퓨터,조립컴퓨터,부품,주변기기,PC세트,중고,호환, PC방, 조립견적, 용산, 용산전자상가, mp3,엠피쓰리,가전, 디카,디지털카메라,디지탈카메라,노트북,랩탑,핸드폰,휴대폰,게임,자동차,쇼핑포탈,쇼핑포털,공짜폰, 특가폰, 네비게이션,고진샤, 하이얼,미니오븐,서브노트북, 스카이,모토로라, 엑스박스,xbox, 애니콜,사이언,싸이언,삼성전자,엘지전자, lcd 모니터,무선 공유기,DSLR, 닌텐도DS,엑스노트,매직스테이션,divx,T-flash,microSD,김치냉장고,냉장고,네비게이션,노트북,디오스,딤채,만도,샤프,아이나비,아이리버,아이팟,에이원 ,위니아,지펠,청풍,캐논,니콘,쿠쿠,테팔,하우젠,휘센,가구,가스레인지,가스렌지,가스오븐렌지,공기청정기,그래픽카드,기저귀,분유,,듀오백,드럼세탁기,등산화,디지털카메라,디지털TV,PDP, LCD,디카,마우스,메인보드,면도기,모니터,믹서,스키복,보행기,복사기,복합기,분유,선풍기,세탁기,소파,스캐너,식기세척기,악기,에어컨,에어콘,엠피쓰리,오디오,오븐레인지,워크맨,이어폰, 유모차 사무용가구,인라인,인라인스케이트,자동차용품,자전거,전기밥솥,전동칫솔,전자레인지,전자사전,전화기,정수기,이온수기,비데,책상,청소기,침대,캠코더,커피메이커,팩스,프린터,플레이스테이션,플스,하드디스크,향수,홈씨어터,화장대,화장품,휴대폰,핸드폰,dmb,dvd플레이어,gps,hdd,PS" />
        <meta name="Description" content="다나와는 온라인 전제품에 대한 가격비교 사이트 입니다. 안전구매시스템(전자보증,Escrow)을 갖춘 쇼핑몰의 최저 가격 정보를 보여드리며,다양한 각도의 상품 사진,상세 설명,소비자 의견 등을 한곳에서 볼 수 있습니다. 즐거운 비교 쇼핑,다나와!" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
        
	<link rel="shortcut icon" href="//img.danawa.com/new/danawa_main/v1/img/danawa_favicon.ico" />
	<script type="text/javascript" src="/resources/js/util/envUtils.js?v=10"></script>
        <title>아이디 찾기 : 다나와 로그인</title>
        <link rel="stylesheet" type="text/css" href="//static.danawa.com/new/recss/common.css">
        <link rel="stylesheet" type="text/css" href="//static.danawa.com/new/recss/login.css">
        <link rel="shortcut icon" href="//img.danawa.com/new/danawa_main/v1/img/danawa_favicon.ico">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/resources/js/library/underscore-1.8.3.min.js"></script>
		<script type="text/javascript" src="/resources/js/util/logUtils.js"></script>
		<script type="text/javascript" src="/resources/js/application/model/search/searchId.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var memberSearchId = new DanawaMemberSearchId();
					memberSearchId.initialize();
			});
		</script>
    </head>
    <body class="body__login">
        
<!-- ipin -->
<form id="form_ipin" name="form_ipin" method="post">
	<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="m" value="pubmain">
	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="enc_data" value="AgEEQTUwNR84jvIM74X6IHBldyGDfJO1HOWkVIkakNMK3N0tzNggPyKWAba0tnUSgVYZJr7NtjwaWNuHOyvH4VyHs7zVi7lB1xIdibNAc4D7hxUuunihPi6b5DReHxdyyTmUgmgbHQe4vr+ZAPS9PHYuOzW1sb3z6UX9XQCDUwu4fDKyEUoDC/OdiL84b8S4grzeArnSN2u3ZUeJ3ivg3dtXSZ2ZfNpGVyDUhePT0B3iN7UpprBOvOmye+YfAm0J2KXT0gBn7Yd0rbN3QbDB+5+HyrTbOiU=">
</form>

<!-- checkPlus -->
<form id="form_chk" name="form_chk" method="post">
	<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="m" value="checkplusSerivce">
	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="EncodeData" value="AgAFRzMyNjTdNSKY7G8qKDYzEyqqihEQOcoCIbh4pNlrXbujh9VhgwVeKI6ZYj93atfZO9hFPt91/8/blJCoeXTlSPeGBJWd8ArlxTLlTxe8VhgCLCSg2lhcWggxDNWu7Ft/nAxlWC5SF/OC60WmWUa84EaLX68J8+lF/V0Ag1MLuHwyshFKA7Q89gQOo6HOKyi54aB2zblPenfhuVPaLoHACx1AKu9xdn6kcuPELTE+kCISjczaNhDIUDRiKdPTTqq9NpqrhDnWSYqc7htUcy8ZJNg9Aqj1tnS3wmb1jQRdYU20cWeI8D5NF9XrDI1MiihQWPMeDAymt/zLDKDbtzEq7Hz2u4oeMLinSFEDr2JhGEYWX2RlVMNVZcC6+jxLpLQpHIBCijdcfR2cuPXPgTEhhOkm8K/DkdMEAcvyNarSwAipVfoTpgpqlPoIHWpt5bhgWgxxKRM=">
</form>
<script type="text/javascript">


</script>
        <!-- 인증 후 전송되는 데이터 -->
       
        <!-- login_wrap -->
        <div id="wrap" class="login_wrap">
            <!-- header -->
            <div id="header" class="header__login header__login--search">
                <h1 class="logo"><a href="https://www.danawa.com" class="ico h_logo"><span class="blind">danawa</span></a></h1>
            </div>
            <!--// header -->
            <!-- container -->
            <div id="container" class="container content__login content__login--search">
                <!-- search__wrap -->
                <div class="search__wrap">
                    <!-- search__tab -->
                    <div class="search__tab" role="tablist">
                        <button type="button" class="search__tab-button search__tab-button--select" role="tab" aria-selected="true"
                                onclick="location.href='https://auth.danawa.com/searchId?url=https%3A%2F%2Fwww.danawa.com%2F%3Fsrc%3Dadwords%26kw%3DGA0000020%26gclid%3DEAIaIQobChMIhKKB963f_QIVxiMrCh3G3AlcEAAYASAAEgLC6_D_BwE';">
                            <h2>아이디 찾기</h2>
                        </button>
                        <button type="button" class="search__tab-button" role="tab" aria-selected="false"
                                onclick="location.href='https://auth.danawa.com/searchPwd?url=https%3A%2F%2Fwww.danawa.com%2F%3Fsrc%3Dadwords%26kw%3DGA0000020%26gclid%3DEAIaIQobChMIhKKB963f_QIVxiMrCh3G3AlcEAAYASAAEgLC6_D_BwE';">
                            <h2>비밀번호 찾기</h2>
                        </button>
                    </div>
                    <!--// search__tab -->
                    <div id="danawa-member-searchId-area-search">
                        <!-- notice-text -->
                        <div class="notice-text">
                            <p>다나와 아이디를 모르시나요?</p>
                            <p>등록된 인증 수단으로 아이디를 찾을 수 있습니다.</p>
                        </div>
                        <!--// notice-text -->
                        <h3 class="search__h3">내 정보에 등록된 핸드폰번호로  찾기</h3>
                        <!-- 오류 .search__form--error, 컨펌 메일 .search__form--confirm -->
                        <div class="search__form search__form--confirm" id="danawa-member-searchId-area-email">
                            <label for="danawa-member-searchId-member-authEmail" class="blind">이메일 주소 입력</label>
                            
                            <input type="text" id="danawa-member-searchId-member-authEmail" placeholder="핸드폰번호입력"/>
                            
                            <p class="search__notice" id="danawa-member-searchId-notion-email">이메일 형식을 확인해 주세요.</p>
                            <button type="button" class="search__button" id="danawa-member-searchId-authEmailform-submit">
                                <strong>확인</strong>
                            </button>
                        </div>
                     
                    </div>
                    
                    
                    <div class="search__send" id="danawa-member-searchId-area-result" style="display: none;">
                        <p>입력하신 이메일 <strong id="danawa-member-searchId-notion-sendEmail"></strong>로<br>
                            아이디가 발송되었습니다.</p>
                        <button class="search__button" onclick="location.href='https://auth.danawa.com/login?url=https%3A%2F%2Fwww.danawa.com%2F%3Fsrc%3Dadwords%26kw%3DGA0000020%26gclid%3DEAIaIQobChMIhKKB963f_QIVxiMrCh3G3AlcEAAYASAAEgLC6_D_BwE';">
                            <strong>로그인 하기</strong>
                        </button>
                    </div>
                </div>
                <!--// search__wrap -->
            </div>
            <!--// container -->
            <!-- footer -->
            <div id="footer" class="footer footer__login footer__login--search">
                <address>Copyright © <strong>connectwave</strong> Co., Ltd. All Rights Reserved.</address>
            </div>
            <!--// footer -->
        </div>
        <!--// login_wrap -->
        <script src="//static.danawa.com/globaljs/static/logger_Insight_WebAnalytics.js"></script>
    </body>
</html>