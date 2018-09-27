<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <c:url value="/" var="contextPath" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="icon" href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979" type="image/ico" />
    <link href="https://plus.googlecom/108540024862647200608" rel="publisher" />

    <title>Books of Java, C# and more! Book Store</title>

    <link href="${contextPath}resources/css/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' />
    <link href="${contextPath}resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/fontello.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/guia-do-programador-style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${contextPath}resources/css/produtos.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="canonical" href="http://www.bookstore.com/" />
</head>
<body>

<header id="layout-header">
    <div class="clearfix container">
        <a href="/" id="logo"> </a>
        <div id="header-content">
            <nav id="main-nav">
                <ul class="clearfix">
                    <li><a href="/cart" rel="nofollow">Cart</a></li>
                    <li><a href="/pages/about-us" rel="nofollow">About Us</a></li>
                    <li><a href="/pages/faq" rel="nofollow">FAQ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<nav class="categories-nav">
    <ul class="container">
        <li class="category"><a href="http://www.bookstore.com">Home</a></li>
        <li class="category"><a href="/collections/agile-books-de-agile"> Agile </a></li>
        <li class="category"><a href="/collections/front-end-books"> Front-End </a></li>
        <li class="category"><a href="/collections/games-books"> Games </a></li>
        <li class="category"><a href="/collections/java-books"> Java </a></li>
        <li class="category"><a href="/collections/c-sharp-books"> C# </a></li>
        <li class="category"><a href="/collections/mobile-books"> Mobile </a></li>
        <li class="category"><a href="/collections/others"> Others </a></li>
    </ul>
</nav>

<article id="livro-css-eficiente">
    <header id="product-highlight" class="clearfix">
        <div id="product-overview" class="container">
            <img width="280px" height="395px" src="https://ibf.org/site_assets/img/placeholder-book-cover-default.png"
                 class="product-featured-image" />
            <h1 class="product-title">${product.title }</h1>
            <p class="product-author">
                <span class="product-author-link"> </span>
            </p>
            <p class="book-description">${product.description}</p>
        </div>
    </header>

    <section class="buy-options clearfix">
        <form action="/carrinho/add" method="post" class="container">
            <input type="hidden" value="${product.id }" name="productId" >
            <ul id="variants" class="clearfix">
                <c:forEach items="${product.prices }" var="prices">
                    <li class="buy-option">
                        <input type="radio" name="priceType" class="variant-radio" id="priceType" value="${prices.type }" checked="checked" />
                        <label class="variant-label" >${prices.type }</label>
                        <small class="compare-at-price">R$ 39,90</small>
                        <p class="variant-price">${prices.value }</p>
                    </li>
                </c:forEach>
            </ul>
            <button type="submit" class="submit-image icon-basket-alt" title="Compre Agora ${product.title }"></button>
        </form>
    </section>

    <div class="container">
        <section class="summary">
            <ul>
                <li>
                    <h3>E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.</h3>
                </li>
            </ul>
        </section>

        <section class="data product-detail">
            <h2 class="section-title">Dados do livro:</h2>
            <p> Número de páginas: <span>${product.pages}</span></p>
            <p>Data de publicação: <span class="publishedAt"><fmt:formatDate pattern="dd/MM/yyy" value="${product.releaseDate.time}"></fmt:formatDate></span></p>
            </p>
        </section>
    </div>
</article>

<footer id="layout-footer">
    <p class="footer-title">Receba as Novidades e Lançamentos</p>
    <div id="form-newsletter">
        <form action="" method="POST" id="ss-form" class="form-newsletter">
            <ul>
                <input type="hidden" name="pageNumber" value="0" />
                <input type="hidden" name="backupCache" value="" />
                <input type="email" name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com" />
                <input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter" />
            </ul>
        </form>
        <ul>
            <li class="ie8"><a href="" rel="nofollow">Receba as Novidades e Lançamentos</a></li>
        </ul>
    </div>
</footer>
</body>
</html>