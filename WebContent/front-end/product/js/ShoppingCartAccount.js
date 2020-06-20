// 選擇門市

$('#Selectbtn').on('click', function () {
    $(document).ready(function () {
        $("#myModal").modal('show');
    });
});


//信用卡動畫

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


// google map
// $('div').find('#marker').on('click', function () {
//     $("#map").removeClass("-none");
// });

//信用卡輸入
$('#animatcredit').on('click', function () {
    $(document).ready(function () {
        $("#creditanimation").modal('show');
    });
});

//送出訂單
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
        // text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '送出訂單',
        cancelButtonText: '還想逛逛',
        reverseButtons: true
    }).then((result) => {
        if (result.value) {
            swalWithBootstrapButtons.fire(
//                '已完成交易',
            )
        }

    })
});



//抓取資料
$(document).ready(function () {
    if (localStorage.getItem("CartList") !== null) {
        let CartList = JSON.parse(localStorage.getItem("CartList"));
        let counter = 0;

        CartList.CartList_Array.forEach(function (Item, index) {
        	console.log(index);
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
                                <div class="row">
                                <p>${Item.version_name}</p>
                                </div>
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
                            <div class="container" id="count">
                                <div id="box">
                                    <span>${Item.product_count}</span>
                                </div>
                            </div>
                        </td>

                        <td>
                            <div class="total">
                                <p>$
                                    <span class="total">${Item.product_count * Item.product_price}</span>
                                </p>
                            </div>
                        </td>

                        <td>
                            <i class="fa fa-trash" id="trash" >

                            </i>
                        </td>
                    < /tr>
                    `

            );
            counter = counter + 1;
        });

    }
});