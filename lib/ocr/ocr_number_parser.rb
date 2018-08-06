module OCR

  class OcrNumberParser
    attr_reader :ocr_number

    def initialize(ocr_number)
      @ocr_number = sanitize(ocr_number)
    end

    def parse   
      ocr_numbers.key(ocr_number)
    end

    def ocr_numbers
      {
        0 => zero,
        1 => one,
        2 => two,
        3 => three,
        4 => four,
        5 => five,
        6 => six,
        7 => seven,
        8 => eight,
        9 => nine
      }
    end

    def sanitize(ocr_number)
      ocr_number.gsub(/\n+/, '')
    end

    def zero
      sanitize <<-OCR_NUMBER
 _ 
| |
|_|
      OCR_NUMBER
    end

    def one
      sanitize <<-OCR_NUMBER
   
  |
  |
      OCR_NUMBER
    end

    def two
      sanitize <<-OCR_NUMBER
 _ 
 _|
|_ 
      OCR_NUMBER
    end

    def three
      sanitize <<-OCR_NUMBER
 _ 
 _|
 _|
      OCR_NUMBER
    end

    def four
      sanitize <<-OCR_NUMBER
   
|_|
  |
      OCR_NUMBER
    end

    def five
      sanitize <<-OCR_NUMBER
 _ 
|_ 
 _|
      OCR_NUMBER
    end

    def six
      sanitize <<-OCR_NUMBER
 _ 
|_ 
|_|
      OCR_NUMBER
    end

    def seven
      sanitize <<-OCR_NUMBER
 _ 
  |
  |
      OCR_NUMBER
    end

    def eight
      sanitize <<-OCR_NUMBER
 _ 
|_|
|_|
      OCR_NUMBER
    end

    def nine
      sanitize <<-OCR_NUMBER
 _ 
|_|
 _|
      OCR_NUMBER
    end
  end
end
