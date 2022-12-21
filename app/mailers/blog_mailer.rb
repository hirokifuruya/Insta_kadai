class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog

    mail to: blog, subject: "投稿完了メール"
  end
end
