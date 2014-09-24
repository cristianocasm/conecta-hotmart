module ApiKeysHelper
  def active_tab(api)
    true if params[:api] == api
  end
end
