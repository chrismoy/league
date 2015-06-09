module ParksHelper
  $app_blue = "#5481DD"
  $app_red = "#EB6874"
  # Takes in the count of players and returns a color
  def assign_game_color count
    case count
    when 0
      return "transparent"
    when 6
      return $app_red
    else
      return $app_blue
    end
  end

  def assign_background_image park
    image_style = "background-image: url(/assets/"
    image_style += "#{park.name.camelize(:lower).gsub(' ', '')}"
    image_style += ".jpg)"

    image_style
  end
end
