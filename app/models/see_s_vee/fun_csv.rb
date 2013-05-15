module SeeSVee
  class FunCsv < ActiveRecord::Base
    attr_accessible :code, :name
    after_save do
      Resque.enqueue(SeeSVee::CsvGenerator, self.id)    
    end

    def generate
      set = eval(self.code)
      set.export_csv("csvs/#{self.name}.csv")
    end
  end
end
