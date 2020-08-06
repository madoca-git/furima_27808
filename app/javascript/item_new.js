$(function() {
  
  tax = 0.1 ,
  charge = $("#add-tax-price"),
  profit = $("#profit");

  $(".price-input").on("input",function() {
      charge.text(Math.floor($(this).val() * tax)); //販売手数料 (10%)
      profit.text(Math.floor($(this).val() * (1 - tax))); //販売利益
  });
}); 