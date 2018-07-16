<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>
  <title>Insert title</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="text/html width=device-width, initial-scale=1; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/style01.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!--자동완성기능-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <!-- 개인 css-->
  <link rel="stylesheet" href="stylej01.css">
  <script>
    $(function() {
      var availableTags = [
        "서울대학교",
        "고려대학교",
        "연세대학교",
        "건국대학교",
        "홍익대학교"
      ];
      $("#search").autocomplete({
        source: availableTags
      });
    });
  </script>
</head>

<body>
  <div class="container text-center">
    <div class="jumbotron" id="homebox">
      <h1>The Lecture</h1><br>
      <p>동해물과 백두산이 마르고 닳도록</p>
      <form class="form-group" action="/action_page.php">
        <table class="searchform" align='center'>
          <tr>
            <td><select class="form-control">
						<option value="all">전체</option>
						<option value="univ">대학</option>
				</select></td>
            <td><input type="text" class="form-control" placeholder="검색" id="search" size="100%"></td>
            <td><button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</body>
