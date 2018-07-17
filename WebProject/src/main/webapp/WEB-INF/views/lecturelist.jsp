<!Document>

<head>
  <title>Insert title</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="text/html width=device-width, initial-scale=1; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/style01.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="stylej01.css">
</head>

<body>
  <div class="container">
    <form class="form-group" action="/action_page.php">
      <table class="searchform" align='center'>
        <tr>
          <td>
            <select class="form-control">
              <option value="all">전체</option>
              <option value="univ">대학</option>
            </select>
          </td>
          <td><input type="text" class="form-control" placeholder="검색" name="search" size="100%"></td>
          <td>
            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
          </td>
        </tr>
      </table>
    </form>
    <div class="container">
      <table class="table table-striped" id='tablelecture'>
        <thead>
          <tr>
            <th class='width20per'>강의코드</th>
            <th class='width20per'>대학</th>
            <th>강의명</th>
            <th class='width15per'>조회수</th>
            <th class='width15per'>평균점수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${강의코드}</td>
            <td>${좋은대학교}</td>
            <td><a herf='#'>Java 기초</a></td>
            <td>${조회수}</td>
            <td>${총평균점수}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>




</body>
