<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo strtoupper($contract['contract_id'])?></title>
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
            line-height: 20px;
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
        <button class="btn btn-link pull-right" onclick="myFunction()">Contract ID:<?php echo strtoupper($contract['contract_id'])?></button>
            <ul style="list-style: none">
                <li class="bold">+++ ELECTRONIC BUSINESS AGREEMENT/CONTRACT</li>
                <li>A) BUSINESS AGREEMENT / CONTRACT NUMBER:<b><?php echo strtoupper($contract['contract_id'])?></b></li>
                <li>B) AGREEMENT EFFECTIVE DATE:<b><?php echo date('d/m/Y', strtotime($contract['date_added']))?></b></li>
                <li>C) TRANSACTION CODE:<b><?php echo strtoupper($contract['order_id'])?></b></li>
                <li>D) CLIENT CODE:<b><?php echo strtoupper($customer['customer_id'])?></b></li>
                <li class="bold">+++ CLAUSE 1 - DEFINITIONS</li>
                <li>1.1.<b>"AGREEMENT OR CONTRACT"</b>, MEANS THIS ELECTRONIC BUSINESS AGREEMENT/CONTRACT</li>
                <li>1.2. <b>“PRINCIPAL”</b>, MEANS H.I.F. INVEST HOLDING LTD - MARSHALL ISLANDS - AJELTAKE ROAD - AJELTAKE
                    ISLAND - MAJURO - REGISTRATION NUMBER 41454 - EMAIL: <b>office@hifholding.com</b>
                </li>
                <li>1.3.<b>“CLIENT OR “MERCHANT”</b>, MEANS <b><?php echo strtoupper($certificate['legal_name'])?></b></li>
                <li>1.4.<b>“PARTIES”</b>, MEANS BOTH “PRINCIPAL” AND “MERCHANT”</li>
                <li>1.5.<b>“SERVICE PROVIDER”</b>, MEANS AVERSA OOD COMPANY WITH REGISTRATION NO 202633106, A LEGAL ORGANIZED
                    COMPANY THAT OPERATES UNDER THE LAWS OF THE REPUBLIC OF BULGARIA WITH ITS REGISTRATION ADDRESS AT
                    103 JAMES BOURCHIER BLVD, 1st FLOOR, 1047 SOFIA
                </li>
                <li>1.6.<b>“SERVICE PROVIDER ACCOUNT”</b>, MEANS THE ACCOUNT THAT “PRINCIPAL” LEGAL USE FOR THE BUSINESS SCOPE
                    OF CURRENT AGREEMENT
                </li>
                <li>1.7.<b>“INSTRUMENT”</b>, MEANS THE INSTRUMENT OR SERVICE THAT “MERCHANT” REQUEST FROM “PRINCIPAL” THROUGH
                    “PRINCIPAL’S” WEB SYSTEM
                </li>
                <li>1.8.<b>“PAYMENT”</b>, MEANS THE E-BANKING PAYMENT OF THE INSTRUMENT ORDERED BY MERCHANT</li>
                <li>1.9.<b>“ISSUANCE BANK”</b>, MEANS BANK OF <b><?php echo strtoupper($contract['issuance_bank'])?></b></li>
                <li>1.10.<b>“INSTRUCTIONS”</b>, MEANS ALL INSTRUCTIONS TO «MERCHANT» PROVIDED BY «PRINCIPAL»</li>
                <li>1.11.<b>“PRIVACY POLICY”</b>, MEANS "PRINCIPAL’S" WEB PLATFORM PRIVACY POLICY THAT "MERCHANT" HAS
                    ACCEPTED
                </li>
                <li>1.12.<b>“TERMS AND CONDITIONS”</b>, MEANS "PRINCIPAL’S" WEB PLATFORM TERMS AND CONDITIONS THAT «MERCHANT»
                    HAS ACCEPTED
                </li>
                <li class="bold">+++ CLAUSE 2 - CONTRACT DETAILS</li>
                <li>2.1. BUSINESS AGREEMENT / CONTRACT NUMBER:<b><?php echo strtoupper($contract['contract_id'])?></b></li>
                <li>2.2. AGREEMENT EFFECTIVE DATE:<b><?php echo date('d/m/Y',strtotime($contract['date_added']))?></b></li>
                <li>2.3. TRANSACTION CODE:<b><?php echo strtoupper($contract['order_id'])?></b></li>
                <li>2.4. "PRINCIPAL" CODE: <b>HIF-41454</b></li>
                <li>2.5. "MERCHANT" CODE:<b><?php echo strtoupper($customer['customer_id'])?></b></li>
                <li>2.6. "MERCHANT" (COMPANY) NAME:<b><?php echo strtoupper($certificate['legal_name'])?></b></li>
                <li>2.7. "MERCHANT" REGISTRATION NUMBER:<b><?php echo strtoupper($certificate['registration_number'])?></b></li>
                <li>2.8. "MERCHANT" COMPANY ADDRESS:<b><?php echo strtoupper($certificate['address_1'].' '.$certificate['address_2'])?></b></li>
                <li>2.9. "MERCHANT" POSTAL CODE:<b><?php echo strtoupper($certificate['postcode'])?></b></li>
                <li>2.10. "MERCHANT" COUNTRY:<b><?php echo strtoupper($country['name'])?></b></li>
                <li>2.11. "MERCHANT" CONTACT PERSON:<b><?php echo strtoupper(strtoupper($customer['lastname']).' '.$customer['firstname'])?></b></li>
                <li>2.12. "MERCHANT" CONTACT EMAIL:<b><?php echo strtoupper($customer['email'])?></b></li>
                <li>2.13. "MERCHANT" CONTACT CELLULAR PHONE:<b><?php echo strtoupper($customer['mobile'])?></b></li>
                <li class="bold">+++ CLAUSE 3 - SCOPE OF AGREEMENT/CONTRACT</li>
                <li>3.1. THE “PRINCIPAL” WILL ARRANGE, AS PER “MERCHANT’S” REQUEST AND APPLICATION, THE ISSUANCE OF THE
                    FOLLOWING INSTRUMENT ON BEHALF OF “MERCHANT: <b><?php echo strtoupper($certificate['legal_name'])?></b>
                </li>
                <li>3.1.1. INSTRUMENT OF: <b><?php echo strtoupper($contract['instrument'])?></b></li>
                <li>3.1.2. ISSUANCE BANK:<b><?php echo strtoupper($contract['issuance_bank'])?></b> WITH ISIN CODE:<b><?php echo strtoupper($contract['isin_code'])?></b></li>
                <li>3.1.3. FACE VALUE OF INSTRUMENT: <b>EURO: <b><?php echo strtoupper($contract['face_value'])?></b></b></li>
                <li>3.1.4. MATURITY DATE OF INSTRUMENT:<b><?php echo $contract['maturity_date']?></b></li>
                <li>3.1.5. PURCHASE PRICE OF INSTRUMENT: <b>EURO</b> : <b><?php echo strtoupper($contract['price'])?></b></li>
                <li class="bold">+++ CLAUSE 4 - OBLIGATIONS AND COMMITMENT OF PARTIES</li>
                <li>4.1. “MERCHANT” COMMITTED AND DECLARES UNDER A PENALTY OF PERJURY ITS FINANCIAL ABILITY AND
                    CAPABILITY TO FULFILL ALL FINANCIAL OBLIGATIONS/PAYMENTS RISE FROM THIS AGREEMENT.
                </li>
                <li>4.2. “MERCHANT” AGREES, COMMITTED AND DECLARES UNDER A PENALTY OF PERJURY, THAT THE ORDERED
                    INSTRUMENT FULL PAYMENT WILL BE ESTABLISHED AS PER CLAUSE 5 OF THIS AGREEMENT.
                </li>
                <li>4.3. «MERCHANT» COMMITTED, UNDER A PENALTY OF PERJURY, TO PAY THE DUE AMOUNT FOR A SUCCESSFUL
                    ACQUIRE OF THE INSTRUMENT UNDER THE FULL TERMS, CONDITIONS AND IN ALL CLAUSES OF THIS AGREEMENT AND
                    ACCORDING TO “PRINCIPAL’S” INSTRUCTIONS.
                </li>
                <li>4.4. THIS “INSTRUMENT” AGREED BY THE “PRINCIPAL” TO BE TRANSFERRED IN THE ACCOUNT OF LAW FIRM
                    HEREUNDER MENTIONED AND AS THIS HAS BEEN REQUESTED IN WRITTEN BY THE “MERCHANT” ON HIS APPLICATION
                    FORM.
                </li>
                <li>4.4.1. COMPANY’S NAME:<b><?php echo strtoupper($certificate['legal_name'])?></b></li>
                <li>4.4.2. COMPANY’S ADDRESS:<b><?php echo strtoupper($certificate['address_1'].' '.$certificate['address_2'])?></b></li>
                <li>4.4.3. COMPANY’S TELEPHONE:<b><?php echo strtoupper($customer['mobile'])?></b></li>
                <li>4.4.4. COMPANY’S EMAIL:<b><?php echo strtoupper($customer['email'])?></b></li>
                <li>4.4.5. COMPANY’S CONTACT PERSON:<b><?php echo strtoupper($customer['firstname'].' '.$customer['lastname'])?></b></li>
                <li>4.4.6. BANK NAME:<b><?php echo strtoupper($bank['bank'])?></b></li>
                <li>4.4.7. BANK IBAN:<b><?php echo strtoupper($bank['iban'])?></b></li>
                <li>4.4.8. BANK SWIFT CODE:<b><?php echo strtoupper($bank['swift'])?></b></li>
                <li>4.4.9. BENEFICIARY NAME:<b><?php echo strtoupper($customer['firstname'].' '.$customer['lastname'])?></b></li>
                <li>4.4.10. BANK OFFICER NAME:<b><?php echo strtoupper($bank['officer_name'])?></b></li>
                <li>4.4.11. BANK OFFICER EMAIL:<b><?php echo strtoupper($bank['officer_email'])?></b></li>
                <li>4.4.12. BANK OFFICER PHONE:<b><?php echo strtoupper($bank['officer_telephone'])?></b></li>
                <li>4.5. ISSUANCE OF THE INSTRUMENT FORMAT WITH SPECIFIC TEXT BY THE ISSUANCE BANK AND DELIVERY TO THE
                    NOMINATED RECEIVING BANK OF THE «MERCHANT», SHOULD BE THE SUBJECT OF THE INTERNATIONAL CHAMBER OF
                    COMMERCE - ICC RULES 500 / 600 / URDG 758 AND ACCORDING TO «MERCHANT»’S WISH WHILE IT WILL BE
                    ASSIGNED VIA SWIFT MT760 (UCP 600 LAST EDITION) AND THROUGH “«MERCHANT»’S” BANKING COORDINATES TO
                    ITS NOMINATED RECEIVING BANK
                </li>
                <li>4.6. THE ISSUANCE OF THE INSTRUMENT WILL BE IN PROGRESS AFTER “MERCHANT” FULFILLS OF ALL ITS
                    OBLIGATIONS AS PER CLAUSE 5 OF CURRENT AGREEMENT, ACCORDING TO “PRINCIPAL” INSTRUCTIONS
                </li>
                <li class="bold">+++ CLAUSE 5 - PROCEDURES / OBLIGATIONS AND PAYMENT TERMS</li>
                <li>5.1. MERCHANT COMMITTED AND AGREE - UNDER A PENALTY OF PERJURY - THAT WILL PROCEED WITH THE
                    RESERVATION COSTS PAYMENT OF THE INSTRUMENT IT REQUESTED AND ORDERED, IN THE NON REFUNDABLE AMOUNT
                    OF THE 30% (THIRTY PERCENT) OF ITS PURCHASE VALUE AS THIS IS MENTIONED IN CLAUSE 3 PARAGRAPH 3.1.5,
                    THROUGH E-BANKING PAYMENT TO THE FIRM AND ACCOUNT OF THE SERVICES PROVIDER AS THIS WILL BE MENTIONED
                    TO EACH AND ANY ISSUED ELECTRONIC PROFORMA OR COMMERCIAL INVOICE BY THE PRINCIPAL AND ACCORDING TO
                    PRINCIPAL’S INSTRUCTIONS.
                </li>
                <li>5.2. “PRINCIPAL” CONFIRMS AND STATE HEREWITH, THAT ALL OF THE ABOVE DESCRIBED LEASING AND
                    ARRANGEMENT BUSINESS (CLAUSE 3) WILL BE COMPLETED WITHIN A TIME FRAME OF 30 DAYS AFTER PAYMENT
                    CONFIRMATION FOR THE RESERVATION COSTS AS PER PARAGRAPH 5.1 OF CURRENT CLAUSE.
                </li>
                <li>5.3. “MERCHANT” COMMITTED AND AGREE - UNDER A PENALTY OF PERJURY - THAT WILL PROCEED WITH THE
                    PAYMENT IN FULL OF THE REST REMAINING SEVENTY PERCENT (70%) OF THE INSTRUMENT PURCHASE PRICE OF
                    CLAUSE 3 - PARAGRAPH 3.1.5. THROUGH E-BANKING PAYMENT TO THE FIRM AND ACCOUNT OF THE SERVICES
                    PROVIDER AS THIS WILL BE MENTIONED TO THE FINAL ISSUED PROFORMA OR COMMERCIAL INVOICE BY THE
                    “PRINCIPAL” AND ACCORDING TO “PRINCIPAL” INSTRUCTIONS, UPON RECEIVING A NOTICE FOR SUCH PAYMENT FROM
                    PRINCIPAL TEN (10) CALENDAR DAYS PRIOR INSTRUMENT ASSIGNED TO ITS FAVOR.
                </li>
                <li>5.4. ON WELL FULL PAYMENT, «PRINCIPAL» WILL ISSUE A FINAL INVOICE AND PAYMENT RECEIPTS IN THE
                    NAME/FAVOR OF “MERCHANT”.
                </li>
                <li>5.5. ALL OTHER DETAILS OF CURRENT AGREEMENT/CONTRACT AND TRANSACTION ARE REMAINING AS PER THE TERMS
                    AND CONDITIONS AND PRIVACY POLICY AGREED BY THE «MERCHANT» ON ITS APPLICATION DATE AND FINAL
                    CONFIRMATION/APPROVAL BY THE «PRINCIPAL».
                </li>
                <li class="bold">+++ CLAUSE 6 - REFUNDS</li>
                <li>6.1. “MERCHANT” IRREVOCABLY AGREES, DECLARES AND ACCEPTS UNDER PENALTY OF PERJURY THROUGH THIS
                    AGREEMENT/CONTRACT AND ITS SIGNATURE THAT IN CASE OF ITS INABILITY TO PAY OFF THE ORDERED INSTRUMENT
                    - EVEN DUE TO FORCE MAJEURE - THE DOWN PAYMENT FOR THE RESERVATION COSTS OF THE INSTRUMENT WILL NOT
                    BE REFUNDED. THIS ALSO STAND IF “MERCHANT” HAS PAY IN FULL AND RECEIVED THE ORDERED AND AGREED
                    INSTRUMENT AS PER CURRENT CONTRACT PROCEDURES IN ALL ITS CLAUSES.
                </li>
                <li>6.2. ALL PAYMENTS, INCLUDING DOWN PAYMENT, WILL BE REFUNDED TO “MERCHANT” WITHOUT ANY
                    EXCEPTION/OBJECTION FROM “PRINCIPAL” ONLY DUE TO “PRINCIPAL’S” FAULT OR INABILITY TO WELL PERFORM
                    CURRENT AGREEMENT.
                </li>
                <li>6.3. REFUND WILL NOT BE ESTABLISHED IN CASE THAT «PRINCIPAL» IS NOT PERFORM ON TIME AND THE AGREED
                    DAYS (CLAUSE 5 - PARAGRAPH 5.2) AND DELAY TO ISSUE THE AGREED INSTRUMENT DUE TO ANY FORCE MAJEURE
                    WHERE IN THIS CASE «PRINCIPAL» WILL IN WRITTEN INFORM “MERCHANT” FOR THE NEW DAY OF AGREED
                    INSTRUMENT ISSUANCE / DELIVERY.
                </li>
                <li>6.4. IT IS ALSO UNDERSTOOD AND ACCEPTED BY BOTH PARTIES THAT ANY REFUND WILL NOT BE ESTABLISHED IN
                    CASE THAT “PRINCIPAL” FAILS TO PERFORM DUE TO “MERCHANT’S” LIABILITY, THUS EVEN THE PERFORMANCE HAS
                    BEEN DELAYED, HINDERED OR PREVENTED BY REASON OF ANY CAUSE THAT MAY BE DUE TO EXERCISED DUE
                    DILIGENCE, BANK’S DELAY OR BANK’S REFUSE TO ISSUE THE INSTRUMENT DUE TO MISSING OR NOT SUFFICIENT
                    CERTIFICATES/DOCUMENTS PLACED AND RECEIVED FROM “MERCHANT” FOR THE LEGAL AND CORRECT ISSUANCE OF THE
                    INSTRUMENT, DUE TO LAW PROBLEMS OF “MERCHANT” THAT MAY BE OCCURRED OR MAY BE NOTICED/APPEAR TO
                    “PRINCIPAL” AND/OR BANK/BANKERS WITHIN THE PERIOD OF INSTRUMENT ISSUANCE PROGRESS, DUE TO
                    “MERCHANT’S” BANKING PROBLEMS IN GENERAL, DUE TO “MERCHANT” BANKRUPT AND DUE TO ANY REASON THAT THE
                    LIABILITY IS ON “MERCHANT” INCLUDING CREDIBILITY PROBLEMS AND/OR LAW PROBLEMS.
                </li>
                <li class="bold">+++ CLAUSE 7 - LIABILITY EXEMPTIONS (FORCE MAJEURE)</li>
                <li>7.1 “PRINCIPAL” SHALL NOT BE LIABLE FOR FAILURE TO PERFORM, IN ANY OR ALL OF THE PROVISIONS SET OUT
                    IN THIS AGREEMENT, IF THE PERFORMANCE HAS BEEN DELAYED, HINDERED OR PREVENTED BY REASON OF ANY CAUSE
                    THAT MAY BE, EVEN THOUGH THE AFFECTED PARTY EXERCISED DUE DILIGENCE AND OF ANY REASON MENTIONED IN
                    CLAUSE 5.
                </li>
                <li>7.2 «PRINCIPAL» SHALL NOT BE LIABLE WHERE SUCH FAILURE OR DELAY TO PERFORM IS CAUSED BY FORCE
                    MAJEURE BEING ANY EVENT, OCCURRED BY CIRCUMSTANCE REASONABLY BEYOND THE CONTROL OF THAT PARTY,
                    INCLUDING WITHOUT PREJUDICE TO THE GENERALITY OF THE FOREGOING FAILURE OR DELAY CAUSED BY OR
                    RESULTING FROM ACTS OF GOD, BANKING DAY, BANK DELAYS, BANK BANKRUPT, STRIKES, FIRE, FLOODS, WARS,
                    (WHETHER DECLARED / UNDECLARED), RIOTS, DESTRUCTION OF THE MATERIALS, DELAYS OR CARRIERS DUE TO
                    BREAK DOWN OR ADVERSE WEATHER, PERILS OF EMBARGOES, ACCIDENTS, RESTRICTIONS IMPOSED ON BY ANY
                    GOVERNMENTAL AUTHORITY (INCLUDING ALLOCATIONS, REQUISITIONS, QUOTAS AND PRICE CONTROLS).
                </li>
                <li class="bold">+++ CLAUSE 8 - CONFIDENTIALITY / NCNDA</li>
                <li>8.1. BOTH PARTIES SHALL KEEP CONFIDENTIALITY OF THE DATA ABOUT OTHER PARTY AND SHALL NOT DISCLOSE
                    ANY OF THESE DATA TO ANY THIRD PARTY IN WHATEVER FORMS WITHOUT WRITTEN CONSENT OF THE OTHER
                    CONTRACTED PARTY, OTHERWISE THE OTHER CONTRACTED PARTY MAY TERMINATE THIS AGREEMENT.
                </li>
                <li>8.2. NEITHER OF BOTH CONTRACTED PARTIES MAY USE ANY TRADE SECRET RECEIVED FROM THE OTHER PARTY,
                    INCLUDING BUT NOT LIMITED TO ANY BUSINESS INFORMATION, CONSULTING INFORMATION AND CUSTOMER
                    INFORMATION, OR PROVIDE IT TO ANY THIRD PARTY FOR USE OR DISCLOSE IT TO ANY THIRD PARTY IN WHATEVER
                    FORMS, WITHOUT THE WRITTEN CONSENT OF THE OTHER PARTY.
                </li>
                <li>8.3. THE OBLIGATION OF CONFIDENTIALITY SHALL SURVIVE AFTER THE TERMINATION OF THIS AGREEMENT FOR
                    FIVE YEARS.
                </li>
                <li>8.4. THE PARTY BREACHING THE CONFIDENTIALITY PROVISION IS ENTITLED TO CLAIM DAMAGE FROM THE OTHER
                    INJURED PARTY.
                </li>
                <li class="bold">+++ CLAUSE 9 - ASSIGNMENT</li>
                <li>THIS AGREEMENT AND ANY RIGHT ON OBLIGATION OF EITHER PARTY MAY NOT BE ASSIGNED BY EITHER PARTY
                    WITHOUT THE PRIOR WRITTEN CONSENT OF THE OTHER PARTY.
                </li>
                <li class="bold">+++ CLAUSE 10 - FINAL PROVISIONS</li>
                <li>10.1. ALL ADDITIONAL PROVISIONS AND CHANGES OF THIS CONTRACT SHALL BE WRITTEN IN AN ANNEX TO THIS
                    CONTRACT.
                </li>
                <li>10.2. ANY ORDERS GIVEN VERBALLY, TELEPHONICALLY OR BY E-MAIL COME INTO FORCE ONLY BY WRITTEN
                    CONFIRMATION FROM ANY OF BOTH CONTRACTED PARTIES OF THIS AGREEMENT.
                </li>
                <li class="bold">+++ CLAUSE 11 - JURISDICTION</li>
                <li>11.1. THE CONTRACTING PARTIES AGREE THAT THE LAW CONTENT AND JURISDICTION OF THIS AGREEMENT IS
                    GOVERNED BY THE LAW OF THE CONFEDERATION OF SWITZERLAND.
                </li>
                <li>11.2. SHOULD ANY PROVISION OF THIS AGREEMENT BE OR BECOME WHOLLY OR PARTIALLY INVALID OR
                    INEFFECTIVE, THIS SHALL NOT AFFECT THE VALIDITY AND AFFECTIVITY OF THE OTHER PROVISIONS OF THIS
                    AGREEMENT. THE SAME APPLIES IN THE EVENT THAT THIS AGREEMENT IS INCOMPLETE. THE INVALID, INEFFECTIVE
                    OR MISSING PROVISION SHALL BE REPLACED OR COMPLETED BY SUCH VALID AND EFFECTIVE PROVISION THAT AS
                    CLOSELY AS POSSIBLE REFLECTS THE ECONOMIC PURPOSE WHICH THE PARTIES TO THIS AGREEMENT HAD PURSUED
                    WITH THE INVALID OR INEFFECTIVE PROVISION.
                </li>
                <li class="bold">+++ CLAUSE 12 - AMENDMENTS</li>
                <li>THIS AGREEMENT MAY BE AMENDED OR MODIFIED, IN WHOLE OR IN PART, ONLY BY AN INSTRUMENT IN WRITING
                    SIGNED BY BOTH PARTIES. THIS INSTRUMENT WILL BE AS AMENDMENT OR ADDENDUM THAT WILL MENTION THE
                    CURRENT BUSINESS AGREEMENT CODE AND THE MODIFICATION DATE.
                </li>
                <li class="bold">+++ CLAUSE 13 - “MERCHANT’S” FUNDS ORIGIN</li>
                <li>“MERCHANT”, THROUGH THIS AGREEMENT, DECLARES WITH FULL RESPONSIBILITY AND UNDER A PENALTY OF PERJURY
                    THAT ALL E-BANKING PAYMENTS ARE FULL LEGAL AND WITH NOT ANY RESTRICTION FROM ITS BANK AND COUNTRY OF
                    ORIGIN AND IS FULLY COMMITTED AND DECLARES UNDER A PENALTY OF PERJURY THAT ITS FUNDS ARE CLEAN,
                    CLEAR, FROM NON-CRIMINAL ORIGIN AND FROM A LEGAL SOURCES.
                </li>
                <li class="bold">+++ CLAUSE 14 - OTHER NOTICES / CLARIFICATIONS</li>
                <li>14.1. ANY NOTICES OR OTHER COMMUNICATIONS REQUIRED HEREUNDER SHALL BE IN WRITING AND SHALL BE DEEMED
                    GIVEN WHEN DELIVERED IN PERSON OR WHEN MAILED, BY CERTIFIED OR REGISTERED FIRST CLASS MAIL, POSTAGE
                    PREPAID, RETURN RECEIPT REQUESTED, ADDRESSED TO THE PARTIES AT THEIR ADDRESSES SPECIFIED IN THE
                    PREAMBLE TO THIS AGREEMENT OR TO SUCH OTHER ADDRESSES OF WHICH A PARTY SHALL HAVE NOTIFIED THE
                    OTHERS IN ACCORDANCE WITH THE PROVISIONS OF THIS CLAUSE 16.
                </li>
                <li>14.2. THIS AGREEMENT IS CONCLUDED IN ONE ELECTRONIC DOCUMENT ISSUED BY “PRINCIPAL” TO “MERCHANT”,
                    WHERE “MERCHANT” MUST ELECTRONICALLY SIGN IT THROUGH “PRINCIPAL’S” WEB PLATFORM AND ALSO PRINT IT
                    AND PHYSICALLY SIGN IT AND STAMP IT WITH ITS COMPANY’S SEAL AND SEND IT BY POST AND EMAIL ALSO TO
                    “PRINCIPAL” AT office@hifholding.com AND HIS POST ADDRESS MENTIONED AT THE END OF THIS AGREEMENT.
                </li>
                <li>14.3. GRAMMAR MISTAKES AND SLIPS, IF THEY ARE PRESENT IN THIS AGREEMENT, SHALL NOT BE CONSIDERED AS
                    CONTRADICTIONS. IN CASE OF TRANSLATION, THE ENGLISH LANGUAGE ORIGINAL SHALL GOVERN AND PREVAIL FOR
                    ALL PURPOSES.
                </li>
                <li>14.4. THIS AGREEMENT BECOMES EFFECTIVE ON THE DATE OF ELECTRONIC SIGN BY BOTH PARTIES.</li>
                <li>14.5 ELECTRONIC SIGN AND/OR STAMP COPY OF THIS BUSINESS AGREEMENT OR ANY APPENDIX OR ADDENDUMS OR
                    ANNEXES IS ACCEPTED BY BOTH PARTIES AS TRUE, VALID AND IN FULL FORCE.
                </li>
                <li>14.6 “MERCHANT” HAS THE RESPONSIBILITY TO ELECTRONIC SIGN/ACCEPT THIS AGREEMENT BUT ALSO TO PRINT IT
                    AND PHYSICALLY SIGN IT STAMP IT AND SEND IT BY EMAIL TO office@hifholding.com (PDF FORMAT) AND POST
                    IT TO THE FOLLOWING HEREUNDER ADDRESS OF THE "PRINCIPAL" (AS THIS ALSO MENTIONED IN PARAGRAPH 14.2).
                </li>
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
