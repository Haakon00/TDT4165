local Factorial in 
    fun {Factorial N} Result in
        if N==0 then
            1
        else
        Result = N*{Factorial N-1}
        end
    end
{System.showInfo {Factorial 10}}
end

