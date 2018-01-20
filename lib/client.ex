defmodule Client do 
    
    defp getPID do
        :global.whereis_name(Server.getServerName())
    end
    
    def clientStart(serverIP) do
        {:ok, [{clientIP, _, _}, {_, _, _}]} = :inet.getif
        clientIP = "client@#{Misc.getIP(clientIP)}"
        serverIP = "server@#{serverIP}"

        #Create a client node and connect to server
        {:ok, _} = Node.start(String.to_atom(clientIP))
        Node.set_cookie(Server.getCookie)
        Node.connect(String.to_atom(serverIP))
        
        :global.sync
        serverPID = getPID()
        send serverPID, {:request, self()}
        listen(serverPID)
    end

    def listen(serverPID) do
        receive do
            {:work, numofZeroes} ->
                Miner.initWorkers(numofZeroes, self())
                
            {:bitCoin, bitCoin} ->
                send serverPID, {:bitCoin, bitCoin}
                
            {_,  _}->
                listen(serverPID)
        end
        listen(serverPID)
    end

end