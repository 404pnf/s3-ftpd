require 'aws/s3'

class S3Driver
  def authenticate(username, password)
    yield username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end
  
  def put_file(path, tmp_file_path)
    AWS::S3::Base.establish_connection!(:access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY'])
    AWS::S3::S3Object.store(path, open(tmp_file_path), ENV['BUCKET'])

    yield File.size(tmp_file_path)
  end
  
  def bytes(path)
    yield nil
  end
  
  def change_dir(path)
    yield false
  end
  
  def dir_contents(path)
    yield []
  end
  
  def delete_dir(path)
    yield nil
  end
  
  def delete_file(path)
    yield false
  end
  
  def rename(from_path, to_path)
    yield false
  end
  
  def make_dir(path)
    yield false
  end
  
  def get_file(path)
    yield nil
  end
end