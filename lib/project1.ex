defmodule Project1 do
    
    def main(args) do
        {_,k,_} = OptionParser.parse(args)
        if length(k) != 1 do
            IO.inspect "Invalid Argument"
        else
            try do 
                k = String.to_integer(List.to_string(k))
                Server.serverStart(self(), k)
            rescue
                ArgumentError -> Client.clientStart(k)
            end
        end
    end

end
