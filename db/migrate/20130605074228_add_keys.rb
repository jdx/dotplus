class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "badges_users", "badges", :name => "_badge_id_fk"
    add_foreign_key "badges_users", "users", :name => "_user_id_fk"
    add_foreign_key "attendances", "events", :name => "attendances_event_id_fk"
    add_foreign_key "attendances", "users", :name => "attendances_user_id_fk"
    add_foreign_key "events", "talks", :name => "events_advanced_talk_id_fk", :column => "advanced_talk_id"
    add_foreign_key "events", "talks", :name => "events_beginner_talk_id_fk", :column => "beginner_talk_id"
    add_foreign_key "events", "cities", :name => "events_city_id_fk"
    add_foreign_key "events", "locations", :name => "events_location_id_fk"
    add_foreign_key "events", "users", :name => "events_organizer_id_fk", :column => "organizer_id"
    add_foreign_key "events", "sponsors", :name => "events_sponsor_id_fk"
    add_foreign_key "locations", "cities", :name => "locations_city_id_fk"
    add_foreign_key "posts", "users", :name => "posts_user_id_fk"
    add_foreign_key "talks", "cities", :name => "talks_city_id_fk"
    add_foreign_key "talks", "users", :name => "talks_user_id_fk"
  end
end
