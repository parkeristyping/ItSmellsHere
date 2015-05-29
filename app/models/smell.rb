class Smell < ActiveRecord::Base
  belongs_to :user

  def time_ago
    time_ago = Time.now - self.created_at
    if time_ago < 60
      " just now"
    elsif time_ago < 60 * 60
      " #{(time_ago/60).to_i} minutes ago"
    elsif time_ago < 60 * 60 * 2
      " #{(time_ago/(60 * 60)).to_i} hour ago"
    elsif time_ago < 60 * 60 * 24
      " #{(time_ago/(60 * 60)).to_i} hours ago"
    elsif time_ago < 60 * 60 * 24 * 2
      " yesterday"
    else
      " #{(time_ago/(60 * 60 * 24)).to_i} days ago"
    end
  end

  def linkable_content
    self.content.gsub(/@(\w+)/, '<a href="http://twitter.com/\1">@\1</a>')
  end

end
