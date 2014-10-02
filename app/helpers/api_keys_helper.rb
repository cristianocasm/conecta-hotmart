module ApiKeysHelper
  def active_tab(api)
    return true if api == params[:type]
  end
end
