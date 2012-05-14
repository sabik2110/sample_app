class AddDefaultUsers < ActiveRecord::Migration
  def self.up

    User.create :name => "Admin",
                :email => "admin@admin.com",
                :created_at => "2012-05-07 15:57:23.419625",
                :updated_at => "2012-05-07 15:57:23.419625",
                :encrypted_password => "a3f14db630df0ce43aed861336a1eb20a3108d0f80c4566c69819e75ee8629ed",
                :salt => "509e1a67c76767a39035ef3a378ad49b14a2a9010287443a4f67d3ff4a1e8ad8",
                :admin => "t"

  end

  def self.down

  end
end
