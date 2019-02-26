<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/magenda.css">
<title>商品一覧</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="contents">
		<h1>商品一覧画面</h1>
		<s:if test="!#session.keywordsErrorMessageList.isEmpty()">
			<div class="error">
				<div class="error-message">
					<s:iterator value="#session.keywordsErrorMessageList">
						<s:property />
						<br>
					</s:iterator>
				</div>
			</div>
		</s:if>
		<s:elseif test="productInfoDTOList==null">
			<div class="nomal">
				検索結果がありません。
			</div>
		</s:elseif>
		<s:else>
			<div id="product-list">
				<s:iterator value="#session.productInfoDTOList">
					<div class="product-list-box">
						<ul>
							<li><a
								href='<s:url action="ProductDetailsAction">
								<s:param name="productId" value="%{productId}"/>
								</s:url>'
								class="image-link"> <img
									src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'
									class="item-image-box-200" /></a><br>
								<div class="div-item">
									<s:property value="productName" />
									<br>
									<s:property value="productNameKana" />
									<br>
									<s:property value="price" />
									円<br>
								</div></li>
						</ul>
					</div>
				</s:iterator>
			</div>
		</s:else>
	</div>
</body>
</html>