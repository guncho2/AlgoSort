class HeapArray 
    def print 
        puts @heap_array.to_s
    end

    def read_file(filename)

        @heap_array = File.readlines(filename)
        @heap_array.map! { |x| x.strip }

    end

    def heap_sort

        self.heapify
        the_end = @heap_array.length - 1

        while the_end > 0
            @heap_array[the_end], @heap_array[0] = @heap_array[0], @heap_array[the_end]
            the_end -= 1
            self.sift_down(0, the_end)
          end

        @heap_array

    end

    def heapify

        the_start = (@heap_array.length - 2) / 2

        while the_start >= 0
            self.sift_down(the_start, @heap_array.length - 1)
            the_start -= 1
        end

        @heap_array
    end

    def sift_down(the_start, the_end)
        root = the_start

        while root * 2 + 1 <= the_end
            child = root * 2 + 1
            swap = root

            if @heap_array[swap] < @heap_array[child]
                swap = child
            end

            if child + 1 <= the_end && @heap_array[swap] < @heap_array[child + 1]
                swap = child + 1

            end

            if swap != root
                @heap_array[root], @heap_array[swap] = @heap_array[swap], @heap_array[root]
                root = swap
              else
                return
            end
            
        end
    end
    
end






























# def heap_sort(list)  
#     count = list.length
  
#     heapify(list, count)
  
#     last = count - 1
#     while last > 0
#       p "#{list[last]}, #{list[0]}"
#       list[last], list[0] = list[0], list[last]
#       last -= 1
#       sift_down(list,0,last)
#     end
  
#     list
#   end
  
#   def heapify(list, count)  
#     start = (count - 2) / 2
  
#     while start >= 0
#       sift_down(list,start,count-1)
#       start -= 1
#     end
#   end
  
#   def sift_down(list, start, last)  
#     root = start
  
#     while root * 2 + 1 <= last
#       child = root * 2 + 1
#       swap = root
  
#       swap = child if list[swap] < list[child]
#       if child + 1 <= last && list[swap] < list[child+1]
#         swap = child + 1 
#       end
#       if swap != root
#         list[root], list[swap] = list[swap], list[root]
#         root = swap
#       else
#         return
#       end
#     end
#   end

