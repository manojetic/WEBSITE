<!DOCTYPE html>
<%@page import="com.online.Product"%>
<%@page import="com.connection.Helper"%>
<%@page import="com.online.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.connection.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="css/mystyle.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<%@include file="component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%String cat = request.getParameter("category");
//out.println(cat);

ProductDao dao = new ProductDao(ConnectionProvider.getFactory());
List<Product> list = null;

if (cat == null || cat.trim().equals("all")) {
	list = dao.getAllProducts();

} else {

	int cid = Integer.parseInt(cat.trim());
	list = dao.getAllProductsById(cid);

}

CategoryDao cdao = new CategoryDao(ConnectionProvider.getFactory());
List<Category> clist = cdao.getCategories();%>

			<!--show categories-->

			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>
					<%for (Category c : clist) {%>
					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

					<%}%>
				</div>
			</div>





			<!--show products-->
			<div class="col-md-10">
				<!--row-->
				<div class="row mt-4">
					<!--col:12-->
					<div class="col-md-12">
						<div class="card-columns">
							<!--traversing products-->
							<%for (Product p : list) {%>
							<!--product card-->
							<div class="card  product-card " >
								<div class="container text-center">
									<img src="images/products/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="..."/>
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text">
										<%=Helper.get10Words(p.getpDesc())%>
									</p>
								</div>

								<div class="card-footer text-center">
									<button class="btn custom-bg text-white">Add to Cart</button>
									<button class="btn  btn-outline-success ">
										&#8377;<%=Helper.getDis(p.getpPrice(), p.getpDiscount())%>/- <span
											class="text-secondary discount-label"> &#8377; <del> <%=p.getpPrice()%></del>
											, <%=p.getpDiscount()%>% off
										</span>
									</button>

								</div>

							</div>
							<%}

if (list.size() == 0) {
out.println("<h3>No item in this category</h3>");
}%>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>

