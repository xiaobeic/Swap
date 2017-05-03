/*登陆注册弹出框*/
$(function() {
	$("#my-login").click(function() {
		$('#login_a1').click();
	});
	$("#my-register").click(function() {
		$('#login_a2').click();
	});
});

/*
 * 右下角回到顶部
 */
$(function() {
	var speed = 800;
	$("#toTop").click(function() {
		$('html,body').animate({
			scrollTop : '0px'
		}, speed);
	});
});

function getTop() {
	if ($(document).scrollTop() > 600) {
		$("#getTop").css({
			'display' : 'block',
		});
	} else {
		$("#getTop").css('display', 'none');
	}
	setTimeout(getTop);
};



/* sellerCenter:点击收藏颜色转换 */
$(function() {
	
	var changeSys = function() {
		/*操作之前判断用户是否登入*/
		if($(".sessionText").attr('id')=="null"){
			window.location.href="../view/login.jsp";
		}
		var lurb = $(this);
		var shopId=$("#shopsColl_textA").attr('href');
		var Id=$(this).prev().attr('id');
		if ($(this).hasClass("shopman_span2")) {
			$.ajax({
				type : 'post',
				url : '../shopsCollection/AddshopsColl.do',
				data:'shopId='+Id,
				success : function(data) {
					//验证返回值是否为正整数
					var s =  /^[0-9]*[1-9][0-9]*$/;
					if (s.test(data)) {
						//操作成功改变对应的样式
						$(lurb).removeClass("shopman_span2");
						$(lurb).addClass("shopman_span3");
						$(lurb).prev().attr("id",data);
						$(lurb).children().html("取消收藏");
					}
				},
			});
		} else {
			$.ajax({
				type : 'post',
				url : '../shopsCollection/DeleteshopsColl.do',
				data: 'shopsCollId='+Id,
				success : function(data) {
					if (data == "delShopColSucc") {
						//操作成功改变对应的样式
						$(lurb).removeClass('shopman_span3');
						$(lurb).addClass("shopman_span2");
						$(lurb).prev().attr("id",shopId);
						$(lurb).children().html("收藏店铺");
					}
				},
			});
		}
	};
	$(".sellCen_click").each(function() {
		$(this).bind('click', changeSys);
	});
});

/**
 * 搜索框
 */
$(function() {
	$(".searchbodys p").not(":first").hide();
	$(".searchbox ul li").mouseover(function() {
		var index = $(this).index();
		if (index == 0) {
			$(this).find("a").addClass("style1");
			$(".searchbox ul li").eq(1).find("a").removeClass("style1");
			$("#searchGoods_input").val("");
		}
		if (index == 1) {
			$(this).find("a").addClass("style1");
			$(".searchbox ul li").eq(0).find("a").removeClass("style1");
			$("#searchShops_input").val("");
		}
		var index = $(this).index();
		$(".searchbodys p").eq(index).show().siblings('p').hide();
	});
});

/**
 * 我的回复div获得鼠标焦点按钮隐藏显示
 */
$(function() {
	$(".mymessage_div").each(function() {
		$(this).mouseenter(function() {
			$(this).children().last().addClass('message_info_div4');
		});
		$(this).mouseleave(function() {
			$(this).children().last().removeClass('message_info_div4');
		});
	});
});

// 系统通知
$(function() {
	var changeSys = function() {
		var posta = $(this).children('span:first-child').next().children('a');
		var postdiv = $(this).next('div');
		if (posta.hasClass('icon-chevron-down')) {
			posta.removeClass('icon-chevron-down');
			posta.addClass('icon-chevron-up');
			postdiv.removeClass('SysMess_info_div1');
			postdiv.addClass('SysMess_info_div2');
			postdiv.addClass('fadeInDown');
		} else {
			posta.removeClass('icon-chevron-up');
			posta.addClass('icon-chevron-down');
			postdiv.removeClass('SysMess_info_div2');
			postdiv.addClass('SysMess_info_div1');
			postdiv.addClass('fadeIn');
		}
	};
	$(".SysMess_info_div0").each(function() {
		$(this).bind('click', changeSys);
	});
});

/*
 * 个人中心头像上传
 */
$(window).load(function() {
	var options = {
		thumbBox : '.thumbBox',
		spinner : '.spinner',
		imgSrc : '../img/head.jpg'
	};
	var cropper = $('.imageBox').cropbox(options);
	$('#file').on('change', function() {
		var reader = new FileReader();
		reader.onload = function(e) {
			options.imgSrc = e.target.result;
			cropper = $('.imageBox').cropbox(options);
		};
		reader.readAsDataURL(this.files[0]);
		this.files = [];
	});
	$('#btnCrop').on('click', function() {
		var img = cropper.getDataURL();
		$('.cropped').empty();
		$('.cropped').append('<img src="' + img + '">');
	});
	$('#btnZoomIn').on('click', function() {
		cropper.zoomIn();
	});
	$('#btnZoomOut').on('click', function() {
		cropper.zoomOut();
	});
	$('#uploadHeadImg').on('click', function() {
		/**
		 * 头像上传
		 */
		$("#updateheadimg").submit();
	});
});

// 我的店铺-物品删除提示
$(function() {
	var delete_good = function() {
		// 获得超链接id
		var id = '#' + $(this).prev().attr("id");
		// 获得该物品的最高层div的id，以便删除
		var divId = '#shoop_info_' + $(this).prev().attr("id");
		$.confirm({
			icon : 'glyphicon glyphicon-trash',
			title : '',
			content : '<b style="margin-left:110px">确定操作?</b>',
			theme : 'black',
			animation : 'scalex',
			animationBounce : 1.5,
			closeAnimation : 'scale',
			confirmButtonClass : 'btn-danger',
			cancelButtonClass : 'btn-info',
			confirm : function() {
				// ajax方式删除数据
				var url = $(id).attr("href");
				var args = {};
				$.get(url, args, function(data) {
					// 请求成功，删除对应的节点
					if (data == "deleteSucc") {
						$(divId).remove();
					}
				});
			}
		});
	};
	$(".delete_goods").each(function() {
		$(this).bind('click', delete_good);
	});
	$(".shopman_click").each(function() {
		$(this).bind('click', delete_good);
	});
	$(".delete_sMes").each(function() {
		$(this).bind('click', delete_good);
	});
});

/* personaCenter3:点击留言获取准备信息 */
$(function() {
	var changeSys = function() {
		/*操作之前判断用户是否登入(此处只验证sellerCenter.jsp的留言)*/
		if($(".sessionText").attr('id')=="null"){
			window.location.href="../view/login.jsp";
		}
		// 获取对方用户id
		var userId = $(this).attr('id');
		// 插入到提交表单中
		$("#resUserid").val(userId);
			$.ajax({
					type : 'post',
					url : '../shopsMessage/selectByIdshopsMess.do',
					data : 'userid=' + userId,
					dataType : "json",
					success : function(data) {
						if (data.length != 0) {
							// 留言记录不为空，动态添加信息
							$("#respone_mess").empty();
							$.each(data,function(i, n) {
								var mytime = new Date(data[i].publishtime);
								var textTime = mytime.getFullYear()
										+ "-"
										+ (mytime.getMonth() + 1)
										+ "-"
										+ mytime.getDate()
										+ " "
										+ mytime.getHours()
										+ ":"
										+ mytime.getMinutes()
										+ ":"
										+ mytime.getSeconds();
								$("#respone_mess").append(
										"<div style='margin-bottom: 45px;'>"
										+ "<img src='/path/"
										+ data[i].headimg
										+ "' width='35' height='35' style='float: left;'/>"
										+ "<span  style='float: left;margin-left:10px;color:#aaa'>"
										+ textTime
										+ "</span>"
										+ "<span style='float: left;width: 580px;margin:0px 10px'>"
										+ data[i].message
										+ "</span>"
										+ "</div>");
							});
						}
					},
				});
	};
	$(".respone_a").each(function() {
		$(this).bind('click', changeSys);
	});
});

// 留言发表
$(function() {
	// 把发表的文章上传到数据库
	$('#texta')
			.click(
					function() {
						var editMess = $("#textMess").val();
						var Headimg = $(".userHeadimg").attr('id');
						$
								.ajax({
									type : 'post',
									url : '../shopsMessage/shopsMessInsert.do',
									data : $('#resFrom').serialize(),
									success : function(data) {
										if (data == "insertSucc") {
											// 插入成功，动态添加信息
											var mytime = new Date();
											var textTime = mytime.getFullYear()
													+ "-"
													+ (mytime.getMonth() + 1)
													+ "-" + mytime.getDate()
													+ " " + mytime.getHours()
													+ ":" + mytime.getMinutes()
													+ ":" + mytime.getSeconds();
											$("#respone_mess")
													.append(
															"<div style='margin-bottom: 45px;'>"
																	+ "<img src='/path/"
																	+ Headimg
																	+ "' width='35' height='35' style='float: left;'/>"
																	+ "<span  style='float: left;margin-left:10px;color:#aaa'>"
																	+ textTime
																	+ "</span>"
																	+ "<span style='float: left;width: 580px;margin:0px 10px'>"
																	+ editMess
																	+ "</span>"
																	+ "</div>");
											// 将滚动条滚动至最低端
											$('#respone_mess')
													.scrollTop(
															$('#respone_mess')[0].scrollHeight);
											// 插入成功，清楚编辑框的信息和提示信息
											$("#textMess").val('');
											$("#resMessSpan").html('');
											// 插入信息后，屏蔽‘还没有留言’
											$("#respone_none").css('display',
													'none');
										} else if (data == "insertOverlen") {
											$("#resMessSpan").html('长度不能超过50');
										} else if (data == "insertEmpty") {
											$("#resMessSpan").html('留言不能为空');
										}
									},
								});
						return false;
					});
});