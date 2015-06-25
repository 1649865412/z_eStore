<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/catalog"%>
<%@ taglib prefix="content" tagdir="/WEB-INF/tags/content"%>

<div class="top_ss">
        <div class="tp_center">
        	<c:forEach items="${indexMsgList}" var="indexMsg" varStatus="s">
	        	<div class="serv_msg" <c:if test="${s.index == 0 }">style="display:none"</c:if>>
	        		<a href="${indexMsg.url == null ? 'javascript:;;' : indexMsg.url }" target="_blank">${indexMsg.msg }</a>
	            </div>
        	</c:forEach>
        </div>

        <script type="text/javascript">
            $(function() {
                i = 0;
                n = $(".tp_center").children().length;
                time = setInterval("fadeObj()", 5000); //
            });
            function fadeObj() {
                i = i + 1;
                $(".tp_center div").fadeOut(800);
                $(".tp_center div:eq(" + i + ")").fadeIn(800);
                if (i == n - 1) {
                    i = -1;
                }
            }
        </script>

        <div class="tp_fr">
            <a href="http://www.sifangstreet.com" target="_blank">
                <div class="heading">
                    挑选新锐设计师产品-四方街
                    <ul class="drop-down-tp" style="display: none;">
                        <li class="nap-link"><span class="no-js-text">SiFang Street</span></li>
                    </ul>
                </div>
                <div class="tp-icon-cont">
                    <div class="tp-icon">
                        <span class="no-js-text">SiFang</span>
                    </div>
                </div>
            </a>
        </div>

        <script type="text/javascript">
            $(".tp_fr").hover(function(){
                $(".drop-down-tp").toggle();
                $(".tp_fr").toggleClass('is-expanded');
            });
        </script>

    </div>
