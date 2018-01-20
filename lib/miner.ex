defmodule Miner do
    @numofWorkers 10

    def initWorkers(numofZeroes, pid) do 
       Enum.map(1..@numofWorkers, fn spawnPID -> spawn(Worker, :mine, [pid, numofZeroes]) end)
       #Enum.map(1..@numofWorkers, fn workers -> spawn(Worker, :mine, [pid, numofZeroes, workers - 1]) end)
       send pid, {:workersSpawned, numofZeroes}
    end

end
