
$(window).load(function(){
    //var data = [{"src":__resPath + "/fashionPort/images/zz2_03.jpg"},{"src":__resPath + "/fashionPort/images/zz2_05.jpg"},{"src":__resPath + "/fashionPort/images/zz2_07.jpg"},{"src":__resPath + "/fashionPort/images/zz2_11.jpg"},{"src":__resPath + "/fashionPort/images/zz2_14.jpg"},{"src":__resPath + "/fashionPort/images/zz2_16.jpg"},{"src":__resPath + "/fashionPort/images/zz2_21.jpg"},{"src":__resPath + "/fashionPort/images/zz2_23.jpg"}];
    //var pHeight = [{"height":"456"},{"height":"285"},{"height":"397"},{"height":"437"},{"height":"405"},{"height":"577"},{"height":"299"},{"height":"219"}];
    PBL("#pubu",".box",2);
    var ajaxkey = true;
    var pageNo = 1;
    var pageSize = 9;
    
    window.onscroll = function(){
    	 if (getDataCheck() && ajaxkey) {
         	
             var pubu = $("#pubu");
             pageNo++;
             var keyword = $("#keyword").text();
             $.ajax({  
                 type : "post",  
                  url : __ctxPath + "/information_page.html",  
                  data : {pageNo:pageNo,pageSize:pageSize,keyword:keyword},
                  async : false,  
                  success : function(result){  
                 	 if(result.data != null){
 		            		var infor = "";
 		            		for(var i in result.data){
 		            			var currentPageNo = (pageNo - 1)*pageSize+(parseInt(i)+1);
 		            			infor += '<a href="'+ __ctxPath +'/information.html?inforId='+result.data[i].id+'&ss='+currentPageNo+'">';
 		            			infor += '<div class="box">';
 		            			infor += '<div class="pic">';
 		            	    	infor += '<img src="'+ __mediaPath +'other/'+result.data[i].image+'"/>';
 		            	    	infor += '</div>';
 		            	    	infor += '<div class="tit">';
 		            	    	infor += '<p>';
 		            	    	infor += result.data[i].content;
 		            	    	infor += ' </p>';
 		            	    	infor += '</div>';
 		            	    	infor += '</div>';
 		            	    	infor += '</a>';
 		            		}
 		            		pubu.append(infor);
 		            	}
                  }  
             }); 
             
             $("img").load(function(){
             	PBL("#pubu",".box",2);
             });
             
             $(".box").hover(
                 function(){
                     $(this).find(".tit").show();
                 },
                 function(){
                     $(this).find(".tit").hide();
                 }
             );
             $(function() {
                 i = 0;
                 n = $(".tp_center").children().length;
                 time = setInterval("fadeObj()", 5000); //
                 clearInterval(time);
             });
             function fadeObj() {
                 i = i + 1;
                 $(".tp_center div").fadeOut(800);
                 $(".tp_center div:eq(" + i + ")").fadeIn(800);
                 if (i == n - 1) {
                     i = -1;
                 }
             }
         };
    }
    $("#load_more").click(function(){
    });
})

function PBL(outer,boxs,style){
	var $data = $("#data");
    var pubu = $(outer);
    var box = $(boxs);  
    var num = 3;
    var pubu_height ="";
    var allHeight = [];
    
    var pubu_heights = [];
    
    for(var i=0;i<box.length;i++){
        if (i<num) {
            allHeight[i]=box.eq(i).outerHeight();
            if(i==0){
            	//pubu_height = Number(box.eq(i).outerHeight());
            	pubu_heights[0] = Number(box.eq(i).outerHeight());
            }else if(i == 1){
            	pubu_heights[1] = Number(box.eq(i).outerHeight());
            }else if(i == 2){
            	pubu_heights[2] = Number(box.eq(i).outerHeight());
            }
        }else{
            var minHeight = Math.min.apply({},allHeight);
            var sy = getSy(minHeight,allHeight);
            var left = sy*box.eq(i).outerWidth();
            //$data.append("<br/>allHeight:" + allHeight + "；sy:" + sy + "；left:" + left);
            getStyle( box.eq(i) ,minHeight ,left , i, style );
            allHeight[sy] = Number(allHeight[sy]) + Number(box.eq(i).outerHeight());
            //alert(Number(box.eq(i).outerHeight()));
            if(sy*box.eq(i).outerWidth()==0){
            	//var maxHeight = Math.max.apply({},allHeight);
            	//pubu_height = maxHeight;
            	pubu_height = Number(pubu_height) + Number(box.eq(i).outerHeight());
            }   
            if(sy == 0){
            	pubu_heights[0] = Number(pubu_heights[0]) + Number(box.eq(i).outerHeight());
            }else if(sy == 1){
            	pubu_heights[1] = Number(pubu_heights[1]) + Number(box.eq(i).outerHeight());
            }else if(sy == 2){
            	pubu_heights[2] = Number(pubu_heights[2]) + Number(box.eq(i).outerHeight());
            }
        }
    }
    var maxHeight = Math.max.apply({},pubu_heights);
    pubu.height(maxHeight);
}

function getSy(minH,allH){
    for(sy in allH){
        if(allH[sy]==minH) return sy;
    }
}

function getDataCheck(){
    var pubu = $("#pubu");
    var box = $(".box");
    var lastboxHeight = $(box[box.length-1]).offset().top+Math.floor($(box[box.length-1]).outerHeight()/2);
    var documentHeight = $(window).height();
    var scrollTop = $(document).scrollTop();
    return lastboxHeight<documentHeight+scrollTop?true:false;
}

var getStartNum = 0;

function getStyle(boxs,top,left,index,style){
    if (getStartNum>=index) {
        return;
    }
    boxs.css("position","absolute");
    switch(style){
        case 1:
            boxs.css({
                "top":top+$(window).height(),
                "left":left
            });
            boxs.stop().animate({
                "top":top,
                "left":left
            },999);
        break;
        case 2:
            boxs.css({
                "top":top,
                "left":left,
                "opacity":"0"
            });
            boxs.stop().animate({
                "opacity":"1"
            },999);
    }
    getStartNum = index;
}