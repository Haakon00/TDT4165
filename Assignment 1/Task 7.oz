local Length in
    fun {Length List} Len in
        case List of Head|Tail then
            Len = 1+{Length Tail}
        else
            0
        end
    end

{System.showInfo {Length [1 2 3 4]}}
end   

local Take in
    fun {Take List Count}
        if Count == 0 then
            List.1
        else
            List.1|{Take List.2 Count-1}}|nil
        end
    end
    {System.showInfo {Take [1 2 3 4] 2}}
end

local Drop in
    fun {Drop List Count}
        case List of Head|Tail then
            if Count == 0 then
                List
            else
                {Drop Tail Count-1}
            end
        else
            nil
        end
    end
{System.showInfo {Drop [1 2 3 4] 2}}
end


local Append in
    fun {Append List1 List2}
        case List1 of Head|Tail then
            '|'(Head '|'{Append Tail List2})
        else
            case List2 of Head then
                nil
            else
                '|'(List1.1 '|'{Append List2 List1})
            end
        end
    end
    {System.showInfo {Append [1 2] [3 4]}}
end

local Member in
    fun {Member List Element}
        case List of Head|Tail then
            if Head==Element then
                "true"
            else
                {Member Tail Element}
            end
        else
            "false"
        end
    end
 {System.showInfo {Member [1 2] 0}}
end

local Position in
    fun {Position List Element} Count in
        Count = -1
        for X in List Break:Y do
        Count+=1
            if X==Element then
                {Y}
            end
        end
        Count
    end
 {System.showInfo {Position [1 2] 2}}
 end        

