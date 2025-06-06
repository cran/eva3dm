#' Function to calculate model wind speed
#'
#' @param u data.frame with model time-series of U10
#' @param v data.frame with model time-series of V10
#' @param verbose display additional information
#'
#' @return vector or data.frame with time and the wind sped, units are m/s
#'
#' @export
#'
#' @examples
#' times <- seq(as.POSIXct('2024-01-01',tz = 'UTC'),
#'              as.POSIXct('2024-01-02',tz = 'UTC'),
#'              by = 'hour')
#'
#' U10 = data.frame(times = times,
#'                  test1 = c(3.29,2.07,1.96,2.82,3.73,
#'                            4.11,4.96,6.33,7.39,7.59,
#'                            7.51,7.22,6.81,6.43,5.81,
#'                            4.02,3.03,2.68,2.40,2.20,
#'                            2.09,1.95,1.66,1.39,1.4),
#'                  test2 = c(6.29,4.87,6.16,7.12,8.77,
#'                            10.16,10.85,11.45,11.21,11.04,
#'                            11.09,10.67,10.48,10.00,8.96,
#'                            6.36,5.62,5.83,5.83,5.25,
#'                            4.11,3.08,2.26,1.14,-0.10))
#' V10 = data.frame(times = times,
#'                  test1 = c(-8.87,-4.23,-2.81,-2.59,-4.58,
#'                            -4.80,-5.33,-5.86,-6.12,-6.13,
#'                            -6.11,-5.76,-5.91,-5.60,-5.09,
#'                            -3.33,-2.50,-2.29,-2.14,-2.07,
#'                            -1.95,-1.97,-2.04,-2.03,-1.9),
#'                  test2 = c(11.80,5.88,5.74,5.56,6.87,
#'                            8.39,8.68,8.33,7.90,7.42,
#'                            6.96,6.87,6.36,5.61,5.16,
#'                            4.16,4.25,4.59,4.51,3.90,
#'                            2.97,1.98,1.04,-0.08,-0.44))
#'
#' uv2ws(u = U10, v = V10)
#'

uv2ws <- function(u, v, verbose = TRUE){
  if(verbose) cat('calculating wind speed ...\n')
  model_WS <- u      # copy the u variable
  WS       <- u[,-1] # removing time column
  U        <- u[,-1] # removing time column
  V        <- v[,-1] # removing time column
  for(i in 1:ncol(WS)){
    for(j in 1:nrow(WS)){
      WS[j,i] <- (U[j,i]^2 + V[j,i]^2)^(0.5)
    }
  }
  # wind_factor <- log(20) / log(100) # d = 0, z0 = 0.1, z1 = 10, z2 = 10
  # WS = WS * wind_factor
  model_WS[,-1]  <- WS
  return(model_WS)
}


#' Function to calculate model wind direction
#'
#' @param u data.frame with model time-series of U10
#' @param v data.frame with model time-series of V10
#' @param verbose display additional information
#'
#' @return vector or data.frame with time and the wind direction, units are degree north
#'
#' @export
#'
#' @examples
#' times <- seq(as.POSIXct('2024-01-01',tz = 'UTC'),
#'              as.POSIXct('2024-01-02',tz = 'UTC'),
#'              by = 'hour')
#' U10 = data.frame(times = times,
#'                  test1 = c(3.29,2.07,1.96,2.82,3.73,
#'                            4.11,4.96,6.33,7.39,7.59,
#'                            7.51,7.22,6.81,6.43,5.81,
#'                            4.02,3.03,2.68,2.40,2.20,
#'                            2.09,1.95,1.66,1.39,1.4),
#'                  test2 = c(6.29,4.87,6.16,7.12,8.77,
#'                            10.16,10.85,11.45,11.21,11.04,
#'                            11.09,10.67,10.48,10.00,8.96,
#'                            6.36,5.62,5.83,5.83,5.25,
#'                            4.11,3.08,2.26,1.14,-0.10))
#' V10 = data.frame(times = times,
#'                  test1 = c(-8.87,-4.23,-2.81,-2.59,-4.58,
#'                            -4.80,-5.33,-5.86,-6.12,-6.13,
#'                            -6.11,-5.76,-5.91,-5.60,-5.09,
#'                            -3.33,-2.50,-2.29,-2.14,-2.07,
#'                            -1.95,-1.97,-2.04,-2.03,-1.9),
#'                  test2 = c(11.80,5.88,5.74,5.56,6.87,
#'                            8.39,8.68,8.33,7.90,7.42,
#'                            6.96,6.87,6.36,5.61,5.16,
#'                            4.16,4.25,4.59,4.51,3.90,
#'                            2.97,1.98,1.04,-0.08,-0.44))
#'
#' uv2wd(u = U10, v = V10)
#'
uv2wd <- function(u, v, verbose = TRUE){
  if(verbose) cat('calculating wind direction...\n')
  model_WD <- u      # copy the u variable
  WD       <- u[,-1] # removing time column
  U        <- u[,-1] # removing time column
  V        <- v[,-1] # removing time column
  for(i in 1:ncol(WD)){
    for(j in 1:nrow(WD)){
      WD[j,i] <- (180/pi) * atan2(U[j,i],V[j,i]) + 180
    }
  }
  model_WD[,-1] <- WD # copy to the table with time column
  return(model_WD)
}
