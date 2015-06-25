<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ 
	taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@ 
	taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%><%@ 
	attribute name="ad"	type="com.cartmatic.estore.common.model.content.Advertisement"%>
<c:choose>
	<%-- video 视频 --%>
	<c:when test="${ad.contentType==3}">
		  <!-- Chang URLs to wherever Video.js files will be hosted -->
		  <link href="${ctxPath }/js/video/video-js.css" rel="stylesheet" type="text/css">
		  <!-- video.js must be in the <head> for older IEs to work. -->
		  <script src="${ctxPath }/js/video/video.js"></script>
		
		  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
		  <script>
		    videojs.options.flash.swf = "${ctxPath }/js/video/video-js.swf";
		  </script>
		  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="${ad.adPositionType.width}" height="${ad.adPositionType.height}"
		      poster="http://video-js.zencoder.com/oceans-clip.png"
		      data-setup="{}">
		    <source src="${mediaPath}a_and_d/${ad.url }" type='video/mp4' />
		    <source src="${mediaPath}a_and_d/${ad.url }" type='video/webm' />
		    <source src="${mediaPath}a_and_d/${ad.url }" type='video/ogg' />
		    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
		    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
		  </video>
	</c:when>
	<%-- swf Flash --%>
	<c:when test="${ad.contentType==2}">
		<OBJECT height="${ad.adPositionType.height}" width="${ad.adPositionType.width}" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
		<PARAM NAME="_cx" VALUE="14552">
		<PARAM NAME="_cy" VALUE="2381">
		<PARAM NAME="FlashVars" VALUE="">
		<PARAM NAME="Movie" VALUE="${mediaPath}${ad.url}">
		<PARAM NAME="Src" VALUE="${mediaPath}${ad.url}">
		<PARAM NAME="WMode" VALUE="transparent">
		<PARAM NAME="Play" VALUE="-1">
		<PARAM NAME="Loop" VALUE="-1">
		<PARAM NAME="Quality" VALUE="High">
		<PARAM NAME="SAlign" VALUE="">
		<PARAM NAME="Menu" VALUE="-1">
		<PARAM NAME="Base" VALUE="">
		<PARAM NAME="AllowScriptAccess" VALUE="">
		<PARAM NAME="Scale" VALUE="ShowAll">
		<PARAM NAME="DeviceFont" VALUE="0">
		<PARAM NAME="EmbedMovie" VALUE="0">
		<PARAM NAME="BGColor" VALUE="">
		<PARAM NAME="SWRemote" VALUE="">
		<PARAM NAME="MovieData" VALUE="">
		<PARAM NAME="SeamlessTabbing" VALUE="1">
		<PARAM NAME="Profile" VALUE="0">
		<PARAM NAME="ProfileAddress" VALUE="">
		<PARAM NAME="ProfilePort" VALUE="0">
		<param name="wmode" value="transparent" />
		<EMBED src="${mediaPath}${ad.url}" WIDTH="${ad.adPositionType.width}"
			HEIGHT="${ad.adPositionType.height}" TYPE="application/x-shockwave-flash"
			wmode="transparent"
			PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
		</EMBED>
		</OBJECT>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${not empty ad.redirectUrl}">
				<a href="${fn:indexOf(fn:toLowerCase(ad.redirectUrl),"http://")==0?'':ctxPath}${ad.redirectUrl}">
					<cartmatic:img url="${ad.url}" mediaType="a_and_d" width="${ad.adPositionType.width}" height="${ad.adPositionType.height}" alt="${ad.advertisementDetail}"></cartmatic:img>
				</a>
			</c:when>
			<c:otherwise>
				<cartmatic:img url="${ad.url}" mediaType="a_and_d" width="${ad.adPositionType.width}" height="${ad.adPositionType.height}" alt="${ad.advertisementDetail}"></cartmatic:img>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>