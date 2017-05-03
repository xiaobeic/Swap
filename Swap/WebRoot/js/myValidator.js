
/**
 *设置验证 
 */
$(function() {
	function randomNumber(min, max) {
		return Math.floor(Math.random() * (max - min + 1) + min);
	};
	$('#shopInfo').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			shopname: {
				validators: {
					notEmpty: {
						message: '店铺名称不能为空'
					},
					stringLength: {
						min: 1,
						max: 20,
						message: '名称长度为1~20个字符'
					},
				}
			},
			email: {
				validators: {
					emailAddress: {
						message: '无效的邮箱地址'
					}
				}
			},
			telephone: {
				validators: {
					digits: {
						message: '无效的手机号'
					},
					stringLength: {
						min: 11,
						max: 11,
						message: '手机号长度为11个字符'
					},
				}
			},
			qqnumber: {
				validators: {
					digits: {
						message: '无效的qq号'
					},
					stringLength: {
						min: 6,
						max: 12,
						message: 'qq号长度为6-12个字符'
					},
				}
			},
			adress: {
				validators: {
					stringLength: {
						min: 0,
						max: 20,
						message: '地址长度不能超过20个字符'
					},
				}
			},
			announcement: {
				validators: {
					stringLength: {
						min: 0,
						max: 50,
						message: '公告长度不能超过50个字符'
					},
				}
			},
		}
	});
	$('#passwordInfo').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			password: {
				validators: {
					notEmpty: {
						message: '当前密码不能为空'
					},
					stringLength: {
						min: 8,
						max: 18,
						message: '密码长度为8~18个字符'
					},
				}
			},
			newPassword: {
				validators: {
					notEmpty: {
						message: '新密码不能为空'
					},
					identical: {
						field: 'confirmPassword',
						message: '两次输入的新密码不同'
					},
					different: {
						field: 'password',
						message: '新密码和旧密码不能相同'
					},
					stringLength: {
						min: 8,
						max: 18,
						message: '密码长度为8~18个字符'
					},
				}
			},
			confirmPassword: {
				validators: {
					notEmpty: {
						message: '确认密码不能为空'
					},
					identical: {
						field: 'newPassword',
						message: '两次输入的新密码不同'
					},
					stringLength: {
						min: 8,
						max: 18,
						message: '密码长度为8~18个字符'
					},
				}
			},
		}
	});
	$('#shopUpdate').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			goodsname: {
				validators: {
					notEmpty: {
						message: '店铺名称不能为空'
					},
					stringLength: {
						min: 1,
						max: 20,
						message: '名称长度为1~20个字符'
					},
				}
			},
			intention: {
				validators: {
					stringLength: {
						min: 0,
						max: 20,
						message: '名称长度不能超过20个字符'
					},
				}
			},
			originalprice_1: {
				validators: {
					digits: {
						message: '无效的数值'
					},
					stringLength: {
						min: 0,
						max: 8,
						message: '数值不能超过8位'
					},
				}
			},
			evaluation_1: {
				validators: {
					digits: {
						message: '无效的数值'
					},
					stringLength: {
						min: 0,
						max: 8,
						message: '数值不能超过8位'
					},
				}
			},
			goodsmessage: {
				validators: {
					stringLength: {
						min: 0,
						max: 100,
						message: '长度不能超过100个字符'
					},
				}
			},
			sellerspeak: {
				validators: {
					stringLength: {
						min: 0,
						max: 100,
						message: '长度不能超过100个字符'
					},
				}
			},
		}
	});
});