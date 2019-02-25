module UserInfo
    def get_user
        Thread.current[:user_id]
    end
    
    def self.get_user=(user_id)
        Thread.current[:user_id] = user_id
    end
end