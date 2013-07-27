require "aws/s3"
class Array
  def export_csv(filename)
    csv_string = ""
    self.each do |e|
      csv_string << e.to_csv
    end
    config = YAML.load(File.open("#{Rails.root}/config/s3.yml"))[Rails.env]
    AWS::S3::Base.establish_connection!(
      :access_key_id => config['access_key_id'],
      :secret_access_key => config['secret_access_key']
    )
    AWS::S3::S3Object.store(filename, csv_string, config['bucket'])
  end
  
  def uniq_by!(&blk)
    transforms = []
    self.each do |el|
      should_remove = transforms.include?(t=blk[el])
      transforms << t
      self.delete(el) if should_remove
    end
  end
  
  def mean
    inject(:+).to_f / size
  end
  
  def car
    self[0]
  end
  
  def cdr
    self[1..self.length-1]
  end
  
  def each_perm
    if self.size == 1
      yield self
    else
      self.each_index do |i|
        tmp, e = self.dup, self[i]
        tmp.delete_at(i)
        tmp.each_perm do |x|
          yield e.to_a + x
        end
      end
    end
  end
end
