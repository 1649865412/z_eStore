
//礼品卡使用
function fnUseGift(giftCertificateNo,type){

	if(type == 1){	//手动输入礼品卡
		
		if($("#giftCertificateNo").val() ==''){
			$.post(__ctxPath+"/checkout/paymentProcess.html?doAction=notuseGc",{giftCertificateNo:giftCertificateNo},function(result){
				var t = parseFloat('0.0');
				$("#giftPay").text(t.toFixed(2));
			 	$("#couponNo_input_id").attr("disabled",false);
	   			fnUpdatePrice();
			},"json");
		}
		
		if(giftCertificateNo == $("#giftCertificateNo").val()){
			return false ;
		}

		else{
			giftCertificateNo = $("#giftCertificateNo").val();
			var cart_sum = parseFloat($("#cart_sum").text());
			$.post(__ctxPath+"/checkout/paymentProcess.html?doAction=doUseGc",{giftCertificateNo:giftCertificateNo,money:cart_sum},function(result){
				if(result.status==1){
					var code=giftCertificateNo;
					var money=result.data;
					var giftPay_sum = parseFloat($("#giftPay").text());
					$("#giftPay").text(money.toFixed(2));
					//$("#cart_sum").text(cart_sum-money);
					/*
					var giftCertificateNos='';
					if(giftCertificateNos!=""){
						giftCertificateNos+="#";
					}
					giftCertificateNos+=code+":"+money;
					$("#giftCertificateNos").val(giftCertificateNos);
					$("#giftCertificate").val(true);
					$("#giftCertificateNo").val(giftCertificateNo);
					*/
					$("#couponNo_input_id").attr("disabled",true);
				}else{
					//if(giftCertificateNo && giftCertificateNo!=$("#giftCertificateNo").val())
					alert(result.msg);
					//$("#giftCertificateNo").val(giftCertificateNo);
					$("#giftPay").text("0.00");
					$("#couponNo_input_id").attr("disabled",false);
				}
				fnUpdatePrice();
			},"json");
		}
	}
	if(type == 2){	//点击已绑定礼品卡
		if(giftCertificateNo == $("#giftCertificateNo").val()){
			return false ;
		}
		else{
			$("#giftCertificateNo").val(giftCertificateNo);
			var cart_sum = parseFloat($("#cart_sum").text());
			$.post(__ctxPath+"/checkout/paymentProcess.html?doAction=doUseGc",{giftCertificateNo:$("#giftCertificateNo").val(),money:cart_sum},function(result){
				if(result.status==1){
					var code=giftCertificateNo;
					var money=result.data;
					var giftPay_sum = parseFloat($("#giftPay").text());
					$("#giftPay").text(money.toFixed(2));
					//$("#cart_sum").text(cart_sum-money);
					var giftCertificateNos=$("#giftCertificateNos").val();
					if(giftCertificateNos!=""){
						giftCertificateNos+="#";
					}
					giftCertificateNos+=code+":"+money;
					$("#giftCertificateNos").val(giftCertificateNos);
					$("#giftCertificate").val(true);
					$("#giftCertificateNo").val(giftCertificateNo);
					$("#couponNo_input_id").attr("disabled",true);
				}else{
					//if(giftCertificateNo && giftCertificateNo!=$("#giftCertificateNo").val())
					alert(result.msg);
					//$("#giftCertificateNo").val(giftCertificateNo);
					$("#giftPay").text("0.00");
					$("#couponNo_input_id").attr("disabled",false);
				}
				fnUpdatePrice();
			},"json");
		}
		hideTemlateList();
	}
}

//优惠劵使用
function fnUseCoupon(couponId){
	if($("#couponNo_input_id").val()==couponId){
		return false;
	 }
	else if($("#couponNo_input_id").val() ==''){
		$.post(__ctxPath+"/cart/shoppingcart.html?doAction=notuseCoupon",{couponNo_input_name:$("#couponNo_input_id").val()},function(result){
			 var dis = parseFloat($("#cart_dis_member").val());
		 	//$("#cartDiscountAmount").text(dis.toFixed(2));
		 	$("#cartDiscountAmount").text("0.00");
		 	$("#giftCertificateNo").attr("disabled",false);
   			fnUpdatePrice();
		},"json");
	}
	else{
		 var dis = parseFloat($("#cart_dis_member").val());
		 $.post(__ctxPath+"/cart/shoppingcart.html?doAction=useCoupon",{couponNo_input_name:$("#couponNo_input_id").val()},function(result){
			 	var cartDiscountAmount = 0;
				if(result.status==1){
					var money=result.data;
					$("#cartDiscountAmount").text((money).toFixed(2));
					cartDiscountAmount = parseFloat($("#cartDiscountAmount").text());
		   			$("#giftCertificateNo").attr("disabled",true);
				}else{
					alert(result.msg);
					cartDiscountAmount = result.data;
					$("#cartDiscountAmount").text("0.00");
					$("#cart_dis_member").val(cartDiscountAmount);
					$("#giftCertificateNo").attr("disabled",false);
				}
	   			fnUpdatePrice();
			},"json");
	 }
}

function fnUpdatePrice(){
	var cartTotal = parseFloat($("#cart_sum_prev").val());
	var cart_dis_member = parseFloat($("#cart_dis_member").text());
	var discount = parseFloat($("#cartDiscountAmount").text());
	var giftTotal = parseFloat($("#giftPay").text());
	var pointTotal = parseFloat($("#shopPointMoney").text());
	var total = parseFloat(cartTotal - cart_dis_member - discount - giftTotal - pointTotal).toFixed(2);
	$("#cart_sum").text(total < 0 ? '0.00' : total);
	if(total < 300){
		$("#selectbasic").attr("disabled",true);
	}else{
		$("#selectbasic").attr("disabled",false);
	}
}

//显示用户绑定的礼品卡
function showGiftList() {
	var giftCertificateNo = $("#giftCertificateNo");
	var giftCertificateNoOffset = giftCertificateNo.offset();
	$("#giftList").css({left:giftCertificateNoOffset.left + "px", top:giftCertificateNoOffset.top + giftCertificateNo.outerHeight() + "px"}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}

function hideTemlateList() {
	$("#giftList").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}

function onBodyDown(event) {
	if (!(event.target.id == "giftList" || $(event.target).parents("#giftList").length>0)) {
		hideTemlateList();
	}
}

function substractQuantity(obj){
    var $this = $(obj);
    var $next = $this.next();
    if(parseInt($next.val()) != 1)
  	  $next.val(parseInt($next.val()) - 1);
}

function addQuantity(obj){
	  var $this = $(obj);
    var $prev = $this.prev();
    $prev.val(parseInt($prev.val()) + 1);
}

//积分使用
function fnSelectChangeGift(selectPoint){
	var shopPointUseGiftPercent="${appConfig.shopPointUseGiftPercent}";
	var pointDis = (shopPointUseGiftPercent*selectPoint).toFixed(2);
		$("#shopPointMoney").text(pointDis);
		fnUpdatePrice();
		$.post(__ctxPath+"/checkout/paymentProcess.html?doAction=doUseShopPoint",{selectPoint:selectPoint},function(result){
		},"json");
		
}