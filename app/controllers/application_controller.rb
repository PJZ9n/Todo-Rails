class ApplicationController < ActionController::Base
  around_action :set_locale

  def set_locale(&action)
    locale = params[:locale]
    unless I18n.locale_available?(locale)
      locale = I18n.default_locale
    end
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    {locale: params[:locale]}
  end
end
