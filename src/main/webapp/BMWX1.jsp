<%@ page import="com.carkharido_user.Dbcon"%>
<%@ page import="com.carkharido.dao.CarsDao"%>
<%@ page import="com.carkharido.model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
</head>
<body>
  <div class="container">
    <div class="product-image">
      <img src="CARS/b1.jpg" alt="Product Image">
    </div>
    <div class="product-details">
      <h1><%= c.getName() %></h1>
      <p class="price">$<%= car.getPrice() %></p>
      <p>Description of the product goes here. This can be a brief overview of the product features, specifications, etc.</p>
      <div class="actions">
        <a href="add-to-cart?Car_id=<%= car.getCar_id() %>"
							class="btn btn-primary">Add to list</a>
							<a href="#"
							class="btn btn-primary">Book Now</a>
      </div>
    </div>
  </div>

  <div id="specification" data-id="Key Specifications of <%= car.getName() %>" class="toggleAccordion specsFeaturesBlock">
    <h2>Key Specifications of <%= car.getName() %></h2>
    <div class="featuresIocnsSec gsco_content first">
      <table class="keyfeature">
        <tbody>
          <!-- Specification details here -->
        </tbody>
      </table>
    </div>
  </div>

  <h2>Key Features of <%= car.getName() %></h2>
  <div class="featuresIocnsSec gsco_content first">
    <table class="keyfeature">
      <tbody>
        <!-- Key features here -->
      </tbody>
    </table>
  </div>

  <h2><%= car.getName() %> Specifications</h2>
  <div class="featuresIocnsSec gsco_content first">
    <table class="keyfeature">
      <tbody>
        <!-- More specification details here -->
      </tbody>
    </table>
  </div>
</body>
</html>
