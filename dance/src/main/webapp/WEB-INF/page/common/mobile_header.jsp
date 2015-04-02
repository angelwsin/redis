<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link href="${root}/public/mobile/css/style.css" rel="stylesheet" type="text/css" />
<x:js path="jquery" defaultDir="false" />
<x:js path="layer: jquery-util.js: jquery-validator: zepto" />
<script src="${root}/public/js/appbanner.js" type="text/javascript"></script>
<x:script>
	<script type="text/javascript">
		function searchForm() {
			var size = ${page.size};
			var dataSize = ${page.total};
			var pageSize = size + 10;
			var url = window.location.pathname;
			var params = window.location.search;
			if (params) {
				params = params.substr(1).replace(/(&|^)page\.(current|size)=\d*/g, "");
			}
			if (params) {
				url = url + "?" + params;
			}
			pageSize = parseInt(pageSize, 10) || 10;
			url = url + (params ? '&' : '?') + 'page.current=1&page.size=' + (pageSize <= dataSize ? pageSize : dataSize);
			location.href = url;
		}
	</script>
</x:script>
</head>
<body>