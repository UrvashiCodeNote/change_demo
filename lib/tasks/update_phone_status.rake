namespace :update_phone_status do
  #midnight  12 am
  desc "Update status every 1 day at 12 am"
  task update_phone_number_status: :environment do
    puts "hello"
    byebug
    # recently_activated_numbers = ContactBook.where(created_at: Time.now..20.minute.ago)
    # recently_activated_numbers = ContactBook.where("created_at  >= ?", 1.hours.ago)

    recently_activated_numbers = ContactBook.where(created_at: Time.now..24.hours.ago)
    recently_activated_numbers.each do |ran|
      ran.update(status: "activated")
    end
  end
end