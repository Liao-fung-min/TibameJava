// 選擇門市

$('#Selectbtn').on('click', function () {
    $(document).ready(function () {
        $("#myModal").modal('show');
    });
});


// 信用卡動畫

$('.input-cart-number').on('keyup change', function () {
    $t = $(this);

    if ($t.val().length > 3) {
        $t.next().focus();
    }

    var card_number = '';
    $('.input-cart-number').each(function () {
        card_number += $(this).val() + ' ';
        if ($(this).val().length == 4) {
            $(this).next().focus();
        }
    })

    $('.credit-card-box .number').html(card_number);
});

$('#card-holder').on('keyup change', function () {
    $t = $(this);
    $('.credit-card-box .card-holder div').html($t.val());
});

$('#card-holder').on('keyup change', function () {
    $t = $(this);
    $('.credit-card-box .card-holder div').html($t.val());
});

$('#expire-month, #expire-year').change(function () {
    m = $('#expire-month option').index($('#expire-month option:selected'));
    m = (m < 10) ? '0' + m : m;
    y = $('#expire-year').val().substr(2, 2);
    $('.card-expiration-date div').html(m + '/' + y);
})

$('#card-ccv').on('focus', function () {
    $('.credit-card-box').addClass('hover');
}).on('blur', function () {
    $('.credit-card-box').removeClass('hover');
}).on('keyup change', function () {
    $('.ccv div').html($(this).val());
});

setTimeout(function () {
    $('#card-ccv').focus().delay(1000).queue(function () {
        $(this).blur().dequeue();
    });
}, 500);


// 信用卡輸入
$('#animatcredit').on('click', function () {
    console.log(123)
    $(document).ready(function () {
        $("#creditanimation").modal('show');
    });
});

// 送出訂單
$('#Final_order').on('click', function () {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
        title: '確定送出訂單',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '送出訂單',
        cancelButtonText: '還想逛逛',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
// window.location.href = `連結訂單主檔`
        	SetOrder();
        }
    })
});



var host = window.location.host;
var path = window.location.pathname;
var webCtx = path.substring(0, path.indexOf('/', 1));
var url="http://" + host + webCtx;

//把資料打到資料庫裡面

function SetOrder(){
	console.log('123', JSON.parse(localStorage.getItem("CartList")).CartList_Array)
	 $.ajax({
    	 url:  url +`/Order_master`, // 資料請求的網址
        type: "POST", // GET | POST | PUT | DELETE | PATCH
//        dataType: 'text json', // 預期會接收到回傳資料的格式： json | xml | html
         data: {
            SetOrder:JSON.stringify(JSON.parse(localStorage.getItem("CartList")).CartList_Array)
         },
        success: function (response) { // request 成功取得回應後執行
//            AjaxSucces(response);
        },
        error: function (xhr) { // request 發生錯誤的話執行
            console.log('error', xhr);
            console.log(xhr);
        },
        complete: function (xhr) { // request 完成之後執行(在 success / error 事件之後執行)
            console.log('complete', xhr);
            console.log(xhr);
        }
    });
}


// 抓取local修改完的資料
$(document).ready(function () {
    if (localStorage.getItem("CartList") !== null) {

        let CartList = JSON.parse(localStorage.getItem("CartList"));
        let counter = 0;
        let totalSum= 0;
        CartList.CartList_Array.forEach(function (Item, index) {
            console.log(index);
            let foo =Item.product_price*Item.product_count;
            totalSum += foo;
           
            $("#CartBody").append(
                `<tr class="tr" id="${"A"+ counter }">
                        <th scope="row">
                            <div class="photo">
                                <img src = "${Item.product_image}"></img>
                            </div>
                        </th>
                        <td>
                            <div class="name">
                                <p>${Item.product_name}</p>
                            </div>
                        </td>
                        <td>
                            <div class="price">
                               <p>$
                                    <span class="price">${Item.product_price}</span>
                                </p>
                            </div>
                        </td>
                        <td id="AAA">
                            <div class="container">
                                <div id="box">
                                   <span>${Item.product_count}</span>
                                </div>
                            </div>
                        </td>

                        <td>
                            <div class="total">
                                <p>$
                                    <span class="total">${foo}</span>
                                </p>
                            </div>
                        </td>
                    </tr>
                    `
            );
            counter = counter + 1;
        });
$("#totalSum").append(
		totalSum

);
    }
});