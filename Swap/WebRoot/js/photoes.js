var myDiv = $("#myDiv");
$(function() {
    $("#btn").click(function(event) {
        showDiv(); //调用显示DIV方法
        $(document).one("click", function() { //对document绑定一个影藏Div方法
            $(myDiv).hide();
        });

        event.stopPropagation(); //阻止事件向上冒泡
    });
    $(myDiv).click(function(event) {

        event.stopPropagation(); //阻止事件向上冒泡
    });
});
function showDiv() {
    $(myDiv).fadeIn();
}