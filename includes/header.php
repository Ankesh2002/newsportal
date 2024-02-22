  <style>
    .dropdown-toggle:hover {
      background-color: none !important;
      /* Optional hover background color */
    }

    .dropdown-menu { 
      display: none !important;
      /* Hide initially */
    }

    .dropdown:hover .dropdown-menu {
      display: block !important;
      /* Show on hover */
    }

    #nv {

      color:rgb(166 255 252 / 56%) !important;
    }

    #nv:hover {

      color: #ffffff !important;
    }

    #nvd {

      color:#0c1a44 !important; 
      font-weight:bold !important;
    }

    #nvd:hover {

      color:rgb(166 255 252) !important; 
      font-weight:bold !important;
      background-color:#0c1a44 !important;
    }
  </style>

  <nav class="navbar fixed-top navbar-expand-lg navbar-dark  fixed-top " style="background-color:#0c1a44;">
    <div class="container">
      <a class="navbar-brand" href="index.php"><img src="images/logo2.png" height="60"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="index.php">હોમ</a>
          </li>
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="about-us.php">અમારા વિશે</a>
          </li>
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="index.php">ટોપ ન્યુઝ</a>
          </li>
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="index.php">ગુજરાત</a>
          </li>
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="index.php">ભારત</a>
          </li>
          <li class="nav-item" style="font-weight:bold;">
            <a id="nv" class="nav-link" href="index.php">શેરબજાર</a>
          </li>
          <li class="nav-item dropdown" style="font-weight:bold;" >
            <a id="nv" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            અન્ય
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <?php $query = mysqli_query($con, "select id,CategoryName from tblcategory");
              while ($row = mysqli_fetch_array($query)) {
              ?>

                <a id="nvd" class="dropdown-item" href="category.php?catid=<?php echo htmlentities($row['id']) ?>"><?php echo htmlentities($row['CategoryName']); ?></a>
              <?php } ?>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin/">Admin</a>
          </li>
          </li>
          <form class="form-inline" action="search.php" method="post">
      <input class="form-control mr-sm-2" name="searchtitle" type="search" placeholder="અંહિ લખો..." aria-label="Search" style="font-size:12px;">
      <button class="btn btn-outline-success my-3 my-sm-0" type="submit" style="color:#ffffff; border-color:#ffffff; font-size:12px;">Search</button>
    </form>

        </ul>

      </div>

    </div>
    
  </nav>