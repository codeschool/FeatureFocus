class Search
  def self.for(keyword)
    keyword_search = "%#{keyword.downcase}%"

    Project.where('lower(title) LIKE ?', keyword_search) +
      Comment.where('lower(body) LIKE ?', keyword_search) +
      Message.where('lower(title) LIKE :keyword OR lower(body) LIKE :keyword', { keyword: keyword_search })
  end
end
