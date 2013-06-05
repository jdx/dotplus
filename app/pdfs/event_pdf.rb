class EventPdf < Prawn::Document
  GUTTER = 28
  VGUTTER = 13.68
  MARGINS = [40.3, 22.3, 33.12, 9.24]
  NAMETAG_WIDTH = 167.76

  def initialize event
    @event = event

    margins = MARGINS
    margins[1] -= GUTTER/2
    margins[3] += GUTTER/2
    super(:margin => margins)

    event.attendees.sort_by(&:last_name).each_slice(8).each_with_index do |users,i|
      start_new_page unless i==0

      sheet(users)
    end
  end

  private

  def sheet users
    users.each_with_index do |user, i|
      column = i > 3 ? 1 : 0
      origin = [column * bounds.width/2, bounds.height - ((i % 4) * (167.76 + VGUTTER))]
      bounding_box(origin, width: bounds.width/2 - GUTTER, height: 167.76) do
        stroke_bounds
        nametag user
      end
    end
  end

  def nametag user
    image "app/assets/images/logo.png", width: 50, at: [bounds.width-49, bounds.height+1]
    bounding_box([10, cursor-10], width: bounds.width, height: bounds.height) do
      fill_color "DC143C"
      user.name.split(' ', 2).each do |name|
        text name, size: 30, style: :bold
      end
      fill_color "000000"
      text "@#{user.twitter}", size: 20
      event_role = user.event_role(@event)
      fill_color "DC143C"
      move_down 5
      text event_role.titleize, size: 20 if event_role
      fill_color "000000"
      badges(user)
    end
  end

  def badges(user)
    bounding_box [0, 70], width: bounds.width, height: 80 do
      font("vendor/assets/fonts/fontawesome-webfont.ttf") do
        text user.badges.pluck(:character).join, size: 50
      end
    end
  end
end
