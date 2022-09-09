require 'json'
class ENTITY
    attr_accessor :entities, :accesor, :alphabet

    def initialize(who_you_are)
        @entities ||=   [entropies: {i: [who_you_are]},
                        duplicates: {i: ["WHO ARE YOU?"]}]
        check_for_loading()
        puts @entities
        @accesor ||= nil
        tick(true) # meaning, to continue.
    end

    def check_for_loading()
        if File.file?('x-file.json')
            file = File.read('x-file.json')
            @entities = JSON.parse(file, symbolize_names: true)
        end
    end

    def tick(bools)
        save()
        get_input()
        #puts(@entities)
        update() unless !bools
    end

    def get_input()
        entrothpic = gets.chomp()
        entrothpic = entrothpic.split(/ /)
        entropy_1 ||= 0
        if entrothpic[0] == "2"
            erase_data() 
            update()
        end
        #puts(ipe,"IPE")
        exit if entrothpic[0] == "1"
        @accesor = entrothpic
        id = discernment(@entities, @accesor)
        # entropy = ascertainment_encapsulation(mb[0],entrothpic)
        @entities[0][(entrothpic[0]).to_sym] = ascertain(@entities[0],entrothpic,id)
        # @entities[0][@accesor[0].to_sym] = {entrothpic[0].to_sym => mb}
    end

    def ascertain(enty,enth,id)
        sample = enty
        sample[:entropies] = {enth[0].to_sym => enth}
        return sample[:entropies]
    end

    def discernment(enty,accs)
        # enty[0][0].find_value(accs[0])
        et = 0
        enty.each_with_index do |i, id|
            accs.each do |c|
                et += 1
                if i.has_key?(c.to_sym)
                    puts(enty[0][c.to_sym][c.to_sym].join(" ") + "ZORD")
                    return et
                end                
            end
        end
        #sampler can not shuffle. no sort...
        #sampler will contain all knowledge under a given, set.
        #sampler will then compare to another being's in-set. [self in witness]
    end

    def update()
        tick(true)
    end

    def erase_data()
        File.delete('x-file.json')
        @entities = [entropies: {i: ["ZORD"]},
                    duplicates: {i: ["WHO ARE YOU?"]}]
    end

    def save()
        File.write('x-file.json', JSON.dump(@entities))
    end
end


new_set = ENTITY.new("ZORD")

# puts(new_set.get_who(:you))