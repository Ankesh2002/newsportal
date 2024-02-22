<?php
session_start();
include('includes/config.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>News Portal | Home Page</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
  <!--<link href="css/fonts.css" rel="stylesheet">-->

  <link href="css/style.css" rel="stylesheet">
  <link href="css/smartbanner.min.css" rel="stylesheet">
  <link href="css/responsive.css" rel="stylesheet">
  <link href="css/mcustom-scrollbar.css" rel="stylesheet">



</head>

<body>

  <!-- Navigation -->
  <?php include('includes/header.php'); ?>

  <!-- Page Content -->


  <div class="container">
    <div class="container">
      <div class="topStory" style="margin-top: 5%;">
        <div class="row">
          <div class="col-md-8">
            <div class="topStorySlider">
              <div class="region region-top-stories-slider">
                <div id="block-views-73a289f812dc0f041ad645e499454b9f" class="block block-views">
                  <div class="content">
                    <ul class="owl-carousel owl-theme cf owl-loaded owl-drag">

                      <div class="row">
                        <div class="col-md-12">

                          <?php

                          // Fetch images and videos from database
                          $sql = "SELECT PostImage, PostTitle,PostDetails  FROM tblposts";
                          $result = $con->query($sql);

                          ?>



                          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 6%">
                            <ol class="carousel-indicators">
                              <?php
                              $i = 0;
                              while ($row = $result->fetch_assoc()) {
                                echo '<li data-target="#carouselExampleIndicators" data-slide-to="' . $i . '"';
                                if ($i == 0) {
                                  echo ' class="active"';
                                }
                                echo '></li>';
                                $i++;
                              }
                              ?>
                            </ol>
                            <div class="carousel-inner">
                              <?php
                              $j = 0;
                              $result->data_seek(0);
                              while ($row = $result->fetch_assoc()) {
                                echo '<div class="carousel-item';
                                if ($j == 0) {
                                  echo ' active';
                                }
                                echo '">';

                                $extension = pathinfo($row['PostImage'], PATHINFO_EXTENSION);
                                $mimeTypes = [
                                  'image' => ['jpg', 'jpeg', 'png', 'gif', 'svg'],
                                  'video' => ['mp4', 'webm', 'ogg'], // Add more supported video extensions as needed
                                ];

                                // Check file type
                                if (in_array($extension, $mimeTypes['image'])) {
                                  echo '<img class="d-block w-100 " src="admin/postimages/' . htmlentities($row['PostImage']) . '" alt="Image Slide">';
                                  echo '<div class="carousel-caption d-none d-md-block">';

                                  echo '<h5>' . $row["PostTitle"] . '</h5>';

                                  echo '</div>';
                                } elseif (in_array($extension, $mimeTypes['video'])) {
                                  echo '<video class="d-block w-100 " controls>';
                                  echo '<source src="admin/postimages/' . htmlentities($row['PostImage']) . '">';
                                  echo 'Your browser does not support the video tag.';
                                  echo '</video>';
                                  echo '<div class="carousel-caption d-none d-md-block">';

                                  echo '<h5>' . $row["PostTitle"] . '</h5>';

                                  echo '</div>';
                                }
                                echo '</div>';
                                $j++;
                              }
                              ?>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                              <span class="carousel-control-next-icon" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                          </div>
                        </div>
                      </div>
                    </ul>
                  </div>
                </div>
              </div>

            </div>
            <div class="region region-top-stories-4-items">
              <div id="block-views-3c17495cba9d98131bbd10c33ffd93e8" class="block block-views">
                <div class="content">
                <ul class="newsThumNew cf top-main-list">
                        <?php
                        // Array of supported image extensions
                        $imageExtensions = array("jpg", "jpeg", "png", "gif", "svg");

                        // Array of supported video extensions
                        $videoExtensions = array("mp4", "webm", "ogg"); // Add more supported video extensions as needed

                        $sql = "SELECT tblposts.id AS pid, tblposts.PostTitle AS posttitle, tblposts.PostImage, tblcategory.CategoryName AS category, tblcategory.id AS cid, tblsubcategory.Subcategory AS subcategory, tblposts.PostDetails AS postdetails, tblposts.PostingDate AS postingdate, tblposts.PostUrl AS url FROM tblposts LEFT JOIN tblcategory ON tblcategory.id=tblposts.CategoryId LEFT JOIN tblsubcategory ON tblsubcategory.SubCategoryId=tblposts.SubCategoryId WHERE tblposts.Is_Active=1 ORDER BY tblposts.id DESC";
                        $result = $con->query($sql);

                        if ($result->num_rows >= 0) {
                          // Step 3: Iterate through the result set and display the data
                          while ($row = $result->fetch_assoc()) {
                            echo '<li class="hidden-xs">';
                            echo '<div class="newsThumLi">';
                            echo '<a class="newsThumPic" href="news-details.php?nid=' . htmlentities($row['pid']) . '" title="' . $row["posttitle"] . '">';

                            // Determine if the content is an image or video based on the file extension
                            $extension = pathinfo($row["PostImage"], PATHINFO_EXTENSION);
                            if (in_array(strtolower($extension), $imageExtensions)) {
                              // If it's an image, display the image
                              echo '<img src="admin/postimages/' . $row["PostImage"] . '" data-src="admin/postimages/' . $row["PostImage"] . '" class="lazyloaded" lazyload="auto" alt="' . $row["posttitle"] . '" title="' . $row["posttitle"] . '">';
                            } elseif (in_array(strtolower($extension), $videoExtensions)) {
                              // If it's a video, display the video
                              echo '<video  class="lazyloaded" lazyload="auto" width="120" height="60">';
                              echo '<source src="admin/postimages/' . $row["PostImage"] . '" type="video/mp4">';
                              echo 'Your browser does not support the video tag.';
                              echo '</video>';
                            } else {
                              // Handle unsupported files gracefully
                              echo '<div class="unsupported-file">Unsupported file format: ' . $extension . '</div>';
                            }

                            echo '</a>';
                            echo '<h3 class="newsThumNewText">';
                            echo '<a href="news-details.php?nid=' . htmlentities($row['pid']) . '" class="categoryLink" title="' . $row["category"] . '">' . $row["category"] . ' / </a>';
                            echo '<a href="news-details.php?nid=' . htmlentities($row['pid']) . '" title="' . $row["posttitle"] . '">' . $row["posttitle"] . '</a>';
                            echo '</h3>';
                            echo '<div class="shareNewBox">';
                            echo '<span>⋮</span>';
                            echo '<ul class="cf">';
                            echo '<li><a class="wappIcon" onclick="if (!window.__cfRLUnblockHandlers) return true; return socialsharelist(\'whatsapp\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://api.whatsapp.com/send?text=' . urlencode($row['posttitle'] . ' - Read more http://mijajnews.com//news-details.php?nid=' . $row['pid'] . '\n\n' . $row['PostImage']) . '" title="WhatsApp"></a></li>';
                            echo '<li><a class="fbIcon" onclick="if (!window.__cfRLUnblockHandlers) return true; return socialsharelist(\'facebook\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://www.facebook.com/sharer.php?u=' . urlencode('https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '" title="Facebook"></a></li>';
                            echo '<li><a class="twIcon" onclick="if (!window.__cfRLUnblockHandlers) return true; return socialsharelist(\'twitter\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://twitter.com/share?url=' . urlencode('https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '&text=' . urlencode($row['posttitle'] . ' - Read more at https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '" title="Twitter"></a></li>';
                            echo '</ul>';
                            echo '</div>';
                            echo '</div>';
                            echo '</li>';
                          }
                        } else {
                          echo "0 results";
                        }
                        ?>
                      </ul>

                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">


            <div class="top-side-info" style="margin-bottom:7%;">
              
              <div class="top-side-ads">
                <div class="adsSection">

                  <div id="div-gpt-ad-1674562848410-0" class="ad-desktop-visible"></div>
                  <div id="div-gpt-ad-1674562479950-0" class="ad-mobile-visible"></div>


                </div>
              </div>
            </div>


            <div class="top-side-news">
              <p></p>
              <div class="listNewsTwo">
                <div class="region region-top-stories">
                  <div id="block-views-a0063eddd5aebcceb0904a4de6447818" class="block block-views">
                    <div class="content">
                      <ul class="newsThumNew cf">
                        <?php
                        // Array of supported image extensions
                        $imageExtensions = array("jpg", "jpeg", "png", "gif", "svg");

                        // Array of supported video extensions
                        $videoExtensions = array("mp4", "webm", "ogg"); // Add more supported video extensions as needed

                        $sql = "SELECT tblposts.id AS pid, tblposts.PostTitle AS posttitle, tblposts.PostImage, tblcategory.CategoryName AS category, tblcategory.id AS cid, tblsubcategory.Subcategory AS subcategory, tblposts.PostDetails AS postdetails, tblposts.PostingDate AS postingdate, tblposts.PostUrl AS url FROM tblposts LEFT JOIN tblcategory ON tblcategory.id=tblposts.CategoryId LEFT JOIN tblsubcategory ON tblsubcategory.SubCategoryId=tblposts.SubCategoryId WHERE tblposts.Is_Active=1 ORDER BY tblposts.id DESC";
                        $result = $con->query($sql);

                        if ($result->num_rows >= 0) {
                          // Step 3: Iterate through the result set and display the data
                          while ($row = $result->fetch_assoc()) {
                            echo '<li class="hidden-xs">';
                            echo '<div class="newsThumLi">';
                            echo '<a class="newsThumPic" href="news-details.php?nid=' . htmlentities($row['pid']) . '" title="' . $row["posttitle"] . '">';

                            // Determine if the content is an image or video based on the file extension
                            $extension = pathinfo($row["PostImage"], PATHINFO_EXTENSION);
                            if (in_array(strtolower($extension), $imageExtensions)) {
                              // If it's an image, display the image
                              echo '<img src="admin/postimages/' . $row["PostImage"] . '" data-src="admin/postimages/' . $row["PostImage"] . '" class="lazyloaded" lazyload="auto" alt="' . $row["posttitle"] . '" title="' . $row["posttitle"] . '">';
                            } elseif (in_array(strtolower($extension), $videoExtensions)) {
                              // If it's a video, display the video
                              echo '<video  class="lazyloaded" lazyload="auto" width="120" height="60">';
                              echo '<source src="admin/postimages/' . $row["PostImage"] . '" type="video/mp4">';
                              echo 'Your browser does not support the video tag.';
                              echo '</video>';
                            } else {
                              // Handle unsupported files gracefully
                              echo '<div class="unsupported-file">Unsupported file format: ' . $extension . '</div>';
                            }

                            echo '</a>';
                            echo '<h3 class="newsThumNewText">';
                            echo '<a href="news-details.php?nid=' . htmlentities($row['pid']) . '" class="categoryLink" title="' . $row["category"] . '">' . $row["category"] . ' / </a>';
                            echo '<a href="news-details.php?nid=' . htmlentities($row['pid']) . '" title="' . $row["posttitle"] . '">' . $row["posttitle"] . '</a>';
                            echo '</h3>';
                            echo '<div class="shareNewBox">';
                            echo '<span>⋮</span>';
                            echo '<ul class="cf">';
                            echo '<li><a class="wappIcon" onclick="if (!window.__cfRLUnblockHandlers) return false; return socialsharelist(\'whatsapp\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://api.whatsapp.com/send?text=' . urlencode($row['posttitle'] . ' - Read more at https://http://mijajnews.com//news-details.php?nid=' . $row['pid'] . '\n\n' . $row['PostImage']) . '" title="WhatsApp"></a></li>';
                            echo '<li><a class="fbIcon" onclick="if (!window.__cfRLUnblockHandlers) return false; return socialsharelist(\'facebook\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://www.facebook.com/sharer.php?u=' . urlencode('https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '" title="Facebook"></a></li>';
                            echo '<li><a class="twIcon" onclick="if (!window.__cfRLUnblockHandlers) return false; return socialsharelist(\'twitter\',\'' . urlencode('https://mijajnews.com//news-details.php?nid=' . $row['pid']) . '\');" target="_blank" href="https://twitter.com/share?url=' . urlencode('https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '&text=' . urlencode($row['posttitle'] . ' - Read more at https://http://mijajnews.com//news-details.php?nid=' . $row['pid']) . '" title="Twitter"></a></li>';
                            echo '</ul>';
                            echo '</div>';
                            echo '</div>';
                            echo '</li>';
                          }
                        } else {
                          echo "0 results";
                        }
                        ?>
                      </ul>


                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>

  <div class="container">
    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <!-- Blog Post -->
        <?php
        if (isset($_GET['pageno'])) {
          $pageno = $_GET['pageno'];
        } else {
          $pageno = 1;
        }
        $no_of_records_per_page = 8;
        $offset = ($pageno - 1) * $no_of_records_per_page;


        $total_pages_sql = "SELECT COUNT(*) FROM tblposts";
        $result = mysqli_query($con, $total_pages_sql);
        $total_rows = mysqli_fetch_array($result)[0];
        $total_pages = ceil($total_rows / $no_of_records_per_page);


        $query = mysqli_query($con, "select tblposts.id as pid,tblposts.PostTitle as posttitle,tblposts.PostImage,tblcategory.CategoryName as category,tblcategory.id as cid,tblsubcategory.Subcategory as subcategory,tblposts.PostDetails as postdetails,tblposts.PostingDate as postingdate,tblposts.PostUrl as url from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId where tblposts.Is_Active=1 order by tblposts.id desc  LIMIT $offset, $no_of_records_per_page");
        while ($row = mysqli_fetch_array($query)) {
        ?>

          <div class="card mb-">
            <?php
            $extension = pathinfo($row['PostImage'], PATHINFO_EXTENSION);
            $mimeTypes = [
              'image' => ['jpg', 'jpeg', 'png', 'gif', 'svg'],
              'video' => ['mp4', 'webm', 'ogg'], // Add more supported video extensions as needed
            ];

            if (in_array($extension, $mimeTypes['image'])) {
              // Display image with alt text
              echo '<img src="admin/postimages/' . htmlentities($row['PostImage']) . '" class="card-img-top" alt="' . htmlentities($row['posttitle']) . '">';
            } elseif (in_array($extension, $mimeTypes['video'])) {
              // Display video with controls
              echo '<video controls src="admin/postimages/' . htmlentities($row['PostImage']) . '" class="card-img-top"></video>';
            } else {
              // Handle unsupported files gracefully
              echo '<div class="card mb-4 unsupported-file">Unsupported file format: ' . $extension . '</div>';
            }
            ?>
            <div class="card-body">

              <h2 class="card-title"> <strong><?php echo htmlentities($row['posttitle']); ?> </strong></h2>

              <p><!--category-->
                <a class="badge bg-secondary text-decoration-none link-light" href="category.php?catid=<?php echo htmlentities($row['cid']) ?>" style="color:#fff"><?php echo htmlentities($row['category']); ?></a>
                <!--Subcategory--->
                <a class="badge bg-secondary text-decoration-none link-light" style="color:#fff"><?php echo htmlentities($row['subcategory']); ?></a>
              </p>


              <a href="news-details.php?nid=<?php echo htmlentities($row['pid']) ?>" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <?php
// URL encode the parameters once
$encoded_url = urlencode('https://mijajnews.com/news-details.php?nid=' . $pid);
$post_title = urlencode($row['posttitle']);
$share_url = 'https://mijajnews.com/news-details.php?nid=' . $pid;

// HTML markup stored in variables
$div_open = '<div class="shareNewBox">';
$span = '<span>⋮</span>';
$ul_open = '<ul class="cf">';
$li_whatsapp = '<li><a class="wappIcon" onclick="redirectTo(\'https://api.whatsapp.com/send?text=' . $post_title . ' - Read more at ' . $share_url . '\n\n' . $row['PostImage'] . '\');" title="WhatsApp"></a></li>';
$li_facebook = '<li><a class="fbIcon" onclick="redirectTo(\'https://www.facebook.com/sharer.php?u=' . $encoded_url . '\');" title="Facebook"></a></li>';
$li_twitter = '<li><a class="twIcon" onclick="redirectTo(\'https://twitter.com/share?url=' . $encoded_url . '&text=' . $post_title . ' - Read more at ' . $share_url . '\');" title="Twitter"></a></li>';
$ul_close = '</ul>';
$div_close = '</div>';

// JavaScript function for redirection
$redirect_script = '<script>
    function redirectTo(url) {
        window.open(url, "_blank");
    }
</script>';

// Output
echo $div_open;
echo $span;
echo $ul_open;
echo $li_whatsapp;
echo $li_facebook;
echo $li_twitter;
echo $ul_close;
echo $div_close;
echo $redirect_script;
?>

            <div class="card-footer text-muted">
              Posted on <?php echo htmlentities($row['postingdate']); ?>

            </div>
          </div>
        <?php } ?>




        <!-- Pagination -->


        <ul class="pagination justify-content-center mb-4">
          <li class="page-item"><a href="?pageno=1" class="page-link">First</a></li>
          <li class="<?php if ($pageno <= 1) {
                        echo 'disabled';
                      } ?> page-item">
            <a href="<?php if ($pageno <= 1) {
                        echo '#';
                      } else {
                        echo "?pageno=" . ($pageno - 1);
                      } ?>" class="page-link">Prev</a>
          </li>
          <li class="<?php if ($pageno >= $total_pages) {
                        echo 'disabled';
                      } ?> page-item">
            <a href="<?php if ($pageno >= $total_pages) {
                        echo '#';
                      } else {
                        echo "?pageno=" . ($pageno + 1);
                      } ?> " class="page-link">Next</a>
          </li>
          <li class="page-item"><a href="?pageno=<?php echo $total_pages; ?>" class="page-link">Last</a></li>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <?php include('includes/footer.php'); ?>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script>
    function socialsharelist(platform, url) {
        // Add your social media share functionality here
        // This function should be defined before it's being called
        switch (platform) {
            case 'whatsapp':
                window.open('https://api.whatsapp.com/send?text=' + encodeURIComponent(url), '_blank');
                break;
            case 'facebook':
                window.open('https://www.facebook.com/sharer.php?u=' + encodeURIComponent(url), '_blank');
                break;
            case 'twitter':
                window.open('https://twitter.com/share?url=' + encodeURIComponent(url), '_blank');
                break;
            default:
                console.log('Unsupported platform: ' + platform);
        }
        return false; // Prevent default action
    }
</script>




  </head>
</body>

</html>