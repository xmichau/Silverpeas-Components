<%--

    Copyright (C) 2000 - 2013 Silverpeas

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    As a special exception to the terms and conditions of version 3.0 of
    the GPL, you may redistribute this Program in connection with Free/Libre
    Open Source Software ("FLOSS") applications as described in Silverpeas's
    FLOSS exception.  You should have received a copy of the text describing
    the FLOSS exception, and it is also available here:
    "http://www.silverpeas.org/docs/core/legal/floss_exception.html"

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.silverpeas.com/tld/viewGenerator" prefix="view" %>

<%@ page import="com.silverpeas.importExport.report.ExportReport" %>
<%@ page import="com.stratelia.webactiv.util.DateUtil" %>
<%@ page import="com.stratelia.webactiv.util.FileRepositoryManager" %>

<%
  ExportReport report = (ExportReport) request.getAttribute("ExportReport");
%>
<c:set var="report" value="${requestScope.ExportReport}" />
<fmt:setLocale value="${sessionScope[sessionController].language}"/>
<view:setBundle bundle="${requestScope.resources.multilangBundle}"/>
<fmt:message var="browseBarExport" key="GML.export.result"/>
<fmt:message var="closeButton" key="GML.close"/>
<c:choose>
  <c:when test="${ExportReport.error != null}">
    <c:forEach var="element" items="${ExportReport.error.stackTrace}" >
      <c:out value="${element}"  /> <br/>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <table>
    	<tr>
        <td class="txtlibform"><fmt:message key="GML.export.file"/> :</td>
        <td><a href="${ExportReport.zipFilePath}">${ExportReport.zipFileName}</a>
        <a href="${ExportReport.zipFilePath}"><img src="<%=FileRepositoryManager.getFileIcon("zip")%>" border="0" align="absmiddle" alt="${ExportReport.zipFileName}"/></a></td>
      </tr>
      <tr>
        <td class="txtlibform"><fmt:message key="GML.export.fileSize"/> :</td>
        <td><%=FileRepositoryManager.formatFileSize(report.getZipFileSize())%></td>
      </tr>
      <tr>
        <td class="txtlibform"><fmt:message key="GML.export.duration"/> :</td>
        <td><%=DateUtil.formatDuration(report.getDuration())%></td>
      </tr>
    </table>
  </c:otherwise>
</c:choose>
