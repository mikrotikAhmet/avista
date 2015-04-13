<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo strtoupper($order['invoice_no'])?></title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

    <!-- Bootstrap Core CSS -->
    <link href="view/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="view/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="view/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="view/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="view/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="view/dist/js/sb-admin-2.js"></script>
    <style>
        body {
            background: #FFF;
        }
        .container{
            width : 1050px;
            margin: 0 auto;
            margin-top: 30px;
        }

        li {
            line-height: 34px;
        }

        .bold{
            font-weight: bolder;
        }
        .space{
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="row">
<div class="col-md-10 col-md-offset-1">
<div class="container">
    <button class="btn btn-link pull-right" onclick="myFunction()">Print Invoice <?php echo strtoupper($order['invoice_no'])?></button>
<ul style="list-style: none">
    <li>ELECTRONIC INVOICE<li/>
    <li>01. INVOICE TYPE:<b>PROFORMA INVOICE</b><li/>
    <li>02. DATE:<b><?php echo date('Y-m-d')?></b><li/>
    <li>03. INVOICE NUMBER:<b><?php echo strtoupper($order['invoice_no'])?></b><li/>
    <li>04. INVOICE ISSUER:<b> H.I.F. INVEST HOLDING LTD - MARSHALL ISLANDS - AJELTAKE ROAD - AJELTAKE ISLAND - MAJURO - REGISTRATION NUMBER 41454 - E: info@hifholding.com</b><li/>
    <li>05. INVOICE TO:<b><?php echo strtoupper($contract['company_name'])?><?php echo ' '.strtoupper($certificate['address_1'].' '.$certificate['address_2'].' '.$certificate['postcode'])?></b><li/>
    <li>06. CLIENT CODE:<b><?php echo strtoupper($customer['customer_id'])?></b><li/>
    <li>07. BUSINESS AGREEMENT / CONTRACT NUMBER:<b><?php echo strtoupper($order['contract_no'])?></b><li/>
    <li>08. BUSINESS AGREEMENT / CONTRACT ISSUED DATE:<b><?php echo date('d/m/Y',strtotime($contract['date_added']))?></b><li/>
    <li>09. TRANSACTION CODE:<b><?php echo strtoupper($order['order_id'])?></b><li/>
    <li>10. PAYMENT DESCRIPTION:<b><?php echo strtoupper($order['payment_description'])?></b><li/>
    <li>11. INVOICE TOTAL AMOUNT:<b><?php echo strtoupper($order['total_amount'])?></b><li/>
    <li>12. DOWN PAYMENT AMOUNT:<b><?php echo strtoupper($order['down_payment'])?></b><li/>
    <li>13. REMAINING DUE AMOUNT:<b><?php echo strtoupper($order['due_amount'])?></b><li/>
    <li>14. PAYMENT TO: <b>H.I.F. INVEST HOLDING LTD</b><li/>
    <li>15. SERVICE PROVIDER: <b>AVERSA OOD</b><li/>
    <li>16. BANK: <b>GARANTI</b> <li/>
    <li>17. BANK BRANCH NUMBER/COUNTRY: <b>493 / TRNC LEFKOSA</b> <li/>
    <li>18 EURO ACCOUNT NUMBER: <b>9077190</b><li/>
    <li>19. IBAN: <b>TR04 0006 2000 4930 0009 0771 90</b><li/>
    <li>20. BANK SWIFT NUMBER: <b>TGBATRISXXX</b><li/>
    <li>21. NOTICE: <b>A DOWN PAYMENT EQUAL TO THE AMOUNT MENTIONED IN PARAGRAPH 12 OF CURRENT PROFORMA INVOICE TO BE PAID IN THE MENTION ACCOUNT ABOVE.
        PAYMENT IN FULL, OF THE REMAINING AMOUNT MENTIONED IN PARAGRAPH 13 OF CURRENT PROFORMA INVOICE, TO BE PAID AS PER OUR CONTRACTUAL AGREEMENT.</b><li/>
</ul>
<div class="margin-left : 31px;">
    <img src="image/stamp2.png" style="margin-left: 24px"/>
</div>

<h4><i>ELECTRONIC SIGN AND/OR STAMP IS ACCEPTED BY BOTH PARTIES AS TRUE, VALID AND IN FULL FORCE.</i></h4>
</div>

</div>
</div>
<script>
    function myFunction() {
        window.print();
    }
</script>
</body>
</html>
