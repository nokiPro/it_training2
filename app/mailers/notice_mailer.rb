class NoticeMailer < ApplicationMailer
  def sendmail_blog(blog)
    @blog = blog #インスタンス変数に代入
    mail to: "noki.g2000@gmail.com", subject: "新規ブログが作成されました"
  end

  def sendmail_contact(contact)
    @contact = contact #インスタンス変数に代入
    mail to: "#{@contact.email}", subject: "お問い合わせが送信されました"
  end
end
