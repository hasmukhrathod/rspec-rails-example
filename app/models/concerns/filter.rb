module Filter
  extend ActiveSupport::Concern
  
  def filter_words
    cuss_words.each do |cuss, filter|
      self.body.gsub!(/#{cuss}/,filter)  # Changed from gsub
    end
  end
  
  private 
    def cuss_words
      {"Shit": "****", "Fuck":  "****"}
    end  
  
end