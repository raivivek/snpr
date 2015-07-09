Rails.application.config.middleware.use OmniAuth::Builder do
  # all
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone",
    :scope => "basic_read move_read sleep_read weight_read"
  }
  # only move
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_move",
    :scope => "basic_read move_read"
  }
  # only sleep
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_sleep",
    :scope => "basic_read sleep_read"
  }
  # only weight
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_weight",
    :scope => "basic_read weight_read"
  }
  # move + sleep
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_move_sleep",
    :scope => "basic_read move_read sleep_read"
  }
  # move + weight
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_move_weight",
    :scope => "basic_read move_read weight_read"
  }
  # sleep + weight
  provider :jawbone,
    'b7yxY0T-o44',
    'e429ee055c056d1ef748271396a9de7b', {
    :name => "jawbone_sleep_weight",
    :scope => "basic_read sleep_read weight_read"
  }
end
