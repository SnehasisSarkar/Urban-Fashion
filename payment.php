<?php 

session_start();

if(isset($_POST['order_pay_btn'])){
  $order_status = $_POST['order_status'];
  $order_total_price = $_POST['order_total_price'];
}

?>

<?php include('layouts/header.php'); ?> <!--header-->

    <!-- Payment -->
    <section class="my-5 py-5">
      <div class="container mt-3 pt-5">
        <h2 class="font-weight-bold">Payment</h2>
        <hr class="" />
      </div>
      <div class="mx-auto container ">

      <?php if(isset($_POST['order_status']) && $_POST['order_status'] == "not paid"){ ?>
          <?php $amount = strval($_POST['order_total_price']);?>
          <?php $order_id = $_POST['order_id']; ?>
                <p>Total Payment: ₹<?php echo $_POST['order_total_price'];?> </p>
                <!-- <input type="submit" class="btn btn-primary" value="Pay Now"> -->
                        <!-- Set up a container element for the button -->
                        <div id="paypal-button-container"></div>

      <?php } else if(isset($_SESSION['total']) && $_SESSION['total'] != 0) { ?>
        <?php $amount = strval($_SESSION['total']);?>
        <?php $order_id = $_SESSION['order_id']; ?>
              <p>Total payment: ₹<?php echo $_SESSION['total'];?></p>
              <!-- <input type="submit" class="btn btn-primary" value="Pay Now"> -->
                      <!-- Set up a container element for the button -->
                      <div id="paypal-button-container"></div>


        <?php } else { ?>
                <p>You don't have an order</p>
        <?php } ?>  




      </div>
    </section>




    <!-- Paypal payment method --->


    <!-- Replace "test" with your own sandbox Business account app client ID -->
<script src="https://www.paypal.com/sdk/js?client-id=AYEg997U8qs5PtGmNuX1kvZ3Vh8m_8OKu2jiopwQTiXp4Ai200MiQzFN_pW4qkcykdYGuph34w42WWJk&currency=USD"></script>

<script>

  paypal.Buttons({

    // Sets up the transaction when a payment button is clicked

    createOrder: (data, actions) => {

      return actions.order.create({

        purchase_units: [{

          amount: {

            value: '<?php echo $amount; ?>' // Can also reference a variable or function

          }

        }]

      });

    },

    // Finalize the transaction after payer approval

    onApprove: (data, actions) => {

      return actions.order.capture().then(function(orderData) {

        // Successful capture! For dev/demo purposes:

        console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

        const transaction = orderData.purchase_units[0].payments.captures[0];

        alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);


        // When ready to go live, remove the alert and show a success message within this page. For example:

        // const element = document.getElementById('paypal-button-container');

        // element.innerHTML = '<h3>Thank you for your payment!</h3>';

        // Or go to another URL:  actions.redirect('thank_you.html');

        window.location.href="server/complete_payment.php?transaction_id="+transaction.id+"&order_id="+<?php echo $order_id; ?>;

      });

    }

  }).render('#paypal-button-container');

</script>

    <?php include('layouts/footer.php'); ?> <!--footer-->
