update_hot <- function(hot, x){
  
  # Get user inputs (when the submit button is clicked)
  user_input <- hot_to_r(hot)
  
  # Get indices of correct user inputs
  i <- which(user_input == x, arr.ind = TRUE)
  
  row_correct <- i[, 1] - 1
  col_correct <- i[, 2] - 1
  
  # Update the hot object with row_index and col_index for user in the renderer
  hot %>%
    hot_table(contextMenu = FALSE, row_correct = row_correct, col_correct = col_correct) %>%
    hot_cols(renderer = "function(instance, td, row, col, prop, value, cellProperties){
          Handsontable.renderers.TextRenderer.apply(this, arguments);
          
          if(instance.params){
          
          	// Correct cell values
            row_correct = instance.params.row_correct
            row_correct = row_correct instanceof Array ? row_correct : [row_correct]
            col_correct = instance.params.col_correct
            col_correct = col_correct instanceof Array ? col_correct : [col_correct]
            
            
            for(i = 0; i < col_correct.length; i++){ 
              if (col_correct[i] == col && row_correct[i] == row) {
                  td.style.background = 'green';
              } 
            }
            
          return td;
        }")
}
