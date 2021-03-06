class User < ApplicationRecord
    has_secure_password

    enum role: ["default", "user", "admin"]
end
