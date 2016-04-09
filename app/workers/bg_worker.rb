class BgWorker
  include Sidekiq::Worker
  sidekiq_options queue: :high

  def perform(file_path)
    ## FileWatcher
    file=File.new(file_path)
    file.seek(0, IO::SEEK_END)
    current_offset = file.pos
    previous_offset = $redis.get("#{file_path.to_s}").to_i
    if current_offset != previous_offset
      $redis.set("#{file_path.to_s}", current_offset)
      file.seek(previous_offset)
      puts file.readlines
      ##OR
      #Hutch.publish("log", file_content)
      # OR
      # $redis.publish 'rt-change', msg.to_json

    end
    file.close
    ::BgWorker.perform_in(4.seconds, file_path)
  end


end
