# DS 700, Assignment 2, Section 1
# Written by: Joseph Kerkhof
# Professor: Rakesh Kaushika

# Installing and requiring the packages we need for this problem
install.packages("twitteR")
install.packages("RCurl")
install.packages("tm")
install.packages("wordcloud")
require(twitteR)
require(RCurl)
require(tm)
require(wordcloud)

# My Twitter credentials
consumer_key <- 'Fpw40SRzv323Wh5O9P2hETyrC'
consumer_secret <- 'BRr3i6wHicXXHbPy58232mAyt0I96gQR7FjvnvejKxutSVhcsX'
access_token <- '133410003-BwOSCG4QZkZTeBDbLd99d6MDZjrhs1tALMG37Xfn'
access_secret <- 'gi9V6lmSx963T2CoVbytkbubG5roBUbERkdLXKc4DCfQl'

# Initializing the Twitter connection
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Get tweets from Twitter
bd_tweets <- searchTwitter("Wisconsin", n=1000, lang = "en")
bd_text <- sapply(bd_tweets, function(x) x$getText())

# Create a corpus
bd_corpus <- Corpus(VectorSource(bd_text))

# Clean up the data
bd_clean <- tm_map(bd_corpus, removePunctuation)
bd_clean <- tm_map(bd_clean, removeNumbers)
bd_clean <- tm_map(bd_clean, stripWhitespace)

# Clean the emojis out of the data which causes errors in the Word Cloud
bd_clean <- iconv(bd_clean, "latin1", "ASCII", sub="")

# Creating a WordCloud
wordcloud(bd_clean, random.order = F, max.words = 25, scale = c(3, 0.5), colors = rainbow(25))