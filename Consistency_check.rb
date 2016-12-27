//Ruby Application 
lines = []
truth = []
input_array = []
output_array = []
output_array1 = []

#opening the file
 file =  File.open("C:/Ruby22/CLIP.txt", "r")
   while ( line = file.gets)
    lines<<line
   end
 file.close
#putting whole data in array truth
for i in 3..lines.length-2
    truth[i-3]  = lines[i] 
end

#getting the number of inputs
input_number = lines[0][3,4]
puts "No. of Inputs:" +input_number.to_s
 input1 = input_number.to_i
 

#getting the number of outputs
output_number = lines [1][3,4]
puts "No. of Outputs:" +output_number.to_s
output1 = output_number.to_i
 
 #Displaying inputs
 puts"INPUTS: "
 for k in 0..truth.length-1
    input_array [k] = truth [k][0,input1]
 end
puts input_array 

#Displaying outputs

for k in 0..truth.length-1
    output_array1 [k] = truth [k][input1+1,input1+output1]
end

for k in 0..truth.length-1
    output_array [k] = output_array1 [k][0,output1]
end
puts "OUTPUTS:" 
puts output_array

##for the input
num=truth.length
col= input1

 
#for the output
num2=truth.length
col2=output1

##inputs in to checktable
checktable = []
checktable  = input_array 
#puts checktable
##outputs into checktable
checktable2 =[]
checktable2  = output_array 
#puts checktable2

puts "Input column: " +col.to_s
puts "Input rows: " +num.to_s
puts "Output column: " +col2.to_s
puts "Output rows: " +num2.to_s

#puts exit
##REGSTRING AND CHECKING

for i in 0..checktable.size-1
    for j in (i+1)..(checktable.size)
         
        #puts "cmp "+checktable[i].to_s+" "+checktable[j].to_s
        regString="\\A"
                #puts i,j
        for k in 0..col-1
            regString+="["
            if checktable[i][k]=="0"
                regString+="0-"
            end
            if checktable[i][k]=="1"
                regString+="1-"
            end
            if checktable[i][k]=="-"
                regString+="-10"
            end
            regString+="]"
        end
        regString+="\\z"
        
        #puts regString
        r=Regexp.new(regString)
        #puts r
        check=[]
         check = r.match(checktable[j])
         check1 = check.to_s
         #puts check1
        #puts check1.size
        
        
        if check1.size == col
            #puts checktable2[i]
            #puts checktable2[j]
            #puts "compatible data:"
            #puts check
            #puts "cmp "+checktable2[i]+" "+checktable2[j]
            regString2="\\A"
                #puts i,j
        for k in 0..col2-1
            regString2+="["
            if checktable2[i][k]=="0"
                regString2+="0-"
            end
            if checktable2[i][k]=="1"
                regString2+="1-"
            end
            if checktable2[i][k]=="-"
                regString2+="-10"
            end
            regString2+="]"
        end
        regString2+="\\z"
            
            #puts "OUTPUT REGSTRING"
            
            #puts regString2
            r2 =Regexp.new(regString2)
            #puts r2
            #puts checktable2[j]
            check2=[]
             check2 = r2.match(checktable2[j])
            checko = check2.to_s
            #puts checko.size
            #puts "l"
          
           
        if checko.size == col2
            #puts "DATA CORRECT"
            #puts i,j
            
        else
            puts "Inconsistency in row: "
            puts i,j
        end
        
        end
            
    end
    
end

exit
