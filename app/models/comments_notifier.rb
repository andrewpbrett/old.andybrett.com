class CommentsNotifier < ActionMailer::Base
  def comment_notification(post_title, comment_text, author)
    recipients "andybrett@gmail.com"
    from "comments@andrewpbrett.com"
    reply_to "andybrett@gmail.com"
    subject "New comment on Citing the Text: #{post_title}"
    body :post_title => post_title, :comment_text => comment_text, :author => author
  end
end
