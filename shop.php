<?php

include('server/connection.php');

 //use the search section
if(isset($_POST['search'])){

        //determine page no.
        if(isset($_GET['page_no']) && $_GET['page_no'] != ""){
          //if user already entered the first page then they select the page no.
          $page_no = $_GET['page_no'];
        }else{
          //if user just entered the page then default page no. is 1
          $page_no = 1;
        }

        
  $category = $_POST['category'];
  $price = $_POST['price'];

        //returns number of products
        $stmt1=$conn->prepare("SELECT COUNT(*) AS total_records FROM products WHERE product_category=? AND product_price<=?");
        $stmt1->bind_param('si',$category,$price);
        $stmt1->execute();
        $stmt1->bind_result($total_records);
        $stmt1->store_result();
        $stmt1->fetch();

        //products per page
        $total_records_per_page = 12;

        $offset = ($page_no-1) * $total_records_per_page;

        $previous_page = $page_no - 1;
        $next_page = $page_no + 1;

        $adjacents = "2";

        $total_no_of_pages = ceil($total_records/$total_records_per_page);
        
        //get all products
        $stmt2 = $conn->prepare("SELECT * FROM products WHERE product_category=? AND product_price<=? LIMIT $offset,$total_records_per_page");
        $stmt2->bind_param("si",$category,$price);
        $stmt2->execute();
        $products = $stmt2->get_result();

  //return all products
}else{
        
       //determine page no.
        if(isset($_GET['page_no']) && $_GET['page_no'] != ""){
          //if user already entered the first page then they select the page no.
          $page_no = $_GET['page_no'];
        }else{
          //if user just entered the page then default page no. is 1
          $page_no = 1;
        }


        //returns no. of products
        $stmt1=$conn->prepare("SELECT COUNT(*) AS total_records FROM products");
        $stmt1->execute();
        $stmt1->bind_result($total_records);
        $stmt1->store_result();
        $stmt1->fetch();


        //products per page
        $total_records_per_page = 12;

        $offset = ($page_no-1) * $total_records_per_page;

        $previous_page = $page_no - 1;
        $next_page = $page_no + 1;

        $adjacents = "2";

        $total_no_of_pages = ceil($total_records/$total_records_per_page);


        //get all products
        $stmt2 = $conn->prepare("SELECT * FROM products LIMIT $offset,$total_records_per_page");
        $stmt2->execute();
        $products = $stmt2->get_result();
}

?>



<?php include('layouts/header.php'); ?> <!--header-->

  <section class="flex-row">
    <!-- Search -->
    <section id="search" class="">
       <div class="container">
        <p>Search Products</p>
        <hr>
       </div>

       <form action="shop.php" method="POST">
        <div class="row mx-auto container mt-5 py-4">
           <div class="col-lg-12 col-md-12 col-sm-12">

           <p>Category</p>
           <div class="form-check">
            <input class="form-check-input" value="shoes" type="radio" name="category" id="category_one" <?php if(isset($category) && $category=='shoes'){echo 'checked';} ?>>
            <label class="form-check-label" for="flexRadioDefault1">Shoes</label>
           </div>

           <div class="form-check">
            <input class="form-check-input" value="tshirts" type="radio" name="category" id="category_two" <?php if(isset($category) && $category=='tshirts'){echo 'checked';} ?>>
            <label class="form-check-label" for="flexRadioDefault2">T-shirts</label>
           </div>

          <div class="form-check">
            <input class="form-check-input" value ="jackets" type="radio" name="category" id="category_two" <?php if(isset($category) && $category=='jackets'){echo 'checked';} ?>>
            <label class="form-check-label" for="flexRadioDefault2">Jackets</label>
           </div>

           <div class="form-check">
            <input class="form-check-input" value="watches" type="radio" name="category" id="category_two" <?php if(isset($category) && $category=='watches'){echo 'checked';} ?>>
            <label class="form-check-label" for="flexRadioDefault2">Watches</label>
           </div>

           <div class="form-check">
            <input class="form-check-input" value="fashion" type="radio" name="category" id="category_two" <?php if(isset($category) && $category=='fashion'){echo 'checked';} ?>>
            <label class="form-check-label" for="flexRadioDefault2">Fashion</label>
           </div>
         </div>
        </div>

        <div class="row mx-auto container my-0 pt-0 pb-2">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <p>Price</p>
            <input type="range" class="form-range w-50" name="price" value="<?php if(isset($price)){echo $price;}else{echo "1000";} ?>" min="1" max="10000" id="customRange2">
            <div class="w-50">
              <span style="float: left;">1</span>
              <span style="float: right;">10000</span>
            </div>
          </div>
        </div>

        <div class="form-group">
           <input type="submit" name="search" value="Search" class="btn btn-primary">
        </div>

       </form>
    </section>

    <!--Shop-->
    <section id="shop">
      <div class="container">
        <h3>Our Products</h3>
        <hr class="" />
        <p>Here you can check our products</p>
      </div>
      <div class="row mx-auto container pt-4 pb-4">
        
  <?php while($row = $products->fetch_assoc()) { ?>

        <div
          onclick="window.location.href='single_product.php';"
          class="product text-center col-lg-3 col-md-4 col-sm-12"
        >
          <img class="img-fluid mb-3" src="assets/imgs/<?php echo $row['product_image']; ?>"/>
          <div class="star">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
          </div>
          <h5 class="p-name"><?php echo $row['product_name']; ?></h5>
          <h4 class="p-price">₹<?php echo $row['product_price']; ?></h4>
          <a class="btn buy-btn" href="<?php echo "single_product.php?product_id=".$row['product_id'];?>">Buy Now</a>
        </div>

  <?php } ?>
  
  
        <!--Pagination-->
        <nav aria-label="Page navigation example">
          <ul class="pagination mt-5">

            <li class="page-item <?php if($page_no <= 1){ echo 'disabled'; } ?>">
               <a class="page-link" href="<?php if($page_no <= 1){ echo '#'; }else{ echo "?page_no=".($page_no-1); } ?>">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="?page_no=1">1</a></li>
            <li class="page-item"><a class="page-link" href="?page_no=2">2</a></li>

            <?php if($page_no >= 3) { ?>
            <li class="page-item"><a class="page-link" href="#">...</a></li>
            <li class="page-item"><a class="page-link" href="<?php echo "?page_no=".$page_no; ?>"><?php echo $page_no; ?></a></li>
            <?php } ?>

            <li class="page-item <?php if($page_no >= $total_no_of_pages){ echo 'disabled'; } ?>">
               <a class="page-link" href="<?php if($page_no >= 1){ echo '#'; }else{ echo "?page_no=".($page_no+1); } ?>">Next</a>
            </li>

          </ul>
        </nav>
      </div>
    </section>
  </section> <!--indent section ends here -->

  <?php include('layouts/footer.php'); ?> <!--footer-->
