class DeviseCustomMailer < Devise::Mailer
  default template_path: 'devise/mailer'
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    super
  end

  def email_changed(record, opts={})
    super
  end

  def password_change(record, opts={})
    super
  end

  def reset_password_instructions(record, token, opts={})
    super
  end

  def unlock_instructions(record, token, opts={})
    super
  end
end
