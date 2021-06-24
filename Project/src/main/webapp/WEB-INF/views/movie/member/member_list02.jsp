<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<body>

	<div class="formBox" id="list">
		<h2>회원가입</h2>
		<ul id="memberList">
			<li>
				<a href="">
					<div class="img"><img src="fdsklfjds.png"></div>
					<div class="info">
						<h2>ID:fjkdjfs</h2>
						<p>Name:lkfjdkjlsfds</p>
					</div>
				</a>
			</li>
		</ul>
		<div class="btns">
			<a href="MemberJoinForm.do" id="join">회원가입</a>
		</div>
		<div>${msg }</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<script>
		$.ajax({
			url:"MemberList02.do",
			success:function(data){
				console.log(data.memberList);
				let memberList = data.memberList;
				$.each(memberList,function(i,item){
					//console.log(item);
					$("#memberList").append(`
						<li>
							<a href="">
								<div class="img"><img src="\${item.profileImg}"></div>
								<div class="info">
									<h2>ID:\${item.id}</h2>
									<p>Name:\${item.name}</p>
								</div>
							</a>
						</li>		
					`)
				});
				gsap.fromTo("#memberList li",{top:-1000},{top:50,duration:1,rotation:function(){
					return Math.random()*10-5
				},ease:"back",stagger:0.1});
			}
		})
		
	</script>
</body>
</html>




