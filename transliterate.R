#' transliterate Function
#'
#' This functions converts character vectors from one character set to another.
#' @param data Data into which the function is applied
#' @param model Path to the text file which contains the model for transliteration
#' @keywords ELAN linguistics
#' @export
#' @examples
#' transliterate("тест", "kpv-cyr2ipa")

transliterate <- function(data, model){
        pattern <- read.csv(file = model, sep = ",")
        cyr <- as.character(pattern[,1])
        lat <- as.character(pattern[,2])
        mgsub(cyr, lat, data)
}
