\insert Task2.oz

declare GenerateOdd in

    fun lazy {GenerateOdd S E}
        if S =< E then
            if {Int.isOdd S} then
                S|{GenerateOdd S+2 E}
            else
                {GenerateOdd S+1 E} 
            end
        else
            nil
        end
    
    end
    
    
    {System.show {GenerateOdd ~3 10}.2.2.1}
    {System.show {GenerateOdd 3 3}}
    {System.show {GenerateOdd 2 2}}

    {System.showInfo thread {Product thread {GenerateOdd 0 1000} end} end}