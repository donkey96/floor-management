// $(document).on('turbolinks:load',function () {

// var search_list = $(".customers");

// function appendCustomer(customer) {
//   var html = `<div class="customer">
//                 <div class="customer_name">
//                   ${ customer.name } 様
//                 </div>
//                 <div class="customer_people">
//                   ${ customer.people } 名
//                 </div>
//                 <div class="customer_tel">
//                   ${ customer.tel }
//                 </div>
//                 <div class="customer_day">
//                   ${ customer.day }
//                 </div>
//                 <div class="customer_time">
//                   ${ customer.time }
//                 </div>
//                 <div class="customer_text">
//                   ${ customer.text }
//                 </div>
//                 <select name="tables_select-box" size="1" multiple class="customer_tables_select-box">
//                 <option val="">▼テーブルを選択して下さい</option>
//                 </select>
//                 <input type="button" value="追加" class="customer_add-btn">
//               </div>`
//   search_list.append(html);
// }
// function appendErrMsgToHTML(msg) {
//   var html = `<div class="customer">
//                 ${ msg }
//               </div>`
//   search_list.append(html);
// }
//   $('.customer-search').on('keyup', function(){
//     var input = $('.customer-search').val();

//     $.ajax({
//       type: 'GET',
//       url: '/customers',
//       data: { keyword: input },
//       dataType: 'json'
//     })

//     .done(function (customers) {
//       $(".customers").empty();
//       if (customers.length !== 0) {
//         customers.forEach(function (customer) {
//           appendCustomer(customer);
//         });
//       }
//       else {
//         appendErrMsgToHTML("一致する顧客情報はありません");
//       }
//     })
//     .fail(function () {
//       alert('検索に失敗しました')
//     });
//   }); 
// });