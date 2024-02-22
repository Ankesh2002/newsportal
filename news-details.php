<?php 
session_start();
include('includes/config.php');
//Genrating CSRF Token
if (empty($_SESSION['token'])) {
 $_SESSION['token'] = bin2hex(random_bytes(32));
}

if(isset($_POST['submit']))
{
  //Verifying CSRF Token
if (!empty($_POST['csrftoken'])) {
    if (hash_equals($_SESSION['token'], $_POST['csrftoken'])) {
$name=$_POST['name'];
$email=$_POST['email'];
$comment=$_POST['comment'];
$postid=intval($_GET['nid']);
$st1='0';
$query=mysqli_query($con,"insert into tblcomments(postId,name,email,comment,status) values('$postid','$name','$email','$comment','$st1')");
if($query):
  echo "<script>alert('comment successfully submit. Comment will be display after admin review ');</script>";
  unset($_SESSION['token']);
else :
 echo "<script>alert('Something went wrong. Please try again.');</script>";  

endif;

}
}
}
$postid=intval($_GET['nid']);

    $sql = "SELECT viewCounter FROM tblposts WHERE id = '$postid'";
    $result = $con->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $visits = $row["viewCounter"];
            $sql = "UPDATE tblposts SET viewCounter = $visits+1 WHERE id ='$postid'";
    $con->query($sql);

        }
    } else {
        echo "no results";
    }
    


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
    <link href="css/style.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
   <?php include('includes/header.php');?>

    <!-- Page Content -->
    <div class="container">


     
      <div class="row" style="margin-top: 4%">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
  
          <!-- Blog Post -->
<?php
$pid=intval($_GET['nid']);
 $query=mysqli_query($con,"select tblposts.PostTitle as posttitle,tblposts.PostImage,tblcategory.CategoryName as category,tblcategory.id as cid,tblsubcategory.Subcategory as subcategory,tblposts.PostDetails as postdetails,tblposts.PostingDate as postingdate,tblposts.PostUrl as url,tblposts.postedBy,tblposts.lastUpdatedBy,tblposts.UpdationDate from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId where tblposts.id='$pid'");
while ($row=mysqli_fetch_array($query)) {
?>

          <div class="card mb-4">
      
            <div class="card-body">
              <h2 class="card-title"><?php echo htmlentities($row['posttitle']);?></h2>
<!--category-->
 <a class="badge bg-secondary text-decoration-none link-light" href="category.php?catid=<?php echo htmlentities($row['cid'])?>" style="color:#fff"><?php echo htmlentities($row['category']);?></a>
<!--Subcategory--->
  <a class="badge bg-secondary text-decoration-none link-light"  style="color:#fff"><?php echo htmlentities($row['subcategory']);?></a>


<p>
             
          <b>Posted by </b> <?php echo htmlentities($row['postedBy']);?> on </b><?php echo htmlentities($row['postingdate']);?> |
          <?php if($row['lastUpdatedBy']!=''):?>
          <b>Last Updated by </b> <?php echo htmlentities($row['lastUpdatedBy']);?> on </b><?php echo htmlentities($row['UpdationDate']);?></p>
        <?php endif;?>
        

<?php
// URL encode the parameters once
$encoded_url = urlencode('https://mijajnews.com/news-details.php?nid=' . $pid);
$post_title = urlencode($row['posttitle']);
$share_url = 'https://mijajnews.com/news-details.php?nid=' . $pid;

// HTML markup stored in variables
$div_open = '<div class="shareNewBox">';
$span = '<span>⋮</span>';
$ul_open = '<ul class="cf">';
$li_whatsapp = '<li><a class="wappIcon" onclick="redirectTo(\'https://api.whatsapp.com/send?text=' . $post_title . ' - Read more at ' . $share_url . '\n\n' . 'admin/postimages/' . htmlentities($row['PostImage']) . '\');" title="WhatsApp"></a></li>';
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

                            
                <hr />

                <?php
    $extension = pathinfo($row['PostImage'], PATHINFO_EXTENSION);
    $mimeTypes = [
      'image' => ['jpg', 'jpeg', 'png', 'gif', 'svg'],
      'video' => ['mp4', 'webm', 'ogg'], // Add more supported video extensions as needed
    ];

    if (in_array($extension, $mimeTypes['image'])) {
      // Display image with alt text
      echo '<img img-fluid rounded src="admin/postimages/' . htmlentities($row['PostImage']) . '" class="card-img-top" alt="' . htmlentities($row['posttitle']) . '">';
    } elseif (in_array($extension, $mimeTypes['video'])) {
      // Display video with controls
      echo '<video controls src="admin/postimages/' . htmlentities($row['PostImage']) . '" class="card-img-top"></video>';
    } else {
      // Handle unsupported files gracefully
      echo '<div class="card mb-4 unsupported-file">Unsupported file format: ' . $extension . '</div>';
    }
  ?>
  
              <p class="card-text"><?php 
$pt=$row['postdetails'];
              echo  (substr($pt,0));?></p>
             
            </div>
            <div class="card-footer text-muted">
             
           
            </div>
          </div>
<?php } ?>
       

      

     

        </div>

        <!-- Sidebar Widgets Column -->
    
      </div>
      <!-- /.row -->
<!---Comment Section --->

 <div class="row" style="margin-top: -8%">
   <div class="col-md-8">
<div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form name="Comment" method="post">
      <input type="hidden" name="csrftoken" value="<?php echo htmlentities($_SESSION['token']); ?>" />
 <div class="form-group">
<input type="text" name="name" class="form-control" placeholder="Enter your fullname" required>
</div>

 <div class="form-group">
 <input type="email" name="email" class="form-control" placeholder="Enter your Valid email" required>
 </div>


                <div class="form-group">
                  <textarea class="form-control" name="comment" rows="3" placeholder="Comment" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary" name="submit">Submit</button>
              </form>
            </div>
          </div>

  <!---Comment Display Section --->

 <?php 
 $sts=1;
 $query=mysqli_query($con,"select name,comment,postingDate from  tblcomments where postId='$pid' and status='$sts'");
while ($row=mysqli_fetch_array($query)) {
?>
<div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="images/usericon.png" alt="">
            <div class="media-body">
              <h5 class="mt-0"><?php echo htmlentities($row['name']);?> <br />
                  <span style="font-size:11px;"><b>at</b> <?php echo htmlentities($row['postingDate']);?></span>
            </h5>
           
             <?php echo htmlentities($row['comment']);?>            </div>
          </div>
<?php } ?>

        </div>
      </div>
    </div>

  
      <?php include('includes/footer.php');?>


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   

  </body>

</html>
