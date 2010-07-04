atom_feed do |feed|
  feed.title("Citing the Text: The Weblog of Andrew P. Brett")
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author { |author| author.name("Andrew P. Brett") }
    end
  end
end
