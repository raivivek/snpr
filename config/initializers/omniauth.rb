Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone",
    :scope => "basic_read move_read sleep_read weight_read"
  }

  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_move",
    :scope => "basic_read move_read"
  }
end
