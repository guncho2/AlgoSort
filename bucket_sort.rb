class BucketArray

    def print

        puts @bucket_array.to_s

    end


    def read_file(filename)

        @bucket_array = File.readlines(filename)
        @bucket_array.map! { |x| x.strip.to_i }

    end

    def bucket_sort

        n = @bucket_array.length-1
        m = 100
        buckets = Array.new(m)

        for j in 0...m do
            buckets[j] = 0
        end

        for i in 0...n do
            buckets[@bucket_array[i]] +=1
        end

        i = 0

        for j in 0...m do
            for k in 0...buckets[j] do
                @bucket_array[i] = j
                i += 1
            end
        end

        @bucket_array

    end

end



























# Bucket sort implementation. Most examples set the default bucket size to 5.
# def bucket_sort(array, bucket_size = 5)

#     confirming we have a sortable array that needs some sortin'
#     if array.empty? || array.length == 1
#         return array
#     end

#     Finding min and max values in array. Feel fre to simply use 
#the min and max array methods Ruby is kind enough to give us. I just did it manually becauase...well, I just did. 
#     min_value = array[0]
#     max_value = array[0] 

#     array.each do |item| 
#         if item < min_value
#             min_value = item
#         elsif item > max_value
#             max_value = item
#         end
#     end 

#     setting up buckets, which we will then populate with input array data
#     bucket_count = ((max_value - min_value) / bucket_size).floor + 1
#     bucket_array = Array.new(bucket_count)

#     (0..bucket_array.length - 1).each do |i|
#         bucket_array[i] = []
#       end

#     Filling the buckets with the elements from the input array
#     array.each do |item|
#         bucket_array[((item - min_value)/bucket_size).floor] << item
#     end 

#     Sorting the buckets using insertion sort
#     sorted_array = []

#     bucket_array.each do |bucket|  
#         new = insertion_sort(bucket)
#         sorted_array.concat(new)
#     end

#     return sorted_array

# end

# def insertion_sort(array)
#     i=0
#     while i < array.length-1
#         j=i
#         while j >= 0 
#             if array[j] > array[j+1]
#             temp = array[j]
#             array[j]=array[j+1]
#             array[j+1]=temp 
#             end 
#             j-=1
#         end 
#         i+=1
#     end 
#     return array
# end