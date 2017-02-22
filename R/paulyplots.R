#' Pauly Plots
#'
#' This function allows you to change plotting points to images preferably to Pauly
#' @param paulyplots
#' @keywords pauly
#' @export
#' @examples
#' paulyplots()

# pauly[img]
# x[float]; vector of x coordinates
# y[float]: vector of y coordinates
# cex is used to control symbol size

paulyplot <- function(pauly, x, y, cex = 0.5) {
  dim.x <- dim(pauly)[2]  #image width
  dim.y <- dim(pauly)[1]  #image height
  if (dim.x == dim.y) {
    # aspect ratio of width to height, relative to 1
    ratio.x = ratio.y = 1
  } else if (dim.x < dim.y) {
    ratio.x = dim.x/dim.y
    ratio.y = 1
  } else {
    ratio.x = 1
    ratio.y = dim.y/dim.x
  }
  cex <- cex/50  #image size, scaled down
  pin <- par()$pin  #pin gives the current plot dimensions and par is used to set parameter
  pin.ratio <- pin/max(pin)  #take the ratio
  usr <- par()$usr  #usr provides the c(x1, x2, y1, y2) - 2 means max, 1 is min
  
  # combine the active device dimensions, the image dimensions, and the
  # desired output size
  image.size.y <- (usr[4] - usr[3]) * pin.ratio[1] * cex
  image.size.x <- (usr[2] - usr[1]) * pin.ratio[2] * cex
  for (i in 1:length(x)) { #for loop for each x coordinate
    # plot each point pos can be NULL (default) or 1, 2, 3, or 4, corresponding
    # to centered (defualt), bottom, left, top, right, respectively.
    if (is.null(pos)) { 
      # we take center of image, get max and min x and y position by adding by half of the total image size
      x.pos = c(x[i] - (image.size.x * ratio.x)/2, x[i] + (image.size.x * 
                                                             ratio.x)/2)
      y.pos = c(y[i] - (image.size.y * ratio.y)/2, y[i] + (image.size.y * 
                                                             ratio.y)/2)
      
      rasterImage(pauly, x.pos[1], y.pos[1], x.pos[2], y.pos[2])
    } else if (pos == 1) {
      x.pos = c(x[i] - (image.size.x * ratio.x)/2, x[i] + (image.size.x * 
                                                             ratio.x)/2)
      y.pos = c(y[i] - (image.size.y * ratio.y), y[i])
    } else if (pos == 2) {
      x.pos = c(x[i] - (image.size.x * ratio.x), x[i])
      y.pos = c(y[i] - (image.size.y * ratio.y)/2, y[i] + (image.size.y * 
                                                             ratio.y)/2)
    } else if (pos == 3) {
      x.pos = c(x[i] - (image.size.x * ratio.x)/2, x[i] + (image.size.x * 
                                                             ratio.x)/2)
      y.pos = c(y[i], y[i] + (image.size.y * ratio.y))
    } else if (pos == 4) {
      x.pos = c(x[i], x[i] + (image.size.x * ratio.x))
      y.pos = c(y[i] - (image.size.y * ratio.y)/2, y[i] + (image.size.y * 
                                                             ratio.y)/2)
    }
    
    rasterImage(pauly, x.pos[1], y.pos[1], x.pos[2], y.pos[2])  #plot image
  }
}

