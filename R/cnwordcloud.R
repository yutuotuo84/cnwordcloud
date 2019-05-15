#' This function allows you to generate a wordcloud in Chinese.
#' @name cnwordcloud
#' @param text a vector of strings. 
#' @param stopwords a dictionary of stopwords, default to cn_stopwords.
#' @param nwords the number of words to include in the wordcloud, default to 50.
#' @return none.
#' @keywords wordcloud, Chinese.
#' @examples 
#' library(cnwordcloud)
#' data(sample_text)
#' cnwordcloud(sample_text)
#' @export
cnwordcloud <- function(text, stopwords=NULL, nwords=50){
  # segment text 
  if(is.null(stopwords)){
    data(cn_stopwords, envir = environment())
    stopwords <- cn_stopwords
  }
  words <- jiebaR::qseg[text]
  # remove stopwords 
  words <- words[!(words %in% stopwords)]
  # remove numbers 
  words <- words[!(grepl("^[0-9]+$", words))]
  # calculate word frequency 
  freq <- table(words)
  # sort the frequency table in descending order
  freq <- sort(freq, decreasing = TRUE)
  # convert the frequency table to DataFrame 
  freq_table <- data.frame(freq)
  # draw wordcloud 
  wordcloud2::wordcloud2(freq_table[1:nwords,])
  
  
}