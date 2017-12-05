class Student < ActiveRecord::Base
    # require 'roo'
    belongs_to :section
    has_many :payments, :dependent => :destroy
    
    
    # def self.to_csv(options = {})
    #   CSV.generate(options) do |csv|
    #       csv << column_names
    #       all.each do |student|
    #           csv << student.attributes.values_at(*column_names)
    #       end
    #   end
    # end
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        if spreadsheet
            header = spreadsheet.row(1)
            (2..spreadsheet.last_row).each do |i|
                header = spreadsheet.row(i)
                student = new
                student.admission_number = header[0]
                student.name = header[1]
                student.tuition_fee = header[2]
                section = Section.find_by(name: header[3])
                if section.present?
                    student.section_id = section.id
                else
                   Section.create(name: header[3])
                   student.section_id = Section.find_by(name: header[3]).id
                end
                student.save!
                # end
            end
        end
    end    
    def self.open_spreadsheet(file)
        if file
            case File.extname(file.original_filename)
            when ".csv" then Csv.new(file.path, nil, :ignore)
            when ".xls" then Excel.new(file.path, nil, :ignore)
            when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
            else raise "Unknown file type: #{file.original_filename}"
            end
        end
    end
end
