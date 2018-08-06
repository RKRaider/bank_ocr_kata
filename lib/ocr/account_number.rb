module OCR

  class AccountNumber
    ACCOUNT_NUMBER_LENGTH = 9
    OCR_HEIGHT = 3
    OCR_WIDTH = 3

    attr_reader :input

    def initialize(input)
      @input = input
    end

    def parse
      text_number = input.scan /.{#{OCR_WIDTH}}/

      (0...ACCOUNT_NUMBER_LENGTH).reduce([]) do |numbers, position|
        numbers << number_position(text_number, position)
      end
    end

    private

    def number_position(text_number, position)
        ocr_number = (0...OCR_HEIGHT).reduce('') do |ocr_sections, index|
          offset = position + (index * ACCOUNT_NUMBER_LENGTH)
          ocr_sections << text_number[offset]
        end
  
        ocr_number_parser = OcrNumberParser.new(ocr_number)
        ocr_number_parser.parse
    end
  end
end
