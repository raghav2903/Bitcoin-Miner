defmodule Server do 
    @cookie :common_cookie
    @serverName :serverName
    
    def getCookie do
        @cookie
    end

    def getServerName do
        @serverName
    end
    
    def serverStart(pid, numOfZeroes) do
        {:ok, [{ip, _, _}, {_, _, _}]} = :inet.getif
        ip = "server@#{Misc.getIP(ip)}"

        #Create a server node
        {:ok, _} = Node.start(String.to_atom(ip))
        Node.set_cookie(getCookie())
        
        :global.register_name(getServerName(), pid)
        Miner.initWorkers(numOfZeroes, pid)
        receive do
            {:workersSpawned, numofZeroes} ->
                listen(numofZeroes)
        end
    end

    def listen(numofZeroes) do
        receive do
            {:bitCoin, bitCoin} ->
                IO.puts bitCoin

            {:request, clientPID} ->
                send clientPID, {:work, numofZeroes}
        end
        listen(numofZeroes)
    end

end