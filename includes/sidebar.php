
    <!--Section: News of the day-->
    <div class="row">

      <div class="col-sm-10">


        <?php
        $query = mysqli_query($con, "select tblposts.id as pid,tblposts.PostImage,tblposts.PostTitle as posttitle from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId limit 8");
        while ($row = mysqli_fetch_array($query)) {

        ?>

          <div class="bg-image hover-overlay ripple shadow-3-strong rounded-5" data-mdb-ripple-color="light">
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

          </div>
      </div>

      <div class="col-sm-6 mb-0">
        <span class="badge bg-danger px-2 py-1 shadow-1-strong mb-3">News of the day</span>
        <h5><strong><a href="news-details.php?nid=<?php echo htmlentities($row['pid']) ?>"><?php echo htmlentities($row['posttitle']); ?></a></strong></h5>

      <?php } ?>
      </div>
    </div>

    <!--Section: News of the day-->
    

  </div>

  