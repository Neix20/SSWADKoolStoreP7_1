<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
<style>
* {
  box-sizing: border-box;
}

:root {
  --background: #E5FFB3;
  --background-accent: #DBF8A3;
  --background-accent-2: #BDE66E;
  --light: #92DE34;
  --dark: #69BC22;
  --text: #025600;
}

body {
  background-color: #FFFFFF;
  
  background-repeat: no-repeat;
  background-size: 100% 30px;
  background-position: top left, bottom left;
  min-height: 98vh;
}

div {
  display: block;
  width: 400px;
  margin: 0 auto 0 auto;
  position: absolute;
  left: 0;
  right: 0;
  top: 10vh;
}

button {
  display: block;
  cursor: pointer;
  outline: none;
  border: none;
  background-color: #2596be;
  width: 400px;
  height: 70px;
  border-radius: 30px;
  font-size: 1.5rem;
  font-weight: 600;
  color: #2596be;
  background-size: 100% 100%;
  margin-bottom: 15px;
}

input {
  display: block;
  cursor: pointer;
  outline: none;
  border: none;
  background-color: #2596be;
  width: 400px;
  height: 70px;
  border-radius: 30px;
  font-size: 1.5rem;
  font-weight: 600;
  color: #FFFFFF;
  background-size: 100% 100%;
  margin-bottom: 15px;
}

input:hover {
  background-color: #0000FF;
}

button:hover {
  background-color: #2596be;
}

@keyframes background {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 400px 0;
  }
}
</style>
</head>
<body>
<div>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Classic Cars" />
<input type="submit" value="Classic Cars"></input>
</form>
  
  <form action="ProductList" method="GET">
<input type="hidden" name="category" value="Trains" />
<input type="submit" value="Trains"></input>
</form>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Planes" />
<input type="submit" value="Planes"></input>
</form>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Trucks and Buses" />
<input type="submit" value="Trucks and Buses"></input>
</form>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Vintage Cars" />
<input type="submit" value="Vintage Cars"></input>
</form>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Motorcycles" />
<input type="submit" value="Motorcycles"></input>
</form>

<form action="ProductList" method="GET">
<input type="hidden" name="category" value="Ships" />
<input type="submit" value="Ships"></input>
</form>
</div>
</body>
</html>