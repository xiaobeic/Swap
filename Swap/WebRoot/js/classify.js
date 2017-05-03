/*
*    分类
*/
function Dsy(){
    this.Items = {};
}
Dsy.prototype.add = function(id,iArray){
    this.Items[id] = iArray;
}
Dsy.prototype.Exists = function(id){
    if(typeof(this.Items[id]) == "undefined") return false;
    return true;
}

function change(v){
    var str="0";
    for(i=0;i<v;i++){
        str+=("_"+(document.getElementById(s[i]).selectedIndex-1));
    };
    var ss=document.getElementById(s[v]);
    with(ss){
        length = 0;
        options[0]=new Option(opt0[v],opt0[v]);
        if(v && document.getElementById(s[v-1]).selectedIndex>0 || !v){
            if(dsy.Exists(str)){
                ar = dsy.Items[str];
                for(i=0;i<ar.length;i++){
                    options[length]=new Option(ar[i],ar[i]);
                }//end for
                if(v){ options[0].selected = true; }
            }
        }//end if v
        if(++v<s.length){change(v);}
    }//End with
}

var dsy = new Dsy();

dsy.add("0_0",["夹克","外套","卫衣","风衣","衬衫","背心","牛仔裤","休闲裤","短裤","西装","毛衣","运动装","情侣装","羽绒服","皮衣","羊毛衫","唐装","T恤衫"]);
dsy.add("0_1",["外套","卫衣","衬衫","牛仔裤","休闲装","短裤","西装","毛衣","运动装","情侣装","羽绒服","皮衣","羊毛衫","唐装","T恤衫","连衣裙","皮草","风衣","半身裙","吊带装","婚纱","内衣"]);
dsy.add("0_2",["女包","男包","双肩包","钱包","真皮包","单肩包","手提包","电脑包","登山包","书包","斜挎包","迷你包","休闲包","拉杆箱","旅行箱"]);
dsy.add("0_3",["面部护肤","洗发护发","香水彩妆","沐浴用品","男士剃须","口腔护理"]);
dsy.add("0_4",["奥迪","大众","现代","本田","昌河","宝沃","铃木","别克","奇瑞","奔腾","宇通","一汽","宝骏","北京","双龙","雪铁龙","雪佛兰","保时捷","西雅特","特斯拉","帆加尼","斯柯达","星客特","MINI","KIM","卡迪拉克","长安轿车","汽车配件"]);
dsy.add("0_5",["家用电器","床上用品","厨具","家具","家装软饰","清洁用品"]);
dsy.add("0_6",["管理","文学","小说","动漫","经济","金融与投资","历史","心理学","政治军事","哲学","法律","教学书","美食","时尚","资格认证书籍"]);
dsy.add("0_7",["小米","华为","红米","VIVO","乐视","OPPO","魅族","大神","神舟","小牛","诺基亚","金立","黑莓","三星","苹果","老人机","手机配件"]);
dsy.add("0_8",["戴尔","联想","神舟","华硕","宏碁","天虹","惠普","苹果","三星","索尼","微软","雷霆世纪","电脑配件"]);
dsy.add("0_9",["户外服饰","户外鞋服","户外装备","野炊烧烤","游泳用品","垂钓用品","生活运动","安全应急"]);
dsy.add("0_10",["休闲零食","生鲜.果蔬","美酒佳酿","茶.冲饮","粮油调味","进口食品"]);
dsy.add("0",["男装","女装","箱包","美妆","汽车","家居","图书","手机","电脑","户外","食品"]);

var s=["s_bigclassify","s_smallclassify"];
var opt0 = ["其他","其他"];//初始值
function _init_area(){  //初始化函数
    for(i=0;i<s.length-1;i++){
      document.getElementById(s[i]).onchange=new Function("change("+(i+1)+")");
    }
    change(0);
}
