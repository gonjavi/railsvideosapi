class VideoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :url, :year, :author
end
