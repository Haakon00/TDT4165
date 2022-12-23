local PrintGreater in 
proc {PrintGreater Number1 Number2}
    if Number2 > Number1 then
        {System.showInfo Number2}
    else
        {System.showInfo Number1}
    end
end

{PrintGreater 1000 10}
end