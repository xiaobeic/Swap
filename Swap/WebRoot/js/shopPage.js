
/* 点击小标签查询 */
$(function() {
    var blurb_query = function() {
        var thisSmallCla=$(this);
        var smallClassify = $(this).html();
        $.ajax({type : 'post',
            url : '../allgoods/selectallgoods.action',
            data : 'smallclassify=' + smallClassify,
            dataType : "json",
            success : function(data) {
                //小标签颜色高亮; 
                $(thisSmallCla).parent().parent().children().each(function() {
                    //使当前高亮的颜色消除
                    $(this).children().css("color","white");
                });
                $(thisSmallCla).css("color","#077ACE");
                if (data.goodsCustom.length != 0) {
                    $("#info").empty();
                    //显示分页栏
                    $("#paging").css("display","block");
                    $.each(data.goodsCustom,function(i, goods) {
                        var mytime = new Date(goods.uploadtime);
                        month = mytime.getMonth() + 1;
                        var successTime = mytime.getFullYear()+ "-"+ month+ "-"+ mytime.getDate();
                        $("#info").append(
                            "<div class='allblurb1_1 thumbnail'>"
                                    + "<div class='allblurb1_11'>"
                                    + "<a href='../blurb/blurbQuery.action?goods_id="+goods.id+"'><img src='/path/"
                                    + goods.goodsimg1
                                    + "'/></a>"
                                    + "</div><div class='goods_info_div1'>"
                                    + "<p><span>名&nbsp;&nbsp;称:</span><span>"
                                    + goods.goodsname
                                    + "</span></p>"
                                    + "<p><span>成&nbsp;&nbsp;色:</span><span style='color:#FE6500'>"
                                    + goods.quality
                                    + "</span></p>"
                                    + "<p><span>我想换:</span><span style='color:#FE6500'>"
                                    + goods.intention
                                    + "</span></p>"
                                    + "<p><span>类&nbsp;&nbsp;别:</span><span>"
                                    + goods.bigclassify
                                    + "-"
                                    + goods.smallclassify
                                    + "</span></p></div><div class='treasure_info_div3'><span class='glyphicon glyphicon-time' title='发布时间'><i style='color: #5E5E5E'>"
                                    + successTime
                                    + "</i></span><span class='glyphicon glyphicon-eye-open' title='浏览量'><i style='color: #5E5E5E'>"
                                    + goods.viewnumber
                                    + "</i></span><span><i title='收藏' class='icon-star icon-large shopman_click shopman_span3'></i></span></div></div>");
                        });
                        //改变分页模块的值
                        var pageNow=data.page.pageNow;
                        var totalPageCount=data.page.totalPageCount;
                        //首页
                        $("#homePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //上一页
                        if(pageNow-1>0){
                            var page_Now=pageNow-1;
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else{
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        }
                        //下一页
                        if(totalPageCount==0){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else if(pageNow + 1 < totalPageCount){
                            var page_Now=pageNow+1;
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else if(pageNow + 1 >= totalPageCount){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //尾页
                        if(totalPageCount==0){
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else{
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //到第几页
                        $("#btn_pageNum").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //共几页，第几页
                        $("#totalPage_Count").html("共"+totalPageCount+"页");
                        $("#pageNumTo").val(pageNow);
                        $("pageTotla").attr("href",totalPageCount);
                        //让滚动条滚动到最顶部
                        $("#toTop").click();
                } else {
                    $("#info").empty();
                    $("#info").append("<div class='rest'><span>暂无信息..</span></div>");
                    //隐藏分页栏
                    $("#paging").css("display","none");
                }
            },
        });
        return false;
    };
    $(".allblurb_query").children('span').children('a').each(function() {
        $(this).bind('click', blurb_query);
    });
});



/* 点击分页查询 */
$(function() {
    var page_query = function() {
        //首先判断是大标签查询，还是小标签查询，如果是大标签查询发你下放行，执行超链接，否则执行ajax
        var this_href=$(this).attr('href');
        if(this_href.indexOf('selectallgoodss')>0){
            return true;
        }
        $.ajax({
            type : 'get',
            url : $(this).attr('href'),
            dataType : "json",
            success : function(data) {
                if (data.length != 0) {
                    $("#info").empty();
                    //显示分页栏
                    $("#paging").css("display","block");
                    $.each(data.goodsCustom,function(i, goods) {
                        var mytime = new Date(goods.uploadtime);
                        month = mytime.getMonth() + 1;
                        var successTime = mytime.getFullYear()+ "-"+ month+ "-"+ mytime.getDate();
                        $("#info").append(
                            "<div class='allblurb1_1 thumbnail'>"
                                    + "<div class='allblurb1_11'>"
                                    + "<a href='../blurb/blurbQuery.action?goods_id="+goods.id+"'><img src='/path/"
                                    + goods.goodsimg1
                                    + "'/></a>"
                                    + "</div><div class='goods_info_div1'>"
                                    + "<p><span>名&nbsp;&nbsp;称:</span><span>"
                                    + goods.goodsname
                                    + "</span></p>"
                                    + "<p><span>成&nbsp;&nbsp;色:</span><span style='color:#FE6500'>"
                                    + goods.quality
                                    + "</span></p>"
                                    + "<p><span>我想换:</span><span style='color:#FE6500'>"
                                    + goods.intention
                                    + "</span></p>"
                                    + "<p><span>类&nbsp;&nbsp;别:</span><span>"
                                    + goods.bigclassify
                                    + "-"
                                    + goods.smallclassify
                                    + "</span></p></div><div class='treasure_info_div3'><span class='glyphicon glyphicon-time' title='发布时间'><i style='color: #5E5E5E'>"
                                    + successTime
                                    + "</i></span><span class='glyphicon glyphicon-eye-open' title='浏览量'><i style='color: #5E5E5E'>"
                                    + goods.viewnumber
                                    + "</i></span><span><i title='收藏' class='icon-star icon-large shopman_click shopman_span3'></i></span></div></div>");
                        });
                        //改变分页模块的值
                        var pageNow=data.page.pageNow;
                        var totalPageCount=data.page.totalPageCount;
                        //首页
                        $("#homePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //上一页
                        if(pageNow-1>0){
                            var page_Now=pageNow-1;
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else{
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        }
                        //下一页
                        if(totalPageCount==0){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else if(pageNow + 1 < totalPageCount){
                            var page_Now=pageNow+1;
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else if(pageNow + 1 >= totalPageCount){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //尾页
                        if(totalPageCount==0){
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else{
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //到第几页
                        $("#btn_pageNum").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //共几页，第几页
                        $("#totalPage_Count").html("共"+totalPageCount+"页");
                        $("#pageNumTo").val(pageNow);
                        $("pageTotla").attr("href",totalPageCount);
                        //让滚动条滚动到最顶部
                        $("#toTop").click();
                }
                else {
                    $("#info").empty();
                    $("#info").append("<div class='rest'><span>暂无信息..</span></div>");
                    //隐藏分页栏
                    $("#paging").css("display","none");
                }
            },
        });
        return false;
    };
    $(".page_query_a").each(function() {
        $(this).bind('click', page_query);
    });
});



/* 分页：到指定页面按钮 */
$(function(){
    $("#btn_pageNum").click(function(){
        var pageNumTo=$("#pageNumTo").val();
        var pageTotal=$("#pageTotla").attr("href");
        var s =  /^[0-9]*[1-9][0-9]*$/;
        /*如果输入的值不是正整数或者大于总页数取消超链接默认行为*/
        if (s.test(pageNumTo)==false||pageTotal<pageNumTo) {
            return false;
        }
        //首先判断是大标签查询，还是小标签查询，如果是大标签查询放行，执行超链接，否则执行ajax
        var this_href=$(this).attr('href');
        if(this_href.indexOf('selectallgoodss')>0){
            $(this).attr("href","../allgoods/selectallgoodss.action?pageNow="+pageNumTo);
            return true;
        }
        $.ajax({
            type : 'get',
            url : '../allgoods/selectallgoods.action?pageNow='+pageNumTo,
            dataType : "json",
            success : function(data) {
                if (data.length != 0) {
                    $("#info").empty();
                    //显示分页栏
                    $("#paging").css("display","block");
                    $.each(data.goodsCustom,function(i, goods) {
                        var mytime = new Date(goods.uploadtime);
                        month = mytime.getMonth() + 1;
                        var successTime = mytime.getFullYear()+ "-"+ month+ "-"+ mytime.getDate();
                        $("#info").append(
                            "<div class='allblurb1_1 thumbnail'>"
                                    + "<div class='allblurb1_11'>"
                                    + "<a href='../blurb/blurbQuery.action?goods_id="+goods.id+"'><img src='/path/"
                                    + goods.goodsimg1
                                    + "'/></a>"
                                    + "</div><div class='goods_info_div1'>"
                                    + "<p><span>名&nbsp;&nbsp;称:</span><span>"
                                    + goods.goodsname
                                    + "</span></p>"
                                    + "<p><span>成&nbsp;&nbsp;色:</span><span style='color:#FE6500'>"
                                    + goods.quality
                                    + "</span></p>"
                                    + "<p><span>我想换:</span><span style='color:#FE6500'>"
                                    + goods.intention
                                    + "</span></p>"
                                    + "<p><span>类&nbsp;&nbsp;别:</span><span>"
                                    + goods.bigclassify
                                    + "-"
                                    + goods.smallclassify
                                    + "</span></p></div><div class='treasure_info_div3'><span class='glyphicon glyphicon-time' title='发布时间'><i style='color: #5E5E5E'>"
                                    + successTime
                                    + "</i></span><span class='glyphicon glyphicon-eye-open' title='浏览量'><i style='color: #5E5E5E'>"
                                    + goods.viewnumber
                                    + "</i></span><span><i title='收藏' class='icon-star icon-large shopman_click shopman_span3'></i></span></div></div>");
                        });
                        //改变分页模块的值
                        var pageNow=data.page.pageNow;
                        var totalPageCount=data.page.totalPageCount;
                        //首页
                        $("#homePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //上一页
                        if(pageNow-1>0){
                            var page_Now=pageNow-1;
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else{
                            $("#prvePage").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        }
                        //下一页
                        if(totalPageCount==0){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else if(pageNow + 1 < totalPageCount){
                            var page_Now=pageNow+1;
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+page_Now);
                        }else if(pageNow + 1 >= totalPageCount){
                            $("#nextPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //尾页
                        if(totalPageCount==0){
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+pageNow);
                        }else{
                            $("#lastPage").attr("href","../allgoods/selectallgoods.action?pageNow="+totalPageCount);
                        }
                        //到第几页
                        $("#btn_pageNum").attr("href","../allgoods/selectallgoods.action?pageNow=1");
                        //共几页，第几页
                        $("#totalPage_Count").html("共"+totalPageCount+"页");
                        $("#pageNumTo").val(pageNow);
                        $("pageTotla").attr("href",totalPageCount);
                        //让滚动条滚动到最顶部
                        $("#toTop").click();
                }
                else {
                    $("#info").empty();
                    $("#info").append("<div class='rest'><span>暂无信息..</span></div>");
                    //隐藏分页栏
                    $("#paging").css("display","none");
                }
            },
        });
        return false;
    });
});



//轮播图
(function($) {
    $.fn.ckSlide = function(opts) {
        // .extend() 扩展jQuery类，添加ckSlide方法，参数是对象类型{}
        opts = $.extend({}, $.fn.ckSlide.opts, opts);
        this.each(function() {
            var slidewrap = $(this).find('.allblurb_21');// 轮播元素父对象
            var slide = slidewrap.find('li');// 获取<li>对象集
            var count = slide.length;// 计算对象集长度
            var that = this;// 存放父对象
            var index = 0;// 起始位置
            var time = null;
            $(this).data('opts', opts);// 给轮播对象添加参数 数据
            // next
            $(this).find('.allblurb_212').on('click', function() {
                if (opts['isAnimate'] == true) {
                    return;
                }

                var old = index;
                if (index >= count - 1) {
                    index = 0;
                } else {
                    index++;
                }
                change.call(that, index, old);// 调用图片切换方法，.call()
                                                // 每个JS函数都包含的一个非继承而来的方法，主要用来指定函数的作用域
                                                // that
                                                // ，通常不严谨写法是change()，有可能会函数冲突。
            });
            // prev
            $(this).find('.allblurb_211').on('click', function() {
                if (opts['isAnimate'] == true) {
                    return;
                }

                var old = index;
                if (index <= 0) {
                    index = count - 1;
                } else {
                    index--;
                }
                change.call(that, index, old);
            });
            // 点击切换相应序号的图片
            $(this).find('.allblurb_22 li').each(function(cindex) {
                $(this).on('click.slidebox', function() {
                    change.call(that, cindex, index);
                    index = cindex;
                });
            });
            // 自己添加——鼠标移入小圆点切换轮播图片
            $(this).find('.allblurb_22 li').each(function(cindex) {
                $(this).on('mouseover.slidebox', function() {
                    change.call(that, cindex, index);
                    index = cindex;
                });
            });

            // 鼠标悬停停止自动播放，显示左右切换按钮
            $(this).on('mouseover', function() {
                if (opts.autoPlay) {
                    clearInterval(time);
                }
                $(this).find('.ctrl-blurb').css({
                    opacity : 0.6
                });
            });
            // 鼠标离开轮播界面，开始自动播放，同时隐藏按钮
            $(this).on('mouseleave', function() {
                if (opts.autoPlay) {
                    startAtuoPlay(opts.interval);
                }
                $(this).find('.ctrl-blurb').css({
                    opacity : 0.1
                });
            });
            startAtuoPlay(opts.interval);
            // 自动滚动播放
            function startAtuoPlay(inum) {
                if (opts.autoPlay) {
                    time = setInterval(function() {
                        var old = index;
                        if (index >= count - 1) {
                            index = 0;
                        } else {
                            index++;
                        }
                        change.call(that, index, old);
                    }, inum);// 2秒
                }
            }
            // 修正box 标记居中
            var box = $(this).find('.allblurb_22');
            box.css({
                'margin-left' : -(box.width() / 2)
            })
            // dir 移动方向参数
            switch (opts.dir) {
            case "x":
                opts['width'] = $(this).width();
                slidewrap.css({
                    'width' : count * opts['width']
                });
                slide.css({
                    'float' : 'left',
                    'position' : 'relative',
                    'margin-left' : '0px'
                });
                // .wrap()包裹页面已经定义的.ck-slide-wrapper以及子元素
                slidewrap.wrap('<div class="ck-slide-dir"></div>');
                slide.show();
                break;
            case "y": // 添加垂直移动参数
                opts['height'] = $(this).height();
                slidewrap.css({
                    'height' : count * opts['height']
                });
                slide.css({
                    'float' : 'left',
                    'position' : 'relative',
                    'margin-top' : '0px'
                });
                slidewrap.wrap('<div class="ck-slide-dir"></div>');
                slide.show();
                break;
            }
        });
    };
    function change(show, hide) {
        // 获取之前设置在ckSlide对象上的参数 数据
        var opts = $(this).data('opts');
        // 水平移动
        if (opts.dir == 'x') {
            var x = show * opts['width'];
            // animate() 与css()执行结果相同，但是过程不同，前者有渐变动画效果
            $(this).find('.allblurb_21').stop().animate({
                'margin-left' : -x
            }, function() {
                opts['isAnimate'] = false;
            });
            opts['isAnimate'] = true;// 图片在移动过程中设置按钮点击不可用，确保每一次轮播视觉上执行完成，
        } else if (opts.dir == 'y') {// 垂直移动——自己添加
            var y = show * opts['height'];
            $(this).find('.allblurb_21').stop().animate({
                'margin-top' : -y
            }, function() {
                opts['isAnimate'] = false;
            });
            opts['isAnimate'] = true;
        } else {
            // 默认的淡隐淡出效果
            $(this).find('.allblurb_21 li').eq(hide).stop().animate({
                opacity : 0
            });
            $(this).find('.allblurb_21 li').eq(show).show().css({
                opacity : 0
            }).stop().animate({
                opacity : 1
            });
        }
        // 切换对应标记的颜色
        $(this).find('.allblurb_22 li').removeClass('current');
        $(this).find('.allblurb_22 li').eq(show).addClass('current');
    }
    $.fn.ckSlide.opts = {
        autoPlay : false,// 默认不自动播放
        dir : null,// 默认淡隐淡出效果
        isAnimate : false,// 默认按钮可用
        interval : 2000
    // 默认自动2秒切换
    };
})(jQuery);
/* 同页跳转 */
function Div(divid, divname, divcount) {
    for (i = 0; i < divcount; i++) {
        document.getElementById(divname + i).style.display = "none";
    }
    document.getElementById(divname + divid).style.display = "block";
}