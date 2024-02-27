<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.design_shinbi.shindan.model.Shindan" %>
<%@ page import="com.design_shinbi.shindan.model.Question" %>
<%@ page import="com.design_shinbi.shindan.model.Item" %>

<%
    String message = (String)request.getAttribute("message");
    Shindan shindan = (Shindan)request.getAttribute("shindan");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>隠れ血液型診断</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
    
        <h1>隠れ血液型診断</h1>
        <div class ="topimage">
    <img alt="" src="images/blooodtype.png">
    </div>
        <div class = "guide">
        <p>隠れ血液型診断へようこそ。血液型は赤ちゃんの時に調べると変わる可能性があるそうです。<br>
        もしかしたら、あなたの血液型は間違っているかも‼
        </p>
        </div>
        <img alt="" src="images/cloud (1).png">
<%
    if(message != null) {
%>
        <div id="error"><%= message %></div>
<%
    }
%>
	<div class = "name">
        <form method="post" action="result">
            <h3>あなたのお名前は?</h3>
            <input type="text" name="name">
            
    </div>
<%
    for(Question question : shindan.getQuestions()) {
%>
            <h3><%= question.getQuestion() %></h3><!--クイズ問題を取得 -->
            <div>
<%
        String option = "checked";
        for(Item item : question.getItems()) {

%>
            <div>
                <input type="radio"
                       name="<%= question.getKey() %>"
                       value="<%= item.getId() %>"
                       <%= option %>
                >
                <%= item.getText() %>
            </div>
<%
            option = "";
        }
%>
            </div>
<%
    }
%>
            <div id="buttons">
                <input type="submit" value="診断する">
            </div>
        </form>
    </body>
</html>
