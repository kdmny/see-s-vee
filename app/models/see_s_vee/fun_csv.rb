require "aws/s3"
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

    def url
      config = YAML.load(File.open("#{Rails.root}/config/s3.yml"))[Rails.env]
      bucket = config["bucket"]
      key = name
      s3 = AWS::S3.new
      obj = s3.buckets[bucket].objects["csvs/#{key}.csv"]
      obj.url_for(:read)
    end
  end
end
