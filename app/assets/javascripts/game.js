$(document).ready( function(){  
  $('.clickable').on('click', function(){
    $(this).toggleClass('alive')
    $(this).removeClass('will_live')
  });

  row_value = $('.row_val').val();
  col_value = $('.col_val').val();

  var fetch_grid = function(){
    var grid = [];  
    for (var r = 0; r < row_value ; r++) {    
      for (var c = 0; c < col_value; c++) {
        var $cell = $('.row_' + r + ' .col_' + c);      
        if ($cell.hasClass('alive') == true){
          grid.push([r, c])
        }
      }};
      return grid;
    };

    var build_grid = function(resp){    
      console.log(resp);
      for (var r = 0; r < resp.length ; r++) {
        for (var c = 0; c < resp[r].length; c++) {        
          var $cell = $('.row_' + r + ' .col_' + c);   
          if(resp[r][c]){                    
            $cell.addClass('alive');
          }
          else{          
            console.log('dead', '.row_' + r + ' .col_' + c);
            $cell.removeClass('alive');
          }
        }
      };
    };

    $('#clear').on('click', function(e){
      window.location.reload(false); 
    });

    $('#start').on('click', function(e){
      $('#start').prop('disabled', true);
      (function next_generation(){
        e.preventDefault();
        $.ajax({
          type: 'POST',
          url: '/load',
          data: { grid: fetch_grid()},
          dataType: 'json',
          success: function(resp){        
            build_grid(resp)
          }
        });
        if(fetch_grid().count != 0){
          setTimeout(function(){      
            load = false;
            next_generation();
          }, 2000)
        }
      }());
    });

  })

