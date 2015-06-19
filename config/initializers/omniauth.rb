Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b',
    :scope => "basic_read mood_read move_read sleep_read weight_read"
end
