class Person
    attr_accessor :first_name, :last_name, :city, :birthdate
    def initialize(h)
        h.each {|k,v| public_send("#{k}=",v)}
    end
end