class Post < ApplicationRecord
  # belongs_to :user
  belongs_to :bot
  belongs_to :lesson


  def parse_rss
  	if self.rss == true
  		url = self.link
	    Feedjira::Feed.add_common_feed_element 'content'
	    Feedjira::Feed.add_common_feed_element 'img'
	    Feedjira::Feed.add_common_feed_element 'link'
	    Feedjira::Feed.add_common_feed_element 'image'
	    @feed = Feedjira::Feed.fetch_and_parse url
	    puts @feed.inspect
	    return @feed.entries.take(10)
  	end
  end

end
