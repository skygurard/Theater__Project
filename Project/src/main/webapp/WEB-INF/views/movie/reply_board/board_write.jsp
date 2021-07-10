<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ include file="../include/header.jsp" %>
<body>
	<div class="formBox">
		<h2>익명 리뷰게시판</h2>
		<form action="BoardWrite.do" id="joinForm" method="POST">
			<table>
				<colgroup>
					<col style="width: 150px">
					<col style="width: 850px">
				</colgroup>
				<tbody>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="name" id="userName" value=""></td>
					</tr>
					<tr>
						<th>한줄평</th>
						<td><input type="text" name="email" id="userEmail" value=""></td>
					</tr>
					<tr>
						<th>영화제목</th>
						<td><input type="text" name="subject" id="subject" value=""></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="userPassword"></td>
					</tr>
					<tr>
						<th>리뷰내용</th>
						<td><textarea name="contents" id="summernote"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<input type="submit" value="확인" id="join"> <input
					type="reset" value="취소" id="cancel">
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$("#summernote").summernote({
				height : 350,
				//섬머노트가 제공하는 메서드
				callbacks:{
					//이미지 파일을 코드화시켜서 db에 저장하면 텍스트 코드가 만들어 지는데 너무길어서
					//오류 발생하는 경우가 있다. 파일업로드 방식으로 변경
					onImageUpload:function(files,editor,welEditable){
						sendImgFile(files[0],this);
					}
				}
			});
			function sendImgFile(file,editor){
				//console.log("이미지 업로드 콜백이 일어났을때 실행되는 콜백함수입니다.")
				data = new FormData();
				data.append("file",file);
				//코로나 연동했을때.... JSON파일 또는 XML을 읽어서 처리한다. 비동기 통신.
				$.ajax({
					data:data,
					type:"POST",
					url:"SummerNoteImageUpload.do",
					cache:false,
					contentType:false,
					processData:false,
					dataType :"json",
					success:function(data){
						//console.log("summernote_image_upload.jsp로 파일 전송하고 파일 경로 JSON으로 돌려받기.");
						console.log(data);
						$(editor).summernote("editor.insertImage",data.url);
					},
				});
			}
		});
	</script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
<!-- spring mvc 에서 기본으로 깔고가는 json converter  jackson -->











