def caesar_cipher(the_string, shift)
  
  alphabets = ('a'..'z').to_a
  uppercase_alphabets = ('A'..'Z').to_a  # ✅ Handle uppercase letters
  numbers = (1..26).to_a

  full_list = alphabets.zip(numbers).to_h
  uppercase_full_list = uppercase_alphabets.zip(numbers).to_h  # ✅ Uppercase mapping
  new_array = []
  
  return "" if the_string.strip.empty?  # ✅ Handle empty string

  shift = shift % 26  # ✅ Normalize large/small shifts

  new_string = the_string.chars  # ✅ Preserve spaces and special characters

  if the_string.is_a?(String)
    for ele in new_string
      if full_list[ele]  # ✅ Handle lowercase letters
        new_shift = shift + full_list[ele]

        # Check if new_shift is positive
        if new_shift > 0
          until new_shift.between?(1,26)
            new_shift -= 26
          end
        elsif new_shift < 0  # Check if new_shift is negative
          until new_shift.between?(1,26)
            new_shift += 26
          end
        end

        new_array.append(full_list.key(new_shift))

      elsif uppercase_full_list[ele]  # ✅ Handle uppercase letters
        new_shift = shift + uppercase_full_list[ele]

        if new_shift > 0
          until new_shift.between?(1,26)
            new_shift -= 26
          end
        elsif new_shift < 0
          until new_shift.between?(1,26)
            new_shift += 26
          end
        end

        new_array.append(uppercase_full_list.key(new_shift))

      else
        new_array.append(ele)  # ✅ Keep spaces, numbers, and symbols unchanged
      end
    end  # Closes the for loop

  else 
    return "Not a string!"
  end

  return new_array.join("")  # ✅ Ensure function returns the result
end



