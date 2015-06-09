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

  def open_hours park
    open = to_twelve_hours park.opening_time
    close = to_twelve_hours park.closing_time

    return "#{open[0]}:00#{open[1]}-#{close[0]}:00#{close[1]}"
  end

  def to_twelve_hours hour
    if hour == 0
      return [12, "am"]
    elsif hour < 13
      return [hour, "am"]
    else
      return [hour - 12, "pm"]
    end
  end

end
