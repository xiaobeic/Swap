/* Click 'yes' submit from exam */
$(function() {
    $(".admin_delete").on('click', function() {
        $("#page_dialog").fadeIn(300);
        $("#delete_button").fadeIn(700);
        $("#admin_del_id").attr("href", $(this).attr("href"));
        return false;
    })
});

$(function() {
    $("#btn_yes").on('click', function() {
        $("#exam_form").attr("action", "../exam/delete");
        $("#exam_form").submit();
    });
});

$(function() {
    $("#btn_yes_exam").on('click', function() {

        var checks = $("input[name='items'][checked]").val([]);
        $.ajax({
            type : 'post',
            url : '../exam/deleteByAjax',
            data : checks,
            success : function(data) {
                if (data == "success") {
                    $("input[name='items'][checked]").parent().parent().remove();
                    $("#message_title_ajax").text("Delete information successfully!")
                    $("#message_title_ajax").show();
                    setTimeout(function () {
                        $("#message_title_ajax").fadeOut(1000);
                    }, 2000);
                } else {
                    $("#message_title_ajax").text("Failed to delete information!")
                    $("#message_title_ajax").show();
                    setTimeout(function () {
                        $("#message_title_ajax").fadeOut(1000);
                    }, 2000);
                }
            }
        })

        $("#page_dialog").fadeOut(100);
        $("#delete_button").fadeOut(100);
    });
});

/* Dialog */
$(function() {
    $(".btn_no").on('click', function() {
        $(this).parent().css("display", "none");
        $("#page_dialog").css("display", "none");
    });
});

/* Change exam select value to submit request */
$(function() {
    $("#exam_select").on('change', function(){
        $("#exam_form").submit();
    });
});

/* Search function */
$(function() {
    $("#admin_search").on('click', function() {
        var search_keyword = $("#search_keyword").val();
        if (search_keyword.trim().length == 0) {
        	$("#dialog_title_p").html('请输入关键词');
        	$("#dialog_title").fadeIn(700);
            $("#page_dialog").fadeIn(300);
        	return false;
        }
        $("#exam_form").submit();
    });
});

/* Paging input submit */
$(function() {
    $("#paging_go").on('click', function() {
        var paging_go = $(this).prev().val();
        if (paging_go.trim().length == 0) {
            $(this).prev().val("");
            $("#dialog_title_p").html('请输入页数！');
            $("#dialog_title").fadeIn(700);
            $("#page_dialog").fadeIn(300);
            return false;
        }
        var s =  /^[0-9]*[1-9][0-9]*$/;
        if (s.test(paging_go) == false) {
            $(this).prev().val("");
            $("#dialog_title_p").html('请输入有效数值!');
            $("#dialog_title").fadeIn(700);
            $("#page_dialog").fadeIn(300);
            return false;
        }
        $("#paging_go").attr("href", $("#paging_go").attr("href") + paging_go);
        $("#exam_form").submit();
    });
});

/* Question list sort */
$(function() {
    $(".exam_title_id, .exam_title_name, .exam_title_effective_time").on('click', function() {
        if ($(this).hasClass("sort_Increase")) {
            $(this).removeClass("sort_Increase");
            $(this).addClass("sort_decrese");
            $(this).prev().val("desc");
        } else {
            $(this).removeClass("sort_decrese");
            $(this).addClass("sort_Increase");
            $(this).prev().val("asc");
        }
        $("#exam_form").submit();
    });
});


/* Batch delete(question_meangement) */
$(function(){
    $("#checkedAll").on('click',function(){
        var checkbox = $("#checkbox_input");
        var flag = checkbox.attr("checked");
        if (flag) {
            checkbox.removeAttr("checked");
            $(this).attr("src", "../static/images/ICN_Unselected_15x15.png");
            $(".checked_one").attr("src", "../static/images/ICN_Unselected_15x15.png");
        } else {
            checkbox.attr("checked", "checked");
            $(this).attr("src", "../static/images/ICN_Selected_15x15.png");
            $(".checked_one").attr("src", "../static/images/ICN_Selected_15x15.png");
        }
        var status = checkbox.attr("checked");
        if (status) {
            $(":checkbox[name='items']").attr("checked", "checked");
        }else {
             $(":checkbox[name='items']").removeAttr("checked");
        }
    });

    $(".checked_one").on('click', function() {
        var input = $(this).parent().children().first();
        var flag = input.attr("checked");
        if (flag) {
            input.removeAttr("checked");
            $(this).attr("src", "../static/images/ICN_Unselected_15x15.png");
        } else {
            input.attr("checked", "checked");
            $(this).attr("src", "../static/images/ICN_Selected_15x15.png");
        }
        var status = $(":checkbox[name='items']").length == $(":checkbox[name='items'][checked]").length;
        if (status) {
            $("#checkbox_input").attr("checked", "checked");
            $("#checkedAll").attr("src", "../static/images/ICN_Selected_15x15.png");
        } else {
            $("#checkbox_input").removeAttr("checked");
            $("#checkedAll").attr("src", "../static/images/ICN_Unselected_15x15.png");
        }
    });
});

$(function() {
    $("#exam_add_btn").on('click', function() {
        var submit_status = true;
        var examName_len = $("input[name='examName']").val().trim().length;
        if (examName_len == 0) {
            $("input[name='examName']").css("border-color", "red");
            $("input[name='examName']").next().html("Exam name can not be empty");
            submit_status = false;
        } else if (examName_len > 20) {
            $("input[name='examName']").css("border-color", "red");
            $("input[name='examName']").next().html("Length can not be more than 20");
            submit_status = false;
        } else {
            $("input[name='examName']").css("border-color", "#0578FA");
            $("input[name='examName']").next().html("");
        }

        var description_len = $("textarea[name='description']").val().trim().length;
        if (description_len > 100) {
            $("textarea[name='description']").css("border-color", "red");
            $("textarea[name='description']").next().html("Length can not be more than 100");
            submit_status = false;
        } else {
            $("textarea[name='description']").css("border-color", "#0578FA");
            $("textarea[name='description']").next().html("");
        }

        var examDate_len = $("input[name='effectiveExamDate']").val().trim().length;
        if (examDate_len == 0) {
            $("input[name='effectiveExamDate']").css("border-color", "red");
            $("input[name='effectiveExamDate']").next().next().html("Effective Time can not be empty");
            submit_status = false;
        } else {
            $("input[name='effectiveExamDate']").css("border-color","#0578FA");
            $("input[name='effectiveExamDate']").next().next().html("");
        }

        var examTime_len = $("input[name='effectiveExamTime']").val().trim().length;
        if (examTime_len == 0) {
            $("input[name='effectiveExamTime']").css("border-color", "red");
            $("input[name='effectiveExamTime']").next().html("Effective Time can not be empty");
            submit_status = false;
        } else {
            $("input[name='effectiveExamTime']").css("border-color", "#0578FA");
            if (examDate_len != 0) {
                $("input[name='effectiveExamTime']").next().html("");
            }

        }

        var validition = /^[0-9]*[1-9][0-9]*$/;

        var quantity = $("input[name='questionQuantity']").val().trim();
        if (quantity.length == 0) {
            $("input[name='questionQuantity']").css("border-color", "red");
            $("#question_set_quantity").html("Quantity can not be empty");
            submit_status = false;
        } else if (validition.test(quantity) == false) {
            $("input[name='questionQuantity']").css("border-color", "red");
            $("#question_set_quantity").html("Quantity input message is not valid");
            submit_status = false;
        } else {
            $("input[name='questionQuantity']").css("border-color", "#0578FA");
            $("#question_set_quantity").html("");
        }

        var siglescore = $("input[name='sigleScore']").val().trim();
        if (siglescore.length == 0) {
            $("input[name='sigleScore']").css("border-color", "red");
            $("#question_set_points").html("Sigle score can not be empty");
            submit_status = false;
        } else if (validition.test(siglescore) == false) {
            $("input[name='sigleScore']").css("border-color", "red");
            $("#question_set_points").html("Points input message is not valid");
            submit_status = false;
        } else {
            $("input[name='sigleScore']").css("border-color", "#0578FA");
            $("#question_set_points").html("");
        }

        var passcriteria = $("input[name='passCriteria']").val().trim();
        if (passcriteria.length == 0) {
            $("input[name='passCriteria']").css("border-color", "red");
            $("#question_set_criteria").html("Pass criteria can not be empty");
            submit_status = false;
        } else if (validition.test(passcriteria) == false) {
            $("input[name='passCriteria']").css("border-color", "red");
            $("#question_set_criteria").html("Criteria input message is not valid");
            submit_status = false;
        } else {
            $("input[name='passCriteria']").css("border-color", "#0578FA");
            $("#question_set_criteria").html("");
        }

        var nowDate=new Date();
        var effectiveExamDate=$("input[name='effectiveExamDate']").val() + " " + $("input[name='effectiveExamTime']").val();
        var examDate=new Date(effectiveExamDate.replace("-", "/"));
        if(examDate<nowDate){
            $("input[name='effectiveExamTime']").next().html("Effective time can not be less than the current time");
            $("input[name='effectiveExamDate']").val("");
            $("input[name='effectiveExamTime']").val("");
            $("input[name='effectiveExamDate']").css("border-color", "red");
            $("input[name='effectiveExamTime']").css("border-color", "red");
            submit_status = false;
        }

        if (submit_status) {
            $.ajax({
                type : 'get',
                url : '../question/questionQuantity',
                data : 'quantity=' + $("input[name='questionQuantity']").val(),
                success : function(data) {
                    if (data == "true") {
                        $("#examFrom").submit();
                    } else {
                        $("#delete_title_p").html('Lack of examination questions will be saved as a draft!');
                        $("#exam_add_quantity").fadeIn(700);
                        $("#page_dialog").fadeIn(300);
                    }
                }
            })
        }

    })
});

$(function() {
    $("#exam_add_yes").on('click', function(){
        $("#examFrom").submit();
    })
});

$(function() {
    $("input[name='questionQuantity'], input[name='sigleScore']").on('change', function(){
        var validition =  /^[0-9]*[1-9][0-9]*$/;
        var quantity = $("input[name='questionQuantity']").val().trim();
        var siglescore = $("input[name='sigleScore']").val().trim();
        if (quantity.length > 0 && validition.test(quantity)) {
            if (quantity > 100) {
                $("input[name='questionQuantity']").val(100);
            }
        }
        if (siglescore.length > 0 && validition.test(siglescore)) {
            if (siglescore > 100) {
                $("input[name='sigleScore']").val(100);
            }
        }
        var quantity_new = $("input[name='questionQuantity']").val().trim();
        var siglescore_new = $("input[name='sigleScore']").val().trim();
        if (quantity_new.length > 0 && siglescore_new.length > 0 && validition.test(quantity_new) && validition.test(siglescore_new)) {
            $("input[name='totalScore']").val(quantity_new * siglescore_new);
        }
    })
    $("input[name='passCriteria']").on('change', function(){
        if ($("input[name='passCriteria']").val() - 0 > $("input[name='totalScore']").val() - 0) {
            $("input[name='passCriteria']").val($("input[name='totalScore']").val() * 0.6);
        }
    })
});

$(function() {
    $("#select_duration").on('click', function() {
        if ($(this).hasClass("keep")) {
            $(this).removeClass("keep");
            $(this).css("background-image", "url('../static/images/ICN_Expand_12x20.png')");
        } else {
            $(this).addClass("keep");
            $(this).css("background-image", "url('../static/images/ICN_Keep_12x20.png')");
        }
    })
});
