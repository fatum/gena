every 1.day do
  rake "ap:cleanup_searches"
end

every 10.minutes do
  rake "ts:in" # Reindex sphinx
end
