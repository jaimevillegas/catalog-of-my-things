require_relative '../label'

module LabelModule
  def list_all_labels(labels)
    if labels.empty?
      puts 'No labels found.'
    else
      labels.each do |label|
        puts "[#{label.id}] - Title: #{label.title}, color: #{label.color}"
      end
    end
  end
end
