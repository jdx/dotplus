class AddBadgesToUsers < ActiveRecord::Migration
  def up
    create_table :badges do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.text   :description, null: false
      t.string :character, null: false

      t.timestamps null: false
    end
    create_table :badges_users do |t|
      t.references :badge, null: false, index: true
      t.references :user, null: false, index: true
    end
    Badge.create!(name: "Lusher", description: "Said something silly after a few brews", icon: 'icon-beer', character: '')
    Badge.create!(name: "Snowflaker", description: "RSVPed but did not show up", icon: 'icon-asterisk', character: '')
    Badge.create!(name: "Thumber", description: "Received kudos from another attendee", icon: 'icon-thumbs-up', character: '')
    Badge.create!(name: "Flamer", description: "Started a fiery discussion", icon: 'icon-fire-extinguisher', character: '')
    Badge.create!(name: "Rocketer", description: "Attended the first dotplus in a city", icon: 'icon-rocket', character: '')
    Badge.create!(name: "Speaker", description: "Spoke at an event", icon: 'icon-bullhorn', character: '')
    Badge.create!(name: "Globetrotter", description: "Attended events in 2 different cities", icon: 'icon-globe', character: '')
    Badge.create!(name: "Achiever", description: "Gave a talk of the year", icon: 'icon-trophy', character: '')
    Badge.create!(name: "Hacker", description: "Committed to the dotplus codebase", icon: 'icon-github', character: '')
  end

  def down
    drop_table :badges_users
    drop_table :badges
  end
end
