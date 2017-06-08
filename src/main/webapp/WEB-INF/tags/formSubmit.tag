<%-- 
    Document   : formSubmit
    Created on : May 2, 2014, 10:18:26 AM
    Author     : bogdan.craciun
--%>

<%@tag description="form submit" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="empty" %>
<%@ attribute name="sourceId" required="true" %>
<%@ attribute name="event" required="true" %>
<%@ attribute name="formId" required="true" %>
<%@ attribute name="beforeSubmit" required="false" %>
<%@ attribute name="divId" required="false" %>
<script type="text/javascript">
    jQuery(document).ready(function()
    {
        jQuery('#${sourceId}').bind('${event}', function(event)
        {
            event.preventDefault();
    <c:if test="${beforeSubmit != null}">${beforeSubmit}</c:if>   
    <c:choose>  
        <c:when test="${divId != null && divId != ''}">
            //$('#' + divId).block({message: '<div style="height:50px">Va rugam asteptati!...</div>'});
        </c:when>
        <c:otherwise>
              //$.blockUI({message: '<div style="height:50px">Va rugam asteptati...</div>'});
        </c:otherwise>
    </c:choose>
        $.blockUI({message: '<div style="height:50px">Va rugam asteptati...</div>'});

                $("#${formId}").submit();
            });
        });
</script>