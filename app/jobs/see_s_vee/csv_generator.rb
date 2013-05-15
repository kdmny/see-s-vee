module SeeSVee::CsvGenerator
  @queue = :see_s_vee_generator  
  def self.perform(csv_id)
    csv = SeeSVee::FunCsv.find(csv_id)
    csv.generate
  end
end
