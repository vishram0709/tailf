class LogController < ActionController::Base

  def tail
    file_path = "log/feature.log"
    file=File.open(file_path,"r")
    file.seek(0, IO::SEEK_END)
    $redis.set("#{file_path.to_s}",file.pos)
    ::BgWorker.perform_in(2.seconds, file_path)
    file.close
  end

end
