#Wordcloud of Top 75 Words in Hamlet

#Set the working directory
setwd("~/Desktop/R/Text_Analysis/data/Shakespearefolger/")

#Call libraries used in the script
library(wordcloud)
library(tm)

#Read in the text 
text_raw<-scan("Hamlet.txt", what="character", sep="\n")

#Create a corpus 
corpus <- Corpus(VectorSource(text_raw))

#Clean the corpus
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeWords, stopwords("SMART"))
corpus <- tm_map(corpus, removePunctuation)

wordcloud(corpus,random.order=FALSE,scale=c(3,.1),rot.per=0,
          max.words=75,colors=brewer.pal(8, "Dark2"))